using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MercedesBenzProject.AdminPanelMerc
{
    public partial class AdminPanelLogin : System.Web.UI.Page
    {
        ClassSQL klas = new ClassSQL();
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["ID"] = 0;
        }

        protected void LogInBTN_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("Select * from Tb_AdminPanel where UserName=@p1 and Password=@p2", klas.baglanti);
            cmd.Parameters.AddWithValue("p1", txtUser.Text);
            cmd.Parameters.AddWithValue("p2", txtPass.Text);
            klas.baglanti.Open();
            SqlDataAdapter dap = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            dap.Fill(dt);
            if (dt.Rows.Count == 1)
            {
                Session["ID"] = 1;
                Response.Redirect("AdminMotherPage.aspx");
                txtUser.Text = "";
                txtPass.Text = "";
            }
            else
            {
                Session["ID"] = 0;


                Page.ClientScript.RegisterStartupScript(this.GetType(), "Diqqət !!!", "mesaj();", true);


            }
            klas.baglanti.Close();
        }
    }
}