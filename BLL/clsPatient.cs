using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    
    public class clsPatient
    {
        DatabaseClass db = new DatabaseClass();


        public int InsertPatients(string FullName, string Adress, string PostalCode,string Birthdate,string PhoneNumber,string Password,string email)
        {
            if (db.cn.State != ConnectionState.Open)
            {
                db.cn.Open();
            }

            SqlTransaction trans = db.cn.BeginTransaction();
            try
            {
                string sql = "";
                int rowscount = 0;
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = db.cn;
                cmd.Transaction = trans;
                cmd.Parameters.AddWithValue("@Password", Password);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@FullName", FullName);
                cmd.Parameters.AddWithValue("@Adress", Adress);
                cmd.Parameters.AddWithValue("@PostalCode", PostalCode);
                cmd.Parameters.AddWithValue("@DateOfBirth", DatabaseClass.FormatDateArEgMDY(DateTime.Parse(Birthdate).ToShortDateString()));
                cmd.Parameters.AddWithValue("@PhoneNumber", PhoneNumber);


                sql = string.Format("Insert Into Users(Email,Password,RoleNo) values (@Email,@Password,4);Select @@Identity as 'Identity'");
                cmd.CommandText = sql;
                int UsersId = int.Parse(cmd.ExecuteScalar().ToString());

                if (UsersId > 0)
                {
                    sql = string.Format("insert into Patients(UsersNo,FullName,Adress,PostalCode,DateOfBirth,PhoneNumber,IsDeleted) values ({0},@FullName,@Adress,@PostalCode,@DateOfBirth,@PhoneNumber);Select @@Identity as 'Identity'", UsersId);
                    cmd.CommandText = sql;
                    rowscount += int.Parse(cmd.ExecuteScalar().ToString());
                    if (rowscount > 0)
                    {
                        trans.Commit();
                        db.cn.Close();
                        return UsersId;
                    }
                    else
                    {
                        trans.Rollback();
                        db.cn.Close();
                        return 0;
                    }

                }
                else
                {
                    trans.Rollback();
                    db.cn.Close();
                    return 0;
                }




            }
            catch (Exception)
            {

                trans.Rollback();
                db.cn.Close();
                return 0;
            }
        }

        public bool UpdatePatients(string FullName,string Adress,string PostalCode,string Birthdate,string PhoneNumber,string Password,string email,bool isactive,int patientid)
        {
            if (db.cn.State != ConnectionState.Open)
            {
                db.cn.Open();
            }

            SqlTransaction trans = db.cn.BeginTransaction();
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = db.cn;
                cmd.Transaction = trans;
                int RowsCount = 0;
                cmd.Parameters.AddWithValue("@Password", Password);
                cmd.Parameters.AddWithValue("@IsActive", isactive);
                cmd.Parameters.AddWithValue("@FullName", FullName);
                cmd.Parameters.AddWithValue("@Adress", Adress);
                cmd.Parameters.AddWithValue("@PostalCode", PostalCode);
                cmd.Parameters.AddWithValue("@DateOfBirth", Birthdate);
                cmd.Parameters.AddWithValue("@PhoneNumber", PhoneNumber);
                cmd.Parameters.AddWithValue("@Email", email);
                int UsersId = GetUsersIdbyPatientId(patientid);
                string sql = string.Format("Update  Users SET Email=@Email,Password=@Password,IsActive=@IsActive where UserId={0}", UsersId);
                cmd.CommandText = sql;
                RowsCount += int.Parse(cmd.ExecuteNonQuery().ToString());
                if(RowsCount>0)
                {
                    string sql2 = string.Format("Update  Patients SET FullName=@Password,IsActive=@IsActive where UserId={0}", UsersId);
                    cmd.CommandText = sql2;
                    RowsCount += int.Parse(cmd.ExecuteNonQuery().ToString());
                    if(RowsCount>1)
                    {
                        trans.Commit();
                        db.cn.Close();
                        return true;
                    }
                    else
                    {
                        trans.Rollback();
                        db.cn.Close();
                        return false;
                    }
                }
                else
                {
                    trans.Rollback();
                    db.cn.Close();
                    return false;
                }
            }
            catch (Exception)
            {

                trans.Rollback();
                db.cn.Close();
                return false;
            }
        }

        public int GetUsersIdbyPatientId(int patientid)
        {
            try
            {
                string sql = string.Format("select UsersNo from Patients where PatientsId={0}", patientid);
                return int.Parse(db.ExecuteScalar(sql).ToString());
            }
            catch
            {
                return 0;
            }
        }

        public DataTable GetAllPatients()
        {
            try
            {
                string sql = "select * vwFullPatientInfo";
                return db.ExecuteQuery(sql);
            }
            catch (Exception)
            {

                throw;
            }
        }

      
    }
}
