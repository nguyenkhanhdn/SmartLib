using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using SmartLib.Models;

namespace SmartLib.Controllers
{
    public class Top10Students
    {
        public List<Student> GetTop10Students()
        {
            string conString = "server=tcp:europedemodb.database.windows.net,1433;Initial Catalog=SmartLib;uid=sa2022;pwd=Abc123!@#";
            SqlConnection con = new SqlConnection(conString);
            SqlCommand cmd = new SqlCommand("gettop10students", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Top10Students");

            List<Student> students = new List<Student>();
            foreach (DataRow row in ds.Tables["Top10Students"].Rows)
            {
                Student std = new Student();
                std.Name = row["Name"].ToString();
                std.Id = int.Parse(row["Id"].ToString());
                std.Address = row["Address"].ToString();
                std.Phone = row["Phone"].ToString();
                std.Email = row["Email"].ToString();
                std.ClassId =int.Parse( row["ClassId"].ToString());
                students.Add(std);
            }
            return students;
        }
    }
}