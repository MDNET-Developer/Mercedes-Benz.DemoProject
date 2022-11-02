using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MercedesBenzProject.MercedesBenz
{
    public partial class MercedesCars : System.Web.UI.Page
    {
        ClassSQL clas = new ClassSQL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string idmenunew = Request.QueryString["p"].ToString();
                GetMercedes(idmenunew);
            }
            

        }
        private void GetMercedes(string idmenu)
        {
            DataTable dt = clas.getdatatable("Select * from Tb_CarsCard where MenuID=" + idmenu );
            RpMercedes.DataSource = dt;
            RpMercedes.DataBind();
  
        }
        private void GetMercedesSearch()
        {
            string axtar = "Select * from Tb_CarsCard where CardHead like N'%" + txtAxtar.Text + "%'";
            SqlDataAdapter dap = new SqlDataAdapter(axtar, clas.baglanti);
            DataTable dt = new DataTable();
            dap.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                RpMercedes.DataSource = dt;
                RpMercedes.DataBind();
                txtAxtar.Text = "";
                Lblteesuf.Text = "";
                RpMercedes.Visible = true;
            }
            else
            {
                RpMercedes.Visible = false;
                Lblteesuf.Text = "Təəssüf ki , axtardığınız məlumat tapilmadı 😩";
            }
        }

        protected void btnAxtar_Click(object sender, EventArgs e)
        {

        }

        protected void txtAxtar_TextChanged(object sender, EventArgs e)
        {
            GetMercedesSearch();
        }
    }
}