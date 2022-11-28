using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;

namespace BLL
{
    public class clsAppointment
    {
        DatabaseClass db = new DatabaseClass();

        public int InsertPatientAppointment(int PatientId, DataTable dtAppointmentSelfAssessment)
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



                sql = string.Format("insert into PatientAppointments(PatientsNo) values ({0});Select @@Identity as 'Identity'", PatientId);
                cmd.CommandText = sql;
                int AppointmentId = int.Parse(cmd.ExecuteScalar().ToString());

                if (AppointmentId > 0)
                {
                    foreach (DataRow dr in dtAppointmentSelfAssessment.Rows)
                    {
                        sql = string.Format("insert into PatientAppointmentAssessment(PatientAppointmentsNo,AssessmentQuestionsNo,AssessmentAnswersNo) values ({0},{1},{2});Select @@Identity as 'Identity'", AppointmentId, dr["AssessmentQuestionsNo"], dr["AssessmentAnswersNo"]);
                        cmd.CommandText = sql;
                        rowscount += int.Parse(cmd.ExecuteScalar().ToString());
                    }

                    if (rowscount > 0)
                    {
                        trans.Commit();
                        db.cn.Close();
                        return AppointmentId;
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

        public bool AssignDoctortoAppointment(int DoctorId, int Counselorid, int AppointmentId)
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
                string sql = string.Format("Update  PatientAppointments SET DoctorsNo={0},CounselorsNo={1},Status='Assigned To Doctor' where PatientAppointmentsId={2}", DoctorId, Counselorid, AppointmentId);
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
            catch (Exception)
            {

                trans.Rollback();
                db.cn.Close();
                return false;
            }
        }

        public bool DeleteAppointments(int AppointmentId)
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

                
                string sql = string.Format("delete from PatientAppointmentAssessment where PatientAppointmentsNo={0}", AppointmentId);
                cmd.CommandText = sql;
                RowsCount += int.Parse(cmd.ExecuteNonQuery().ToString());

                string sql2 = string.Format("delete from PatientAppointments where PatientAppointmentsId={0}", AppointmentId);
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


        public DataTable GetSelfAssessmentOfAppointment(int AppointmentId)
        {
            try
            {
                string sql = string.Format("select * from vwPatientAppointmentSelfAssessmentInfo where PatientAppointmentsNo={0}", AppointmentId);
                return db.ExecuteQuery(sql);
            }
            catch (Exception ex)
            {

                return new DataTable();
            }
        }

        public DataTable GetAppointmentsofPatient(int PatientId)
        {
            try
            {
                string sql = string.Format("select * from vwPatientAppointmentInfo where PatientsNo={0}", PatientId);
                return db.ExecuteQuery(sql);
            }
            catch (Exception ex)
            {

                return new DataTable();
            }
        }

        public bool ScheduleDateTimeOfAssignment(int PatientAppointmentId, string ScheduleDate, string scheduledTime)
        {
            if (db.cn.State != ConnectionState.Open)
            {
                db.cn.Open();
            }

            SqlTransaction trans = db.cn.BeginTransaction();
            try
            {
                DateTime ScheduledDatetime = DateTime.Parse(ScheduleDate + " " + scheduledTime);
                
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = db.cn;
                cmd.Transaction = trans;
                int RowsCount = 0;
                string sql = string.Format("Update  PatientAppointments SET Appoint_Scheduled_DateTime='{0}',Status='Scheduled' where PatientAppointmentsId={1}",  DatabaseClass.FormatDateTimeArEgMDY(ScheduledDatetime.ToString()), PatientAppointmentId);
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
                return false;
            }
        }

        public bool CancelAppointment(int AppointmentId)
        {
            try
            {
                int rowscount = 0;
                string sql = string.Format("Update PatientAppointments set Iscancelled='true',Status='Cancelled' where PatientAppointmentsId={0}", AppointmentId);
                rowscount += int.Parse(db.ExecuteNonQuery(sql).ToString());
                if (rowscount > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {

                return false;
            }
        }

        public DataTable GetAllQuestionsSelfAssessment()
        {
            try
            {
                string sql = "Select * from AssessmentQuestions";
                return db.ExecuteQuery(sql);

            }
            catch (Exception ex)
            {

                return new DataTable();
            }
        }

        public DataTable GetAllAnswersSelfAssessment()
        {
            try
            {
                string sql = "Select * from AssessmentAnswers";
                return db.ExecuteQuery(sql);

            }
            catch (Exception ex)
            {

                return new DataTable();
            }
        }

        public DataTable SearchAppointments(string DateFrom, string DateTo, string PatientName, string PhoneNumber, int DoctorId, int PatientNo)
        {
            try
            {
                string sql = "", qryDateFrom = "", qryDateTo = "", qrypatientName = "", qryPhoneNumber = "", qryDoctorID = "", qryPatientID = "";
                bool FirstArg = true;
                if (!string.IsNullOrEmpty(DateFrom))
                {
                    if (FirstArg)
                    {
                        qryDateFrom = string.Format("where AppointmentDate>='{0}'", DateFrom);
                        FirstArg = false;
                    }
                    else
                    {
                        qryDateFrom = string.Format("and AppointmentDate>='{0}'", DateFrom);
                    }
                }

                if (!string.IsNullOrEmpty(DateTo))
                {
                    if (FirstArg)
                    {
                        qryDateTo = string.Format("where AppointmentDate<='{0}'", DateTo);
                        FirstArg = false;
                    }
                    else
                    {
                        qryDateTo = string.Format("and AppointmentDate<='{0}'", DateTo);
                    }
                }
                if (!string.IsNullOrEmpty(PatientName))
                {
                    if (FirstArg)
                    {
                        qrypatientName = string.Format("where PatientName Like'{0}%'", qrypatientName);
                        FirstArg = false;
                    }
                    else
                    {
                        qrypatientName = string.Format("and PatientName Like'{0}%'", qrypatientName);
                    }
                }

                if (DoctorId > 0)
                {
                    if (FirstArg)
                    {
                        qryDoctorID = string.Format("where DoctorsNo={0}", DoctorId);
                        FirstArg = false;
                    }
                    else
                    {
                        qryDoctorID = string.Format("and DoctorsNo={0}", DoctorId);
                    }
                }

                if (PatientNo > 0)
                {
                    if (FirstArg)
                    {
                        qryPatientID = string.Format("where PatientsNo={0}", PatientNo);
                        FirstArg = false;
                    }
                    else
                    {
                        qryPatientID = string.Format("and PatientsNo={0}", PatientNo);
                    }
                }

                if (!string.IsNullOrEmpty(PhoneNumber))
                {
                    if (FirstArg)
                    {
                        qryPhoneNumber = string.Format("where PhoneNumber Like '${0}'", qryPhoneNumber);
                        FirstArg = false;
                    }
                    else
                    {
                        qryPhoneNumber = string.Format("and PhoneNumber Like '%{0}'", qryPhoneNumber);
                    }
                }




                sql = string.Format("select * from vwPatientAppointmentInfo {0} {1} {2} {3} {4} {5}", qryDateFrom, qryDateTo, qrypatientName, qryPhoneNumber, qryPatientID, qryDoctorID);
                return db.ExecuteQuery(sql);

            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
        }

        public string GetAssessmentDate(int AppointmentId)
        {
            try
            {
                string sql = string.Format("select AppointmentDate from PatientAppointments where PatientAppointmentsId={0}", AppointmentId);
                string date = DatabaseClass.FormatDateDMY(DateTime.Parse(db.ExecuteScalar(sql).ToString()));
                return date;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public DataTable GetAppointmentDetailsbyAppointmentId(int AppointmentId)
        {
            try
            {
                string sql = string.Format("select * from vwPatientAppointmentInfo where PatientAppointmentsId={0}", AppointmentId);
                return db.ExecuteQuery(sql);
            }
            catch (Exception ex)
            {

                return new DataTable();
            }
        }

        public int GetTotalAppointmentsCount()
        {
            string sql = string.Format("select COUNT(*) From PatientAppointments");
            return int.Parse(db.ExecuteScalar(sql).ToString());
        }

        public int GetTotalAppointmentsOfPatientsCount(int patientId)
        {
            string sql = string.Format("select COUNT(*) From PatientAppointments where PatientsNo={0}", patientId);
            return int.Parse(db.ExecuteScalar(sql).ToString());
        }

        public int GetTotalAppointmentsAssignedToDoctorCount(int doctorId)
        {
            string sql = string.Format("select COUNT(*) From PatientAppointments where DoctorsNo={0}", doctorId);
            return int.Parse(db.ExecuteScalar(sql).ToString());
        }

        public int GetTotalPatientsAssignedToDoctorCount(int doctorId)
        {
            string sql = string.Format("select COUNT(distinct PatientsNo) From PatientAppointments where DoctorsNo={0}", doctorId);
            return int.Parse(db.ExecuteScalar(sql).ToString());
        }

        public int GetTotalPatientsAssignedToCounselorsCount(int counselorsId)
        {
            string sql = string.Format("select COUNT(distinct PatientsNo) From PatientAppointments where CounselorsNo={0}", counselorsId);
            return int.Parse(db.ExecuteScalar(sql).ToString());
        }

        public int GetTotalVisitsOfPatientCount(int patientId)
        {
            string sql = string.Format("select COUNT(*) From PatientAppointments where PatientsNo={0} and status='Scheduled'", patientId);
            return int.Parse(db.ExecuteScalar(sql).ToString());
        }

        public int GetTotalPendingAppointmentsCount(int patientId)
        {
            string sql = string.Format("select COUNT(*) From PatientAppointments where PatientsNo={0} and status='Requested'", patientId);
            return int.Parse(db.ExecuteScalar(sql).ToString());
        }

        public DataTable GetDoctorAppointmentsForReportWithCount(string DateFrom, string DateTo,int DoctorId)
        {
            string sql = "", qryDateFrom = "", qryDateTo = "",qryDoctorNo="";
            
            if (!string.IsNullOrEmpty(DateFrom))
            {
                
                    qryDateFrom = string.Format("and Appoint_Scheduled_DateTime>='{0}'", DateFrom);
                
            }

            if (!string.IsNullOrEmpty(DateTo))
            {
             
                    qryDateTo = string.Format("and Appoint_Scheduled_DateTime<='{0}'", DateTo);
                
            }
            if (DoctorId!=0)
            {

                qryDoctorNo = string.Format("and DoctorsNo<={0}", DoctorId);

            }
            sql = string.Format("SELECT DoctorName,DoctorsNo,CAST(Appoint_Scheduled_DateTime AS DATE) as AppointmentDate,count (*) as AppointmentsCount FROM vwPatientAppointmentInfo where DoctorsNo is not null {0} {1}  group by CAST(Appoint_Scheduled_DateTime AS DATE),DoctorsNo,DoctorName",qryDateFrom,qryDateTo);

            return db.ExecuteQuery(sql);
        }
    }
}
