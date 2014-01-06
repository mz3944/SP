using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;







using System.Text.RegularExpressions;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using MySql.Data.MySqlClient;
using System.Text;
using System.Security.Cryptography;
namespace spletna_stran_faza4
{
public partial class WebForm1 : System.Web.UI.Page
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


        public void btnsubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            ///*
            //string name = TxtName.Text; // Scrub user data
            //MySqlConnection = null;
            String connectionString = @"Server=mysql.lrk.si;Database=mz3944_b1;User ID=mz3944;Password=12comand12";
           
            
            
            // assets
            String cmdString = "insert into Goods values(); select LAST_INSERT_ID()";
            //String getIDString = "select @@Identity";
            int assetsID;
            MySqlConnection cn = new MySqlConnection(connectionString);
            MySqlCommand cmd = new MySqlCommand(cmdString, cn);

            cn.Open();
            //cmd.CommandText = getIDString;
            //assetsID = (int)cmd.ExecuteScalar();
            //.Parameters["@CategoryID"].Value;
            assetsID = Convert.ToInt32(cmd.ExecuteScalar());//ali cmd.ExecuteNonQuery();
            cn.Close();

            // levels
            cmdString = "insert into Levels values(); select LAST_INSERT_ID()";
            int levelsID;
            cn = new MySqlConnection(connectionString);
            cmd = new MySqlCommand(cmdString, cn);

            cn.Open();
            //cmd.ExecuteNonQuery();
            //cmd.CommandText = getIDString;
            levelsID = Convert.ToInt32(cmd.ExecuteScalar());
            cn.Close();

            // population
            cmdString = "insert into Pupulation values(); select LAST_INSERT_ID()";
            int populationID;
            cn = new MySqlConnection(connectionString);
            cmd = new MySqlCommand(cmdString, cn);

            cn.Open();
            //cmd.ExecuteNonQuery();
            //cmd.CommandText = getIDString;
            populationID = Convert.ToInt32(cmd.ExecuteScalar());
            cn.Close();

            // player
            cmdString = "insert into Player values(@id,@assets_idfk,@levels_idfk,@population_idfk); select LAST_INSERT_ID()";
            int playerID;
            cn = new MySqlConnection(connectionString);
            cmd = new MySqlCommand(cmdString, cn);

            cmd.Parameters.AddWithValue("@id", null);
            cmd.Parameters.AddWithValue("@assets_idfk", assetsID);
            cmd.Parameters.AddWithValue("@levels_idfk", levelsID);
            cmd.Parameters.AddWithValue("@population_idfk", populationID);

            cn.Open();
            //cmd.ExecuteNonQuery();
            //cmd.CommandText = getIDString;
            //playerID = Convert.ToInt32(cmd.Parameters["@id"].Value); Response.Write(playerID);
            playerID = Convert.ToInt32(cmd.ExecuteScalar());
            cn.Close();

            
            cmdString = "insert into User values(@id,@name,@surname,@email,@username,@password,@browser,@telephone,@player_idfk)";
            using (cn = new MySqlConnection(connectionString))//"server=mysql.lrk.si;User Id=mz3944;database=mz3944_b1;Password=12comand12"))
            {
                //cn.Open();
                //Response.Write("ASFASF");
                using (cmd = new MySqlCommand(cmdString, cn))
                {
                    cmd.Parameters.AddWithValue("@id", null);
                    cmd.Parameters.AddWithValue("@name", TextBox1.Text);
                    cmd.Parameters.AddWithValue("@surname", TextBox2.Text);
                    cmd.Parameters.AddWithValue("@email", txtemail.Text);
                    cmd.Parameters.AddWithValue("@username", TextBox3.Text);
                    string hashedPassword = ComputeHash(TextBox4.Text, new SHA256CryptoServiceProvider());
                    cmd.Parameters.AddWithValue("@password", hashedPassword);
                    String browserSel;
                    if (ddlcandidate.SelectedIndex.Equals(0))
                        browserSel = null;
                    else
                        browserSel = ddlcandidate.SelectedValue;
                    cmd.Parameters.AddWithValue("@browser", browserSel);
                    String telephoneVal = TextBox6.Text;
                    if (telephoneVal.Equals(""))
                        telephoneVal = null;
                    cmd.Parameters.AddWithValue("@telephone", telephoneVal);






                    cmd.Parameters.AddWithValue("@player_idfk", playerID);

                    cn.Open();
                    cmd.ExecuteNonQuery();
                    cn.Close();
                }

            }
            




/*
            MySql.Data.MySqlClient.MySqlConnection conn;
            string myConnectionString;

            myConnectionString = "server=127.0.0.1;uid=root;" +
                "pwd=12345;database=test;";

            try
            {
                conn = new MySql.Data.MySqlClient.MySqlConnection();
                conn.ConnectionString = myConnectionString;
                conn.Open();
            }
            catch (MySql.Data.MySqlClient.MySqlException ex)
            {
                MessageBox.Show(ex.Message);
            }



            string cnnString = ConfigurationManager.ConnectionStrings["mysql.lrk.si"].ConnectionString;
            string cmdString = "insert into Goods values(@food,@wood,@stone,@iron,@gold)";
            using (SqlConnection cnn = new SqlConnection(cnnString))
            {
                using (SqlCommand cmd = new SqlCommand(cmdString, cnn))
                {
                    cmd.Parameters.AddWithValue("@food", 8);
                    cmd.Parameters.AddWithValue("@wood", 8);
                    cmd.Parameters.AddWithValue("@stone", 8);
                    cmd.Parameters.AddWithValue("@iron", 8);
                    cmd.Parameters.AddWithValue("@gold", 8);

                    cnn.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            */
/*
            string connString = ConfigurationManager.ConnectionStrings["MyConsString"].ConnectionString;
            try
            {
                conn = new sqlconnection(connstring);
                conn.open();

                using (sqlcommand cmd = new sqlcommand())
                {
                    cmd.conn = conn;
                    cmd.commandtype = commandtype.text;
                    cmd.commandtext = "insert into dummytable(name) values (@var)";
                    cmd.parameters.addwithvalue("@var", name);
                    int rowsaffected = cmd.executenonquery();
                    if (rowsaffected == 1)
                    {
                        //success notification
                    }
                    else
                    {
                        //error notification
                    }
                }
            }
            catch (exception ex)
            {
                //log error 
                //display friendly error to user
            }
            finally
            {
                if (conn != null)
                {
                    //cleanup connection i.e close 
                }
            }
            */

