

using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
namespace spletna_stran_faza4
{
    public partial class home_market1 : System.Web.UI.Page
{
    String connectionString = @"Server=mysql.lrk.si;Database=mz3944_b1;User ID=mz3944;Password=12comand12";

    protected void Page_Load(object sender, EventArgs e)
    {
       /* MySqlConnection conn = new MySqlConnection(connectionString);
        MySqlCommand cmd = new MySqlCommand("SELECT username FROM User WHERE username IS NOT NULL;", conn);
        conn.Open();
        DataSet dataSet = new DataSet();
        MySqlDataAdapter da = new MySqlDataAdapter(cmd);

        da.Fill(dataSet);


        DropDownList1.DataSource = dataSet;
        DropDownList1.DataBind();*/


        if (!IsPostBack)
        {
            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT id,username FROM User WHERE username IS NOT NULL;", conn))
                {
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            DropDownList1.DataSource = reader;
                            DropDownList1.DataValueField = "id";
                            DropDownList1.DataTextField = "username";
                            DropDownList1.DataBind();
                        }
                    }
                }
            }
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        using (MySqlConnection conn = new MySqlConnection(connectionString))
        {
            using (MySqlCommand cmd = new MySqlCommand("SELECT food,wood,stone,iron,gold FROM Goods WHERE id = (SELECT assets_idfk FROM Player WHERE id = (SELECT player_idfk FROM User WHERE id = " + DropDownList1.SelectedValue + "))", conn))
            {
                conn.Open();
                /*DataTable dataTable = new DataTable();
                MySqlDataAdapter da = new MySqlDataAdapter(cmd);

                da.Fill(dataTable);


                DetailsView1.DataSource = dataTable.DefaultView;
                DetailsView1.DataBind();
                */
                using (var reader = cmd.ExecuteReader())
                {
                    if (reader != null)
                    {
                        DetailsView1.DataSource = reader;
                        DetailsView1.DataBind();

                        if (DetailsView1.Rows.Count != 0)
                            Label1.Visible = false;
                        else
                            Label1.Visible = true;
                    }
                }
            }
        }
    }
}
    }