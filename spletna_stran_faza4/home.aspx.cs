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
using System.Text;
using System.Security.Cryptography;

namespace spletna_stran_faza4
{
public partial class home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
   
    }

    public string ComputeHash(string input, HashAlgorithm algorithm)
    {
        Byte[] inputBytes = Encoding.UTF8.GetBytes(input);

        Byte[] hashedBytes = algorithm.ComputeHash(inputBytes);

        return BitConverter.ToString(hashedBytes);
    }

    private bool IsPasswordValid(string passwordToValidate, string correctPasswordHash)
    {
        string hashedPassword = ComputeHash(passwordToValidate, new SHA256CryptoServiceProvider());

        return hashedPassword.Equals(correctPasswordHash);
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        String connectionString = @"Server=mysql.lrk.si;Database=mz3944_b1;User ID=mz3944;Password=12comand12";
        MySqlConnection conn = new MySqlConnection(connectionString);
        MySqlCommand cmd = new MySqlCommand("Select password from User where username = '" + TextBox1.Text + "'", conn);//        MySqlCommand cmd = new MySqlCommand("Select * from User where username = '" + TextBox1.Text + "' and password = '" + TextBox2.Text + "'", conn);

        conn.Open();
        MySqlDataAdapter da = new MySqlDataAdapter(cmd);

        DataSet a = new DataSet();
        da.Fill(a);

        conn.Close();

        if (a.Tables[0].Rows.Count > 0)
        {
            string hashedPass = Convert.ToString(a.Tables[0].Rows[0][0]);
            bool isValid = IsPasswordValid(TextBox2.Text, hashedPass);

            if(isValid) {
                Response.Redirect("home_buildings.html");
                Label1.Visible = false;
                return;
            }
        }

        Label1.Text = "Wrong username and/or password!";
        Label1.Visible = true;
    }

}
}