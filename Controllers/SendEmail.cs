using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;

namespace SmartLib.Controllers
{
    public class SendEmail
    {
        public static bool Send(string to, string msg)
        {
            bool status = true;
            try
            {
                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
                var mail = new MailMessage();
                mail.From = new MailAddress("letuantudanang@gmail.com");
                mail.To.Add(to);
                mail.Subject = "Nhắc nhở: học sinh mượn sách quá hạn.";
                mail.IsBodyHtml = true;
                string htmlBody;
                htmlBody = msg;
                mail.Body = htmlBody;
                SmtpServer.Port = 587;
                SmtpServer.UseDefaultCredentials = false;
                SmtpServer.Credentials = new System.Net.NetworkCredential("letuantudanang@gmail.com", "pgoskefjksekqwyp");
                SmtpServer.EnableSsl = true;
                SmtpServer.Send(mail);
            }
            catch (Exception ex)
            {
                status = false;
            }
            return status;
        }
        public static bool Send(string emailTo)
        {
            bool status = true;
            try
            {
                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
                var mail = new MailMessage();
                mail.From = new MailAddress("letuantudanang@gmail.com");
                mail.To.Add(emailTo);
                mail.Subject = "Xác nhận đăng ký sách";
                mail.IsBodyHtml = true;
                string htmlBody;
                htmlBody = "Đơn đăng ký của bạn đã được xử lý";
                mail.Body = htmlBody;
                SmtpServer.Port = 587;
                SmtpServer.UseDefaultCredentials = false;
                SmtpServer.Credentials = new System.Net.NetworkCredential("letuantudanang@gmail.com", "tikxjwuvvtsmqmpq");
                SmtpServer.EnableSsl = true;
                SmtpServer.Send(mail);
            }
            catch (Exception ex)
            {
                status = false;
            }
            return status;
        }
        public static DataTable GetData()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;//Chuỗi kết nối đến sql
            SqlConnection con = new SqlConnection(connectionString);//Khởi tạo connection để kết nối đến máy chủ SQL
            SqlCommand cmd = new SqlCommand("GetStudentsToRemind", con); // Khởi tạo câu lệnh gọi
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable table = new DataTable();
            da.Fill(table);
            return table;
        }
    }
}