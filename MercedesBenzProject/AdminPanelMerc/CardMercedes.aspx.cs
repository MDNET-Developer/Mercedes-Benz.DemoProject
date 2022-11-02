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
    public partial class CardMercedes : System.Web.UI.Page
    {
        ClassSQL klas = new ClassSQL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GetCardType();
                GetKart();
                if (ViewState["CarsCardID"] == null)
                {
                    ViewState["CarsCardID"] = 0;
                }

            }
        }
        protected void GetKart()
        {
            RPCard.DataSource = klas.getdatatable("Select * from Tb_CarsCard");
            RPCard.DataBind();
        }
        protected void GetCardType()//dropdownun sql den teqdim olunmasi
        {
            DDLCardType.DataValueField = "MenuID";
            DDLCardType.DataTextField = "MenuName";
            DDLCardType.DataSource = klas.getdatatable("Select * from Tb_MercMenu");
            DDLCardType.DataBind();
            DDLCardType.Items.Insert(0, new ListItem("Seçin", "0"));
        }
        protected void RPCard_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string CarsCardID = e.CommandArgument.ToString();
            if (e.CommandName == "Edit")
            {
                DataRow dr = klas.getdatatable("Select * from Tb_CarsCard where CarsCardID=" + CarsCardID).Rows[0];
                txtCarsName.Text = dr["CardHead"].ToString();
                imgnews.ImageUrl = @"..\MercImage\" + dr["CardPhoto"].ToString();
                ViewState["Foto"]= dr["CardPhoto"].ToString();
                DDLCardType.SelectedValue = dr["MenuID"].ToString();
                ViewState["CarsCardID"] = e.CommandArgument.ToString();
            }
            else if (e.CommandName == "Delete")
            {
                SqlCommand cmd = new SqlCommand("Delete from Tb_CarsCard where CarsCardID=" + e.CommandArgument.ToString(), klas.baglanti);
                klas.baglanti.Open();
                cmd.ExecuteNonQuery();
                klas.baglanti.Close();
                GetKart();
            }
        }

        protected void SubmitBTN_Click(object sender, EventArgs e)
        {
            if (txtCarsName.Text != "")
            {
                if (ViewState["CarsCardID"].ToString() == "0")
                {
                    SqlCommand cmd = new SqlCommand(@"Insert into Tb_CarsCard (CardHead, CardPhoto, MenuID) values(@CardHead, @CardPhoto, @MenuID)", klas.baglanti);
                    cmd.Parameters.AddWithValue("CardHead", txtCarsName.Text);
                    cmd.Parameters.AddWithValue("CardPhoto", fileimg.FileName);
                    cmd.Parameters.AddWithValue("MenuID", DDLCardType.SelectedValue.ToString());
                    klas.baglanti.Open();
                    cmd.ExecuteNonQuery();
                    klas.baglanti.Close();
                    GetKart();
                    fileimg.SaveAs(Server.MapPath(@"\MercImage\" + fileimg.FileName));
                    txtCarsName.Text = "";
                }
               
                else
                {
                    string fotoname;
                    fotoname = ViewState["Foto"].ToString();
                    if (fileimg.HasFile)
                    {
                        fotoname = fileimg.FileName;
                        fileimg.SaveAs(Server.MapPath(@"\MercImage\" + fileimg.FileName));
                    }
                    SqlCommand cmd = new SqlCommand(@"Update  Tb_CarsCard set CardHead=@CardHead, CardPhoto=@CardPhoto where CarsCardID=" + ViewState["CarsCardID"].ToString(), klas.baglanti);
                    cmd.Parameters.AddWithValue("CardHead", txtCarsName.Text);
                    cmd.Parameters.AddWithValue("CardPhoto", fotoname);
                    cmd.Parameters.AddWithValue("MenuID", DDLCardType.SelectedValue.ToString());
                    klas.baglanti.Open();
                    cmd.ExecuteNonQuery();
                    klas.baglanti.Close();
                    GetKart();
                    txtCarsName.Text = "";
                    ViewState["CarsCardID"] = 0;
                }
            }
        }
    }
}