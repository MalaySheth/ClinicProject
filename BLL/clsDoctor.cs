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


        public int InsertDoctors(string FullName, string Adress, string PostalCode, string Birthdate, string PhoneNumber, string Password, string email, bool IsApproved, string Registration_Approval_DateTime, bool IsActive, string RegistrationNumber)
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

                cmd.Parameters.AddWithValue("@Registration_Approval_DateTime", IsApproved ? DatabaseClass.FormatDateTimeArEgMDY(DateTime.Parse(Registration_Approval_DateTime).ToString()) : (object)DBNull.Value);


                sql = string.Format("Insert Into Users(Email,Password,RoleNo,IsActive) values (@Email,@Password,2,'{0}');Select @@Identity as 'Identity'", IsActive);
                cmd.CommandText = sql;
                int UsersId = int.Parse(cmd.ExecuteScalar().ToString());

                if (UsersId > 0)
                {
                    sql = string.Format("insert into Doctors(UsersNo,FullName,Adress,PostalCode,DateOfBirth,PhoneNumber,Registration_Approval_DateTime,IsApproved,RegistrationNumber) values ({0},@FullName,@Adress,@PostalCode,@DateOfBirth,@PhoneNumber,@Registration_Approval_DateTime,'{1}',@RegistrationNumber);Select @@Identity as 'Identity'", UsersId, IsApproved);
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

        public bool UpdateDoctors(string FullName, string Adress, string PostalCode, string Birthdate, string PhoneNumber, string email, bool isactive, bool IsApproved, string Registration_Approval_DateTime, string RegistrationNumber, int Doctorid)
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
                cmd.Parameters.AddWithValue("@FullName", FullName);
                cmd.Parameters.AddWithValue("@Adress", Adress);
                cmd.Parameters.AddWithValue("@PostalCode", PostalCode);
                cmd.Parameters.AddWithValue("@DateOfBirth", DatabaseClass.FormatDateArEgMDY(DateTime.Parse(Birthdate).ToShortDateString()));
                cmd.Parameters.AddWithValue("@PhoneNumber", PhoneNumber);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@RegistrationNumber", RegistrationNumber);

                cmd.Parameters.AddWithValue("@Registration_Approval_DateTime", IsApproved ? DatabaseClass.FormatDateArEgMDY(DateTime.Parse(Registration_Approval_DateTime).ToShortDateString()) : (object)DBNull.Value);
                int UsersId = GetUsersIdbyDoctorId(Doctorid,cmd);
                if (db.cn.State != ConnectionState.Open)
                {
                    db.cn.Open();
                }
                string sql = string.Format("Update  Users SET Email=@Email,IsActive='{1}' where UsersId={0}", UsersId, isactive);
                cmd.CommandText = sql;
                RowsCount += int.Parse(cmd.ExecuteNonQuery().ToString());
                if (RowsCount > 0)
                {
                    if (db.cn.State != ConnectionState.Open)
                    {
                        db.cn.Open();
                    }
                    string sql2 = string.Format("Update  Doctors SET FullName=@FullName,Adress=@Adress,PostalCode=@PostalCode,DateOfBirth=@DateOfBirth,PhoneNumber=@PhoneNumber,Registration_Approval_DateTime=@Registration_Approval_DateTime,IsApproved='{1}',RegistrationNumber=@RegistrationNumber where UsersNo={0}", UsersId, IsApproved);
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
            catch (Exception ex)
            {

                trans.Rollback();
                db.cn.Close();
                return false;
            }
        }

        public int GetUsersIdbyDoctorId(int Doctorid,SqlCommand cmd)
        {
            try
            {
                string sql = string.Format("select UsersNo from Doctors where DoctorsId={0}", Doctorid);
                cmd.CommandText = sql;
                return int.Parse(cmd.ExecuteScalar().ToString());
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
            string sql = string.Format("select * From vwFullDoctorInfo where UsersNo={0}", userid);
            return db.ExecuteQuery(sql);
        }

        public DataTable GetDoctorInfoByDoctorId(int DoctorId)
        {
            string sql = string.Format("select * From vwFullDoctorInfo where DoctorsId={0}", DoctorId);
            return db.ExecuteQuery(sql);
        }

        public DataTable SearchDoctors(string fullName, string email, string adress, string registrationNumber, string phoneNumber)
        {
            try
            {
                string sql = "", qryFullName = "", qryAdress = "", qryRegistrationNumber = "", qryEmail = "", qryPhoneNumber = "";
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

                if (!string.IsNullOrEmpty(registrationNumber))
                {
                    if (FirstArg)
                    {
                        qryRegistrationNumber = string.Format("where RegistrationNumber Like '{0}%'", registrationNumber);
                        FirstArg = false;
                    }
                    else
                    {
                        qryRegistrationNumber = string.Format("and RegistrationNumber like '{0}%'", registrationNumber);
                    }
                }

                sql = string.Format("select * from vwFullDoctorInfo {0} {1} {2} {3} {4}", qryFullName, qryEmail, qryPhoneNumber, qryAdress, qryRegistrationNumber);
                return db.ExecuteQuery(sql);

            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
        }

        public bool DeleteDoctor(int doctorsId)
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
                int UserId = GetUsersIdbyDoctorId(doctorsId, cmd);
                string sql = string.Format("delete from Doctors where DoctorsId={0}", doctorsId);
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

        public bool CheckApproveDoctor(int DoctorId, SqlCommand cmd)
        {
            try
            {
                string sql = string.Format("select IsApproved From Doctors where DoctorsId={0}", DoctorId);
                cmd.CommandText = sql;
                return bool.Parse(cmd.ExecuteScalar().ToString());

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        public bool CheckApproveDoctor(int DoctorId)
        {
            try
            {
                string sql = string.Format("select IsApproved From Doctors where DoctorsId={0}", DoctorId);
                
                return bool.Parse(db.ExecuteScalar(sql).ToString());

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        public bool UpdateDoctorsIsAprrovedField(int doctorId)
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
                bool approveStatus = CheckApproveDoctor(doctorId, cmd);
                string sql = string.Format("Update  Doctors SET IsApproved='{0}' where DoctorsId={1}", !approveStatus, doctorId);
                int userId = GetUsersIdbyDoctorId(doctorId, cmd);
                cmd.CommandText = sql;
                RowsCount += int.Parse(cmd.ExecuteNonQuery().ToString());
                if (RowsCount > 0)
                {
                    string sql2 = string.Format("Update  Users SET IsActive='{0}' where UsersId={1}", !approveStatus, userId);
                    cmd.CommandText = sql2;
                    RowsCount += int.Parse(cmd.ExecuteNonQuery().ToString());
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
                return false;
            }
        }
    }
}
