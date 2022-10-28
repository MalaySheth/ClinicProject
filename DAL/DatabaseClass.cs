using System;
using System.Net.Mail;
using System.Data;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Configuration;
using System.Net;
using System.Web;
using System.Net.NetworkInformation;
using System.Globalization;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Http;


/// <summary>
/// Summary description for DatabaseClass
/// </summary>
namespace DAL
{
    public class DatabaseClass
    {

        private static string dbName;
        private static string serverName;


        private DataSet ds;
        private SqlCommand cmd;
        private SqlDataAdapter da;


        public static string connectionString;
        public SqlConnection cn;
        public SqlConnection con;
        public static string DBName
        {
            get { return DatabaseClass.dbName; }
            //set { DatabaseClass.dBName = value; }
        }


        public static string ServerName
        {
            get { return DatabaseClass.serverName; }
            //set { DatabaseClass.serverName = value; }
        }

        public string DatabaseClassConnectionString
        {
            get { return connectionString; }
        }

        #region Constructors

        /// <summary>
        /// Creates a connection to the database using the connection string saved in app.config
        /// </summary>
        public DatabaseClass()
        {
           
           // serverName = @"BHUMIKA-PC\SQLEXPRESS";
            serverName = @"MALAY-PC\SQLEXPRESS";
            dbName = "Clinic";
            //dbName = "UserAcounts";
            //serverName = @"EMC-PC";
            
            //connectionString = string.Format("server={0};Integrated Security=True;database={1}", serverName, dbName);
            connectionString = string.Format(@" Server={0}; Database={1}; uid=clinic; pwd=clinic123; trusted_connection=false; ", serverName, dbName);
            cn = new SqlConnection(connectionString);
        }
        

        #endregion
 