            ////define the connection reference and initialize it
            //MySql.Data.MySqlClient.MySqlConnection msqlConnection = null;
            //msqlConnection = new MySql.Data.MySqlClient.MySqlConnection(“server=localhost;user id=UserName;Password=UserPassword;database=DatabaseName;persist security info=False”);
            //    //define the command reference
            //MySql.Data.MySqlClient.MySqlCommand msqlCommand = new MySql.Data.MySqlClient.MySqlCommand();
            //    //define the connection used by the command object
            //msqlCommand.Connection = this.msqlConnection;
            //    //define the command text
            //msqlCommand.CommandText = "SELECT * FROM TestTable;";
            //try
            //{
            //    //open the connection
            //    this.msqlConnection.Open();
            //    //use a DataReader to process each record
            //    MySql.Data.MySqlClient.MySqlDataReader msqlReader = msqlCommand.ExecuteReader();
            //    while (msqlReader.Read())
            //    {
            //        //do something with each record
            //    }
            //}
            //catch (Exception er)
            //{
            //    //do something with the exception
            //}
            //finally
            //{
            //    //always close the connection
            //    this.msqlConnection.Close();
            //}
            
            
            
            
            
            //string cnnString = ConfigurationManager.ConnectionStrings["mysql.lrk.si"].ConnectionString;
            //string cmd = "insert into Insert values(@City,@FName,@LName)";
            //using (SqlConnection cnn = new SqlConnection(cnnString))
            //{
            //    using (SqlCommand cmd = new SqlCommand(cmd, cnn))
            //    {
            //        cmd.Parameters.AddWithValue("@City", txtCity.Text);
            //        cmd.Parameters.AddWithValue("@FName", txtFName.Text);
            //        cmd.Parameters.AddWithValue("@LName", txtLName.Text);

            //        cnn.Open();
            //        cmd.ExecuteNonQuery();
            //    }
            //}
            
            lblmsg.ForeColor = System.Drawing.ColorTranslator.FromHtml("Blue");
            lblmsg.Text = "You have successfully registered your account!";
        }
     /*   else
        {
            lblmsg.Text = "Fill up all the fields";
        }*/
        //TextBox4.Text = "";
        //TextBox5.Text = "";
    }

    public void NameValidation(object source, ServerValidateEventArgs args)
    {

        try
        {

            string input = args.Value;
            //args.IsValid = ((i % 2) == 0);

            Match match = Regex.Match(input, @"^[a-zA-Z ]+$"); // RegexOptions.IgnoreCase);

            if (!match.Success)
            {
                CustomValidator1.ErrorMessage = "Only alphabets are allowed!";
                args.IsValid = false;
            }
            else if (input.Length < 3)
            {
                CustomValidator1.ErrorMessage = "Length of name must be between 3-30!";
                args.IsValid = false;
            }
            else
                args.IsValid = true;
            
        } catch (Exception ex)
        {
            args.IsValid = false;
        }

    }

    public void SurnameValidation(object source, ServerValidateEventArgs args)
    {

        try
        {

            string input = args.Value;
            //args.IsValid = ((i % 2) == 0);

            Match match = Regex.Match(input, @"^[a-zA-Z ]+$"); // RegexOptions.IgnoreCase);

            if (!match.Success)
            {
                CustomValidator2.ErrorMessage = "Only alphabets are allowed!";
                args.IsValid = false;
            }
            else if (input.Length < 3)
            {
                CustomValidator2.ErrorMessage = "Length of surname must be between 3-30!";
                args.IsValid = false;
            }
            else
                args.IsValid = true;

        }
        catch (Exception ex)
        {
            args.IsValid = false;
        }

    }
}
    }