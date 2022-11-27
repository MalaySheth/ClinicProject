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
                    sql = string.Format("insert into Patients(UsersNo,FullName,Adress,PostalCode,DateOfBirth,PhoneNumber,IsDeleted) values ({0},@FullName,@Adress,@PostalCode,@DateOfBirth,@PhoneNumber,'false');Select @@Identity as 'Identity'", UsersId);
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
            catch (Exception ex)
            {

                trans.Rollback();
                db.cn.Close();
                return 0;
            }
        }

        public bool UpdatePatients(string FullName,string Adress,string PostalCode,string Birthdate,string PhoneNumber,string email,bool isactive,int patientid)
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
                cmd.Parameters.AddWithValue("@IsActive", isactive);
                cmd.Parameters.AddWithValue("@FullName", FullName);
                cmd.Parameters.AddWithValue("@Adress", Adress);
                cmd.Parameters.AddWithValue("@PostalCode", PostalCode);
                cmd.Parameters.AddWithValue("@DateOfBirth", Birthdate);
                cmd.Parameters.AddWithValue("@PhoneNumber", PhoneNumber);
                cmd.Parameters.AddWithValue("@Email", email);
                int UsersId = GetUsersIdbyPatientId(patientid,cmd);
                if (db.cn.State != ConnectionState.Open)
                {
                    db.cn.Open();
                }
                string sql = string.Format("Update  Users SET Email=@Email,IsActive=@IsActive where UsersId={0}", UsersId);
                cmd.CommandText = sql;
                RowsCount += int.Parse(cmd.ExecuteNonQuery().ToString());
                if(RowsCount>0)
                {
                    if (db.cn.State != ConnectionState.Open)
                    {
                        db.cn.Open();
                    }
                    string sql2 = string.Format("Update  Patients SET FullName=@FullName,Adress=@Adress,PostalCode=@PostalCode,DateOfBirth=@DateOfBirth,PhoneNumber=@PhoneNumber  where UsersNo={0}", UsersId);
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
            catch (Exception ex)
            {

                trans.Rollback();
                db.cn.Close();
                return false;
            }
        }

        public int GetUsersIdbyPatientId(int patientid,SqlCommand cmd)
        {
            try
            {
                string sql = string.Format("select UsersNo from Patients where PatientsId={0}", patientid);
                cmd.CommandText = sql;
                return int.Parse(cmd.ExecuteScalar().ToString());
            }
            catch(Exception ex)
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


        public DataTable GetPatientInfoByUserId(int userid)
        {
            string sql = string.Format("select * From vwFullPatientInfo where UsersNo={0}", userid);
            return db.ExecuteQuery(sql);
        }

        public DataTable GetPatientInfoByPatientId(int patientid)
        {
            string sql = string.Format("select * From vwFullPatientInfo where PatientsId={0}", patientid);
            return db.ExecuteQuery(sql);
        }

        public DataTable SearchPatients(string fullName, string email, string adress, string phoneNumber)
        {
            try
            {
                string sql = "", qryFullName = "", qryAdress = "", qryEmail = "", qryPhoneNumber = "";
                bool FirstArg = true;
                if (!string.IsNullOrEmpty(fullName))
                {
                    if (FirstArg)
                    {
                        qryFullName = string.Format("where FullName Like'{0}%'", fullName);
                        FirstArg = false;
                    }
                    else
                    {
                        qryFullName = string.Format("and FullName Like'{0}%'", fullName);
                    }
                }

                if (!string.IsNullOrEmpty(email))
                {
                    if (FirstArg)
                    {
                        qryEmail = string.Format("where Email Like '{0}%'", email);
                        FirstArg = false;
                    }
                    else
                    {
                        qryEmail = string.Format("and Email Like '{0}%'", email);
                    }
                }

                if (!string.IsNullOrEmpty(phoneNumber))
                {
                    if (FirstArg)
                    {
                        qryPhoneNumber = string.Format("where PhoneNumber Like '%{0}'", phoneNumber);
                        FirstArg = false;
                    }
                    else
                    {
                        qryPhoneNumber = string.Format("and PhoneNumber Like '%{0}'", phoneNumber);
                    }
                }

                if (!string.IsNullOrEmpty(adress))
                {
                    if (FirstArg)
                    {
                        qryAdress = string.Format("where Adress Like '{0}%'", adress);
                        FirstArg = false;
                    }
                    else
                    {
                        qryAdress = string.Format("and Adress like '{0}%'", adress);
                    }
                }

                sql = string.Format("select * from vwFullPatientInfo {0} {1} {2} {3}", qryFullName, qryEmail, qryPhoneNumber, qryAdress);
                return db.ExecuteQuery(sql);

            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
        }

        public bool HardDeletePatient(int patientsId)
        {
            if (db.cn.State != ConnectionState.Open)
            {
                db.cn.Open();
            }

            SqlTransaction trans = db.cn.BeginTransaction();
            try
            {
                int RowsCount = 0;
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = db.cn;
                cmd.Transaction = trans;

                int UserId = GetUsersIdbyPatientId(patientsId, cmd);
                string sql = string.Format("delete from Patients where PatientsId={0}", patientsId);
                cmd.CommandText = sql;
                RowsCount += int.Parse(cmd.ExecuteNonQuery().ToString());

                string sql2 = string.Format("delete from Users where UsersId={0}", UserId);
                cmd.CommandText = sql2;
                RowsCount += int.Parse(cmd.ExecuteNonQuery().ToString());

                if (RowsCount > 0)
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
            catch (Exception)
            {

                trans.Rollback();
                db.cn.Close();
                return false;
            }
        }

        public int GetTotalCountOfPatients()
        {
            string sql = string.Format("select COUNT(*) From Patients");
            return int.Parse(db.ExecuteScalar(sql).ToString());
        }
    }
}