        public void OpenConnection()
        {
            try
            {
                if (cn.State != ConnectionState.Open)
                    cn.Open();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        /// <summary>
        /// Closes the open connection
        /// </summary>
        public void CloseConnection()
        {
            try
            {
                if (cn.State == ConnectionState.Open)
                    cn.Close();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        /// <summary>
        ///  To Execute SQL statement that returns result in rows
        /// </summary>
        /// <param name="sqlStmt">SQL Statement</param>
        /// <returns>result rows</returns>
        public DataTable ExecuteQuery(string sqlStmt)
        {
            cmd = new SqlCommand(sqlStmt, cn);
            da = new SqlDataAdapter(cmd);
            ds = new DataSet();

            cmd.CommandTimeout = 600;

            try
            {
                if (cn.State != ConnectionState.Open)
                    cn.Open();

                da.Fill(ds);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                CloseConnection();
            }

            return ds.Tables[0];
        }

        /// <summary>
        /// To Execute SQL command containing SQL Statement that returns result in rows
        /// </summary>
        /// <param name="cmd">QL command containing SQL Statement</param>
        /// <returns>result rows</returns>
        public DataTable ExecuteQuery(SqlCommand cmd)
        {
            da = new SqlDataAdapter(cmd);
            ds = new DataSet();

            cmd.CommandTimeout = 600;

            try
            {
                if (cn.State != ConnectionState.Open)
                    cn.Open();

                da.Fill(ds);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                CloseConnection();
            }

            return ds.Tables[0];
        }

        /// <summary>
        /// To execute insert/update/delete SQL statement
        /// </summary>
        /// <param name="sql">insert/update/delete SQL statement</param>
        /// <returns>No. of rows affected by the statement</returns>

        public int ExecuteNonQuery(string sql)
        {
            int recordsAffected;

            try
            {
                cmd = new SqlCommand(sql, cn);
                cmd.CommandTimeout = 600;

                if (cn.State != ConnectionState.Open)
                    cn.Open();

                recordsAffected = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                CloseConnection();
            }

            return recordsAffected;
        }

        /// <summary>
        /// To execute SQL command containing insert/update/delete SQL statement
        /// </summary>
        /// <param name="cmd">SQL command containing insert/update/delete SQL statement</param>
        /// <returns>No. of rows affected by the statement</returns>
        public int ExecuteNonQuery(SqlCommand cmd)
        {
            int recordsAffected;
            cmd.CommandTimeout = 600;

            try
            {
                if (cn.State != ConnectionState.Open)
                    cn.Open();

                recordsAffected = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                CloseConnection();
            }

            return recordsAffected;
        }

        /// <summary>
        /// To execute SQL command containing insert SQL statement returning the new identity column value
        /// </summary>
        /// <param name="sql">Insert SQL Statement</param>
        /// <param name="tableName">Table affected by the insert statement</param>
        /// <returns>New identity value</returns>
        public int ExecuteInsertWithIDReturn(string sql, string tableName)
        {
            int returnValue, recordsAffected;

            try
            {
                cmd = new SqlCommand(sql, cn);
                cmd.CommandTimeout = 600;

                if (cn.State != ConnectionState.Open)
                    cn.Open();

                recordsAffected = cmd.ExecuteNonQuery();
                if (recordsAffected == 1)
                {
                    sql = string.Format("select ident_current('{0}')", tableName);
                    returnValue = Int32.Parse(ExecuteScalar(sql).ToString());
                    return returnValue;
                }
                else
                    return 0;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

            // return recordsAffected;
        }


        /// <summary>
        /// To execute SQL Statement that returns one value
        /// </summary>
        /// <param name="sql">SQL statement</param>
        /// <returns>Retrieved value</returns>
        public Object ExecuteScalar(string sql)
        {
            Object returnValue;

            try
            {
                cmd = new SqlCommand(sql, cn);
                cmd.CommandTimeout = 600;

                if (cn.State != ConnectionState.Open)
                    cn.Open();

                returnValue = cmd.ExecuteScalar();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                CloseConnection();
            }

            if (returnValue == null)
                return 0;
            else
                return returnValue;
        }

        /// <summary>
        /// To execute SQL Statement that returns one value
        /// </summary>
        /// <param name="cmd">SQL command containing SQL statement</param>
        /// <returns>Retrieved value</returns>
        public decimal ExecuteScalar(SqlCommand cmd)
        {
            decimal returnValue;

            try
            {
                cmd.CommandTimeout = 600;

                if (cn.State != ConnectionState.Open)
                    cn.Open();

                returnValue = (decimal)cmd.ExecuteScalar();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                CloseConnection();
            }

            return returnValue;
        }

        /// <summary>
        /// To format date string to be in the format DMY
        /// </summary>
        /// <param name="dt">Date the must be formatted</param>
        /// <returns>date in string formatted in DMY</returns>
        public static string FormatDateDMY(DateTime dt)
        {
            // To format date string to be in the format DMY
            string date = string.Format("{0}/{1}/{2}", dt.Day, dt.Month, dt.Year);
            return date;
            
        }

        /// <summary>
        /// To format date string to be in the format MDY
        /// </summary>
        /// <param name="dt">Date the must be formatted</param>
        /// <returns>date in string formatted in MDY</returns>
        public static string FormatDateMDY(DateTime dt)
        {
            // To format date string to be in the format DMY
            string date = string.Format("{1}/{0}/{2}", dt.Month, dt.Day, dt.Year);
            return date;
        }


        /// <summary>
        ///  To format date string to be in the format MDY after parsing it
        /// </summary>
        /// <param name="strDate">String of date the must be formatted</param>
        /// <returns>date in string formatted in MDY</returns>
        public static string FormatDateString(string strDate)
        {
            DateTime passedDate = DateTime.Parse(strDate);
            string date = string.Format("{1}/{0}/{2}", passedDate.Day, passedDate.Month, passedDate.Year);
            return date;
        }

        public static DateTime TransferDateToDMY(string DateDMY)
        {
            return DateTime.ParseExact(DateDMY, "dd/MM/yyyy", new CultureInfo("en-GB"));
        }
        /// <summary>
        /// To format date string after parsing it to be in a determined format
        /// </summary>
        /// <param name="dateText">String of date the must be formatted</param>
        /// <param name="localeName">Locale short name (e.g: ar-eg, en-us, ar-sa, ...)</param>
        /// <param name="dateFormat">Date format, such as MM/dd/yyyy: MDY, dd/MM/yyyy</param>
        /// <returns>date in string formatted</returns>
        public static string FormatDateByLocale(string dateText, string localeName, string dateFormat)
        {
            DateTime parsedDateTime = Convert.ToDateTime(dateText, new CultureInfo(localeName));
            string parsedDateTimeString = parsedDateTime.ToString(dateFormat);
            return parsedDateTimeString;
        }

        /// <summary>
        /// To format date string after parsing according to Ar-Egypt locale it to be in MDY format
        /// </summary>
        /// <param name="dateText">String of date the must be formatted</param>
        /// <returns>ate in string formatted</returns>
        public static string FormatDateArEgMDY(string dateText)
        {
            return FormatDateByLocale(dateText, "ar-eg", "MM/dd/yyyy");
        }

        public static string FormatDateArEgYMD(string dateText)
        {
            return FormatDateByLocale(dateText, "ar-eg", "yyyy/MM/dd");
        }

        public static string FormatDateTimeArEgMDY(string dateText)
        {
            return FormatDateByLocale(dateText, "ar-eg", "MM/dd/yyyy HH:mm:ss.fff");
        }
        public static string FormatTime24(string TimeText)
        {
            return FormatDateByLocale(TimeText, "en-US", "HH:mm:ss.ffff");
        }
        public static string FormatTimeAmPm(string TimeText)
        {
            DateTime time = DateTime.Parse(TimeText);
            return time.ToString("hh:mm tt", CultureInfo.InvariantCulture);

            //return FormatDateByLocale(TimeText, "en-US", "hh:mm tt");
        }
    
       

        
        public DataTable ExecuteQuery(string sql, SqlConnection sqlConnection, SqlTransaction trans)
        {
            cmd = new SqlCommand(sql, sqlConnection);
            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            cmd.Transaction = trans;
            cmd.CommandTimeout = 600;

            try
            {
                if (cn.State != ConnectionState.Open)
                    cn.Open();

                da.Fill(ds);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            
            return ds.Tables[0];
        }
    }
}




