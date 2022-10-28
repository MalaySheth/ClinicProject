﻿using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class clsDoctor
    {
        DatabaseClass db = new DatabaseClass();


        public int InsertDoctors(string FullName, string Adress, string PostalCode, string Birthdate, string PhoneNumber, string Password, string email,bool IsApproved,string Registration_Approval_DateTime)
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
                cmd.Parameters.AddWithValue("@IsApproved", IsApproved);

                cmd.Parameters.AddWithValue("@Registration_Approval_DateTime",IsApproved?DatabaseClass.FormatDateTimeArEgMDY(DateTime.Parse(Registration_Approval_DateTime).ToString()):Registration_Approval_DateTime);
                

                sql = string.Format("Insert Into Users(Email,Password,RoleNo) values (@Email,@Password,2);Select @@Identity as 'Identity'");
                cmd.CommandText = sql;
                int UsersId = int.Parse(cmd.ExecuteScalar().ToString());

                if (UsersId > 0)
                {
                    sql = string.Format("insert into Doctors(UsersNo,FullName,Adress,PostalCode,DateOfBirth,PhoneNumber,Registration_Approval_DateTime,IsApproved) values ({0},@FullName,@Adress,@PostalCode,@DateOfBirth,@PhoneNumber,@Registration_Approval_DateTime,@IsApproved);Select @@Identity as 'Identity'", UsersId);
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

        public bool UpdateDoctors(string FullName, string Adress, string PostalCode, string Birthdate, string PhoneNumber, string Password, string email, bool isactive, bool IsApproved, string Registration_Approval_DateTime, int Doctorid)
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
                cmd.Parameters.AddWithValue("@IsApproved", IsApproved);

                cmd.Parameters.AddWithValue("@Registration_Approval_DateTime", IsApproved ? DatabaseClass.FormatDateTimeArEgMDY(DateTime.Parse(Registration_Approval_DateTime).ToString()) : Registration_Approval_DateTime);
                int UsersId = GetUsersIdbyDoctorId(Doctorid);
                string sql = string.Format("Update  Users SET Email=@Email,Password=@Password,IsActive=@IsActive where UserId={0}", UsersId);
                cmd.CommandText = sql;
                RowsCount += int.Parse(cmd.ExecuteNonQuery().ToString());
                if (RowsCount > 0)
                {
                    string sql2 = string.Format("Update  Doctors SET FullName=@FullName,Adress=@Adress,PostalCode=@PostalCode,DateOfBirth=@DateOfBirth,PhoneNumber=@PhoneNumber,Registration_Approval_DateTime=@Registration_Approval_DateTime,IsApproved=@IsApproved where UserId={0}", UsersId);
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

        public int GetUsersIdbyDoctorId(int Doctorid)
        {
            try
            {
                string sql = string.Format("select UsersNo from Doctors where DoctorsId={0}", Doctorid);
                return int.Parse(db.ExecuteScalar(sql).ToString());
            }
            catch
            {
                return 0;
            }
        }

        public DataTable GetAllDoctors()
        {
            try
            {
                string sql = "select * vwFullDoctorInfo";
                return db.ExecuteQuery(sql);
            }
            catch (Exception)
            {

                throw;
            }
        }


        public DataTable GetDoctorInfoByUserId(int userid)
        {
            string sql = string.Format("select * From Doctors where UsersNo={0}", userid);
            return db.ExecuteQuery(sql);
        }
    }
}
