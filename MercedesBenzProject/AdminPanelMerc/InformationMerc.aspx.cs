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
    public partial class InformationMerc : System.Web.UI.Page
    {
        ClassSQL klas = new ClassSQL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
               
                GetCarsModel();
                GetCarsInfoTable();
                ViewState["InfoCarsID"] = 0;
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
        protected void GetCarsInfoTable()
        {
            DataTable dt = klas.getdatatable("SELECT * FROM Tb_CarsInfo");
            RPCarInfo.DataSource = dt;
            RPCarInfo.DataBind();
        }
        protected void RPCarInfo_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            //Duzelis et duymesi
            string InfoCarsID = e.CommandArgument.ToString();
            if (e.CommandName == "Edit")
            {
          DataRow dr = klas.getdatatable("Select * from Tb_CarsInfo where InfoCarsID=" + InfoCarsID).Rows[0];
                txtEngine.Text = dr["Engine"].ToString();
                txtCYL.Text = dr["Cyl"].ToString();
                txtPower.Text = dr["Power"].ToString();
                txtTorque.Text = dr["Torque"].ToString();
                GetCarsModel();
                DDLCarsModel.SelectedValue = dr["CardConSecondID"].ToString();//Baglanti yaratdigin foregn keyi yaz
                ViewState["CarsCardID"] = e.CommandArgument.ToString();
            }

            //Sil duymesi
            else if (e.CommandName == "Delete")
            {
                SqlCommand cmd = new SqlCommand("Delete from Tb_CarsInfo WHERE  InfoCarsID= " + e.CommandArgument.ToString(), klas.baglanti);
                klas.baglanti.Open();
                cmd.ExecuteNonQuery();
                klas.baglanti.Close();
                GetCarsInfoTable();
            }
        }

        protected void SubmitBTN_Click(object sender, EventArgs e)
        {
            if (ViewState["InfoCarsID"].ToString() == "0")
            {
                SqlCommand cmd = new SqlCommand("Insert Into Tb_CarsInfo (Engine,Cyl,Power,Torque,CardConSecondID) values(@Engine,@Cyl,@Power,@Torque,@CardConSecondID)", klas.baglanti);
                cmd.Parameters.AddWithValue("Engine", txtEngine.Text);
                cmd.Parameters.AddWithValue("Cyl", txtCYL.Text);
                cmd.Parameters.AddWithValue("Power", txtPower.Text);
                cmd.Parameters.AddWithValue("Torque", txtTorque.Text);
                cmd.Parameters.AddWithValue("CardConSecondID", DDLCarsModel.SelectedValue.ToString()); DDLCarsModel.SelectedValue.ToString();
                klas.baglanti.Open();
                cmd.ExecuteNonQuery();
                klas.baglanti.Close();
                GetCarsInfoTable();
                GetCarsModel();
                txtEngine.Text = "";
                txtCYL.Text = "";
                txtPower.Text = "";
                txtTorque.Text = "";

            }
            else if (ViewState["InfoCarsID"].ToString() != "0")
            {
                SqlCommand cmd = new SqlCommand("Update Tb_CarsInfo set Engine=@Engine,Cyl=@Cyl,Power=@Power,Torque=@Torque where InfoCarsID=@InfoCarsID", klas.baglanti);
                cmd.Parameters.AddWithValue("Engine", txtEngine.Text);
                cmd.Parameters.AddWithValue("Cyl", txtCYL.Text);
                cmd.Parameters.AddWithValue("Power", txtPower.Text);
                cmd.Parameters.AddWithValue("Torque", txtTorque.Text);
                cmd.Parameters.AddWithValue("InfoCarsID", ViewState["InfoCarsID"].ToString());
                klas.baglanti.Open();
                cmd.ExecuteNonQuery();
                klas.baglanti.Close();
                GetCarsInfoTable();

            }
        }
    }
}