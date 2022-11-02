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
    public partial class SliderMerc : System.Web.UI.Page
    {
        ClassSQL klas = new ClassSQL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ViewState["CARUSELID"] = 0;
                GetCarsModel();

            }
        }
        protected void GetCarsModel()//dropdownun sql den teqdim olunmasi
        {
            DDLCarsModel.DataValueField = "CarsCardID";
            DDLCarsModel.DataTextField = "CardHead";
            DDLCarsModel.DataSource = klas.getdatatable("Select * from Tb_CarsCard");
            DDLCarsModel.DataBind();
            DDLCarsModel.Items.Insert(0, new ListItem("Seçin", "0"));
        }

        protected void DDLCarsModel_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable dt = klas.getdatatable("Select * from Tb_CaruselTable where CardConnetID=" + DDLCarsModel.SelectedValue.ToString());
            rpslider.DataSource = dt;
            rpslider.DataBind();
        }

        protected void SubmitBTN_Click(object sender, EventArgs e)
        {
            
                if (ViewState["CARUSELID"].ToString() == "0")
                {
                    SqlCommand cmd = new SqlCommand(@"Insert into Tb_CaruselTable (CaruselURL,CardROWS, CardConnetID) values(@CaruselURL,@CardROWS,  @CardConnetID)", klas.baglanti);
                    cmd.Parameters.AddWithValue("CardROWS", txtORDER.Text);
                    cmd.Parameters.AddWithValue("CaruselURL", fileimg.FileName);
                    cmd.Parameters.AddWithValue("CardConnetID", DDLCarsModel.SelectedValue.ToString());
                    klas.baglanti.Open();
                    cmd.ExecuteNonQuery();
                    klas.baglanti.Close();
                GetCarsModel();
                DataTable dt = klas.getdatatable("Select * from Tb_CaruselTable where CardConnetID=" + DDLCarsModel.SelectedValue.ToString());
                rpslider.DataSource = dt;
                rpslider.DataBind();
                txtORDER.Text = "";
                fileimg.SaveAs(Server.MapPath(@"\CaruselMG\" + fileimg.FileName));
                DDLCarsModel.Items.Insert(0, new ListItem("Seçin", "0"));
            }
                else
                {
                    SqlCommand cmd = new SqlCommand(@"Update  Tb_CaruselTable set CaruselURL=@CaruselURL,CardROWS=@CardROWS where CARUSELID=@CARUSELID", klas.baglanti);
                //Burda sen update eliyende lokal daxili isler nazirliyine gore secib ona uygun olani update edirsen
                    cmd.Parameters.AddWithValue("CardROWS", txtORDER.Text);
                    cmd.Parameters.AddWithValue("CaruselURL", fileimg.FileName);
                    cmd.Parameters.AddWithValue("CardConnetID", DDLCarsModel.SelectedValue.ToString());
                    klas.baglanti.Open();
                    cmd.ExecuteNonQuery();
                    klas.baglanti.Close();
                GetCarsModel();
                DataTable dt = klas.getdatatable("Select * from Tb_CaruselTable where CardConnetID=" + DDLCarsModel.SelectedValue.ToString());
                rpslider.DataSource = dt;
                rpslider.DataBind();
                txtORDER.Text = "";
                DDLCarsModel.Items.Insert(0, new ListItem("Seçin", "0"));
                fileimg.SaveAs(Server.MapPath(@"\CaruselMG\" + fileimg.FileName));
               
            }
        }

        protected void rpslider_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string CarsCardID = e.CommandArgument.ToString();
            if (e.CommandName == "Edit")
            {
                DataRow dr = klas.getdatatable("Select * from Tb_CaruselTable where CARUSELID=" + CarsCardID).Rows[0];
                imgnews.ImageUrl = @"..\CaruselMG\" + dr["CaruselURL"].ToString();
                txtORDER.Text = dr["CardROWS"].ToString();
                DDLCarsModel.SelectedValue = dr["CardConnetID"].ToString();
                ViewState["CarsCardID"] = e.CommandArgument.ToString();
            }
            else if (e.CommandName == "Delete")
            {
                SqlCommand cmd = new SqlCommand("Delete from Tb_CaruselTable where CARUSELID=" + e.CommandArgument.ToString(), klas.baglanti);
                klas.baglanti.Open();
                cmd.ExecuteNonQuery();
                klas.baglanti.Close();
                GetCarsModel();
                DataTable dt = klas.getdatatable("Select * from Tb_CaruselTable where CardConnetID=" + DDLCarsModel.SelectedValue.ToString());
                rpslider.DataSource = dt;
                rpslider.DataBind();
            }
        }
    }
}