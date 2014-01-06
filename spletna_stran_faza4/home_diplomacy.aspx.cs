using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class home_diplomacy : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
          /*  DataSet ds = new DataSet();
            DataTable tbl = new DataTable();
            tbl.Columns.Add("test", typeof(string));
            tbl.Columns.Add("rankingtypeid", typeof(int));
            ds.Tables.Add(tbl);
            DataRow row;


            Random r = new Random();

            for (int i = 0; i < 10; i++)
            {


                row = tbl.NewRow();
                row[0] = "Test" + i.ToString();
                row[1] = r.Next(1, 100);

                tbl.Rows.Add(row);
            }
         
            */
            

            String connectionString = @"Server=mysql.lrk.si;Database=mz3944_b1;User ID=mz3944;Password=12comand12";
            MySqlConnection conn = new MySqlConnection(connectionString);
            MySqlCommand cmd = new MySqlCommand("SELECT User.username, Goods.food + Goods.wood + Goods.stone + Goods.iron + Goods.gold as assetsSum FROM Goods JOIN Player ON (Goods.id = Player.assets_idfk) JOIN User ON (Player.id = User.player_idfk) WHERE Goods.id IN (SELECT assets_idfk FROM Player WHERE id IN (SELECT player_idfk FROM User WHERE username IS NOT NULL)) ORDER BY assetsSum DESC LIMIT 100", conn);

            DataSet ds = new DataSet();
            DataTable dataTable = new DataTable();

            conn.Open();
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);

            da.Fill(dataTable);
            ds.Tables.Add(dataTable);


           /*DataRow row;

            row = dataTable.NewRow();
            da.Fill(row);
            row[0] = "Test" + i.ToString();
            row[1] = r.Next(1, 100);

            tbl.Rows.Add(row);*/



            /*
            DataRow row;


            Random r = new Random();

            for (int i = 0; i < 10; i++)
            {


                row = dataTable.NewRow();
                row[0] = "Test" + i.ToString();
                row[1] = r.Next(1, 100);

                dataTable.Rows.Add(row);
            }
            */


            //da.Fill(dataTable);

   //         GridView1.con

   //         DataRow[] rows = dataTable.Select();


    /*        for (int i = 0; i < rows.Length; i++)
            {

                dataTable.Rows.Add(rows[i]);
            }*/













            //JavaScriptSerializer jSerializer = new JavaScriptSerializer();

            //string Jason1 = jSerializer.Serialize(ds.GetXml());
            jason.Value = GetJSONString(ds.Tables[0]);


        }








    }


    public static string GetJSONString(DataTable Dt)
    {

        string[] StrDc = new string[Dt.Columns.Count];
        string HeadStr = string.Empty;

        for (int i = 0; i < Dt.Columns.Count; i++)
        {

            StrDc[i] = Dt.Columns[i].Caption;

            HeadStr += "\"" + StrDc[i] + "\" : \"" + StrDc[i] + i.ToString() + "¾" + "\",";
        }

        HeadStr = HeadStr.Substring(0, HeadStr.Length - 1);

        StringBuilder Sb = new StringBuilder();
        Sb.Append("{\"" + Dt.TableName + "\" : [");

        for (int i = 0; i < Dt.Rows.Count; i++)
        {

            string TempStr = HeadStr;
            Sb.Append("{");

            for (int j = 0; j < Dt.Columns.Count; j++)
            {

                TempStr = TempStr.Replace(Dt.Columns[j] + j.ToString() + "¾", Dt.Rows[i][j].ToString());
            }

            Sb.Append(TempStr + "},");
        }

        Sb = new StringBuilder(Sb.ToString().Substring(0, Sb.ToString().Length - 1));
        Sb.Append("]}");

        return Sb.ToString();
    }

    protected void charttypeddl_SelectedIndexChanged(object sender, EventArgs e)
    {
        charttype.Value = charttypeddl.SelectedValue;

    }
}