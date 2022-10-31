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
    public class clsUsers
    {
        DatabaseClass db = new DatabaseClass();
        public DataTable Login(string Email, string Password,int roleno)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Parameters.Add("@Email", SqlDbType.VarChar, 100).Value = Email;
                cmd.Parameters.Add("@Password", SqlDbType.VarChar, 100).Value = Password;
                cmd.CommandText = string.Format("SELECT * FROM Users WHERE Email=@Email AND Password=@Password and IsActive=1 and RoleNo={0}",roleno);
                cmd.Connection = db.cn;
                return db.ExecuteQuery(cmd);
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
        }


        public bool UpdateUserPassword(string Password, int UserId)
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
                cmd.Parameters.AddWithValue("@UserId", UserId);
                string sql = string.Format("Update  Users SET Password=@Password where UserId=@UserId");
                cmd.CommandText = sql;
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
            catch (Exception ex)
            {
                trans.Rollback();
                db.cn.Close();
                throw new Exception(ex.Message);
            }
        }
  
        public DataTable GetUserbyId(int UserId)
        {
            try
            {
                string sql = string.Format("select * from Users where UserId={0}", UserId);
                return db.ExecuteQuery(sql);
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
        }

        public bool UpdateLastLogin(int UserId)
        {
            int rowscount=0;
            string sql = string.Format("Update Users set last_login_datetime=getdate() where UsersId={0}", UserId);
            rowscount += db.ExecuteNonQuery(sql);
            if (rowscount > 0)
                return true;
            else
                return false;

        }
    }
}
