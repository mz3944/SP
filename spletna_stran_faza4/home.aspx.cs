using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using MySql.Data.MySqlClient;

namespace spletna_stran_faza4
{
public partial class home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
   
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        String connectionString = @"Server=mysql.lrk.si;Database=mz3944_b1;User ID=mz3944;Password=12comand12";
        MySqlConnection conn = new MySqlConnection(connectionString);
        MySqlCommand cmd = new MySqlCommand("Select * from User where username = '" + TextBox1.Text + "' and password = '" + TextBox2.Text + "'", conn);

        conn.Open();
        MySqlDataAdapter da = new MySqlDataAdapter(cmd);

        DataSet a = new DataSet();
        da.Fill(a);

        if (a.Tables[0].Rows.Count > 0)
        {
            Response.Redirect("home_buildings.html");
            Label1.Visible = false;
        }
        else
        {
            Label1.Text = "Wrong username and/or password!";
            Label1.Visible = true;
        }
    }

}
}