using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MercedesBenzProject.MercedesBenz
{
    public partial class MercedesMasterPage : System.Web.UI.MasterPage
    {
        ClassSQL clas = new ClassSQL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GetMercedesMenu();
            }
        }
        protected void GetMercedesMenu()
        {
            LtMercedes.Text += "<div id='MercedesMenu'>";
            DataTable dt = clas.getdatatable("SELECT * FROM Tb_MercMenu ORDER BY MenuROW");
            LtMercedes.Text += "<ul id='MenuUL'>";
            foreach (DataRow dr in dt.Rows)
            {
                LtMercedes.Text += @"<li class='MenuHissecik'><a href='" + dr["MenuURL"].ToString() + "'>" + dr["MenuName"].ToString() + "</a></li>";
            }
            LtMercedes.Text += "</ul>";
            LtMercedes.Text += "</div>";
        }
    }
}