using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MercedesBenzProject.MercedesBenz
{
    public partial class MercedesCars_Detail : System.Web.UI.Page
    {
        ClassSQL klas = new ClassSQL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string CarsCardID;
               
 
                     CarsCardID = Request.QueryString["CarsCardID"].ToString();
      
               
                GetCarsSlider(CarsCardID);
                GetCarsInfo(CarsCardID);
            }
        }
        protected void GetCarsSlider(string CarsCardID)
        {
            DataTable dt = klas.getdatatable(" Select * , case when(row_number() over(order by CardROWS)) = 1 then 'active' else '' end as slideshow from Tb_CaruselTable where CardConnetID=" + CarsCardID);
            
            if (dt != null)
            {
                RpSlideIndicator.DataSource = dt;
                RpSlideIndicator.DataBind();
                RpSlider.DataSource = dt;
                RpSlider.DataBind();
                
            }
        }
        protected void GetCarsInfo(string CarsCardID)
        {
            DataTable dt = klas.getdatatable(" Select *  from Tb_CarsInfo where CardConSecondID=" + CarsCardID);
            if (dt != null)
            {
                RpCarsInfo.DataSource = dt;
                RpCarsInfo.DataBind();
            }
        }
    }
}