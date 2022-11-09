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

        public bool AssignPatientAppointmentToDoctor(int PatientAppointmentId, int DoctorId, int CounselorId,string ScheduleDate,string scheduledTime)
        {
            if (db.cn.State != ConnectionState.Open)
            {
                db.cn.Open();
            }

            SqlTransaction trans = db.cn.BeginTransaction();
            try
            {
                DateTime ScheduledDatetime = DateTime.ParseExact(ScheduleDate + " " + scheduledTime, "dd/MM/yy h:mm:ss tt", CultureInfo.InvariantCulture);
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = db.cn;
                cmd.Transaction = trans;
                int RowsCount = 0;
                string sql = string.Format("Update  PatientAppointments SET DoctorsNo={0},CounselorsNo={1},Appoint_Scheduled_DateTime='{2}',Status='Scheduled' where PatientAppointmentsId={3}", DoctorId,CounselorId,DatabaseClass.FormatDateTimeArEgMDY(ScheduledDatetime.ToString()),PatientAppointmentId);
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
                if(rowscount>0)
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

    }
}
