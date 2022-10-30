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
    public class clsCounselor
    {
        DatabaseClass db = new DatabaseClass();


        public int InsertCounselors(string FullName, string Adress, string PostalCode, string Birthdate, string PhoneNumber, string Password, string email, bool IsApproved, string Registration_Approval_DateTime,bool IsActive, string RegistrationNumber)
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
                cmd.Parameters.AddWithValue("@RegistrationNumber", RegistrationNumber);

                cmd.Parameters.AddWithValue("@Registration_Approval_DateTime", IsApproved ? DatabaseClass.FormatDateTimeArEgMDY(DateTime.Parse(Registration_Approval_DateTime).ToString()) : Registration_Approval_DateTime);


                sql = string.Format("Insert Into Users(Email,Password,RoleNo,IsActive) values (@Email,@Password,3,'{0}');Select @@Identity as 'Identity'",IsActive);
                cmd.CommandText = sql;
                int UsersId = int.Parse(cmd.ExecuteScalar().ToString());

                if (UsersId > 0)
                {
                    sql = string.Format("insert into Counselors(UsersNo,FullName,Adress,PostalCode,DateOfBirth,PhoneNumber,Registration_Approval_DateTime,IsApproved,RegistrationNumber) values ({0},@FullName,@Adress,@PostalCode,@DateOfBirth,@PhoneNumber,@Registration_Approval_DateTime,'{1}',@RegistrationNumber);Select @@Identity as 'Identity'", UsersId,IsApproved);
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

        public bool UpdateCounselors(string FullName, string Adress, string PostalCode, string Birthdate, string PhoneNumber, string Password, string email, bool isactive, bool IsApproved, string Registration_Approval_DateTime,string RegistrationNumber, int Counselorid)
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
                cmd.Parameters.AddWithValue("@FullName", FullName);
                cmd.Parameters.AddWithValue("@Adress", Adress);
                cmd.Parameters.AddWithValue("@PostalCode", PostalCode);
                cmd.Parameters.AddWithValue("@DateOfBirth", Birthdate);
                cmd.Parameters.AddWithValue("@PhoneNumber", PhoneNumber);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@IsApproved", IsApproved);
                cmd.Parameters.AddWithValue("@RegistrationNumber", RegistrationNumber);

                cmd.Parameters.AddWithValue("@Registration_Approval_DateTime", IsApproved ? DatabaseClass.FormatDateTimeArEgMDY(DateTime.Parse(Registration_Approval_DateTime).ToString()) : Registration_Approval_DateTime);
                int UsersId = GetUsersIdbyCounselorId(Counselorid);
                string sql = string.Format("Update  Users SET Email=@Email,Password=@Password,IsActive='{1}' where UserId={0}", UsersId,isactive);
                cmd.CommandText = sql;
                RowsCount += int.Parse(cmd.ExecuteNonQuery().ToString());
                if (RowsCount > 0)
                {
                    string sql2 = string.Format("Update  Counselors SET FullName=@FullName,Adress=@Adress,PostalCode=@PostalCode,DateOfBirth=@DateOfBirth,PhoneNumber=@PhoneNumber,Registration_Approval_DateTime=@Registration_Approval_DateTime,IsApproved='{1}',RegistrationNumber=@RegistrationNumber where UserId={0}", UsersId,IsApproved);
                    cmd.CommandText = sql2;
                    RowsCount += int.Parse(cmd.ExecuteNonQuery().ToString());
                    if (RowsCount > 1)
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

        public int GetUsersIdbyCounselorId(int Counselorid)
        {
            try
            {
                string sql = string.Format("select UsersNo from Counselors where CounselorsId={0}", Counselorid);
                return int.Parse(db.ExecuteScalar(sql).ToString());
            }
            catch
            {
                return 0;
            }
        }

        public DataTable GetAllCounselors()
        {
            try
            {
                string sql = "select * vwFullCounselorInfo";
                return db.ExecuteQuery(sql);
            }
            catch (Exception)
            {

                throw;
            }
        }


        public DataTable GetCounselorInfoByUserId(int userid)
        {
            string sql = string.Format("select * From Counselors where UsersNo={0}", userid);
            return db.ExecuteQuery(sql);
        }
    }
}
