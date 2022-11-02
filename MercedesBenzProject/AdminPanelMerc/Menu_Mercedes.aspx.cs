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
    public partial class Menu_Mercedes : System.Web.UI.Page
    {
        ClassSQL klas = new ClassSQL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GetMercedesMenu();
                ViewState["MenuID"] = 0;
            }
        }
        protected void GetMercedesMenu()
        {
            DataTable dt = klas.getdatatable("SELECT * FROM Tb_MercMenu ORDER BY MenuROW");
            RepeatMenu.DataSource = dt;
            RepeatMenu.DataBind();
        }

        protected void RepeatMenu_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            //Duzelis et duymesi
            if (e.CommandName.ToString() == "edit")
            {
                DataTable dt = klas.getdatatable("Select * from Tb_MercMenu WHERE MenuID=" + e.CommandArgument.ToString());

                TextBox1.Text = dt.Rows[0]["MenuName"].ToString();
                TextBox2.Text = dt.Rows[0]["MenuURL"].ToString();
                TextBox3.Text = dt.Rows[0]["MenuRow"].ToString();
                ViewState["MenuID"] = e.CommandArgument.ToString();

            }

            //Sil duymesi
            else if (e.CommandName.ToString() == "delete")
            {
                SqlCommand cmd = new SqlCommand("Delete from Tb_MercMenu WHERE  MenuID= " + e.CommandArgument.ToString(), klas.baglanti);
                klas.baglanti.Open();
                cmd.ExecuteNonQuery();
                klas.baglanti.Close();
                GetMercedesMenu();
            }
        }

        protected void SubmitDataBTN_Click(object sender, EventArgs e)
        {

            if (ViewState["MenuID"].ToString() == "0")
            {
                SqlCommand cmd = new SqlCommand("Insert Into Tb_MercMenu (MenuName,MenuURL,MenuRow) values(@MenuName,@MenuURL,@MenuRow)", klas.baglanti);
                cmd.Parameters.AddWithValue("MenuName", TextBox1.Text);
                cmd.Parameters.AddWithValue("MenuURL", TextBox2.Text);
                cmd.Parameters.AddWithValue("MenuRow", TextBox3.Text);
                klas.baglanti.Open();
                cmd.ExecuteNonQuery();
                klas.baglanti.Close();
                GetMercedesMenu();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Diqqət !!!", "tesdiqle();", true);
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";

            }
            else if (ViewState["MenuID"].ToString() != "0")
            {
                SqlCommand cmd = new SqlCommand("Update Tb_MercMenu set MenuName=@MenuName,MenuURL=@MenuURL,MenuRow=@MenuRow where MenuID=@MenuID", klas.baglanti);
                cmd.Parameters.AddWithValue("MenuName", TextBox1.Text);
                cmd.Parameters.AddWithValue("MenuURL", TextBox2.Text);
                cmd.Parameters.AddWithValue("MenuRow", TextBox3.Text);
                cmd.Parameters.AddWithValue("MenuID", ViewState["MenuID"].ToString());
                klas.baglanti.Open();
                cmd.ExecuteNonQuery();
                klas.baglanti.Close();
                GetMercedesMenu();

            }
        }
    }
}