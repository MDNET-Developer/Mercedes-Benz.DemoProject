<%@ Page Title="" Language="C#" MasterPageFile="~/MercedesBenz/MercedesMasterPage.Master" AutoEventWireup="true" CodeBehind="MercedesCars_Detail.aspx.cs" Inherits="MercedesBenzProject.MercedesBenz.MercedesCars_Detail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
         body{
            background-image:url(https://www.autotimesnews.com/wp-content/uploads/2020/01/Mercedes-3.jpg);
            background-size: cover;
        }

         tr{
             transition:0.3s linear;
         }
         tr:hover{
             background-color:rgb(201, 199, 199,0.7);
             color:black;
             cursor:pointer;
         }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
  <h2 style="color:snow; font-family:'Times New Roman'">Daimler-Benz</h2>  
 <div class="col-lg-12">
 <div style="width: 800px; height: 500px;left:15%;  " id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
     <asp:Repeater ID="RpSlideIndicator" runat="server">
                        <ItemTemplate>
                            <li data-target="#myCarousel" data-slide-to="0" class="<%#Eval("slideshow") %>"></li>
                        </ItemTemplate>
                    </asp:Repeater>
    </ol>

    <!-- Wrapper for slides -->

    <div class="carousel-inner">
        <asp:Repeater ID="RpSlider" runat="server">
            <ItemTemplate>
                <div class="item <%#Eval("slideshow")%>">
                    <img src="../CaruselMG/<%#Eval("CaruselURL")%>" alt="Los Angeles" style="width: 800px; height: 500px">
                </div>
            </ItemTemplate>
        </asp:Repeater>
     
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
        
        <div style="margin-top:22px" class="col-lg-12">
             <table class="table " style="color:snow">
    <thead>
      <tr>
        <th>Engine</th>
        <th>Cyl</th>
        <th>Power</th>
        <th>Torque</th>
      </tr>
    </thead>
    <tbody>

          <asp:Repeater ID="RpCarsInfo" runat="server">
              <ItemTemplate>
                        <tr>
                  <td><%#Eval("Engine") %></td>
          <td><%#Eval("Cyl") %></td>
          <td><%#Eval("Power") %></td>
          <td><%#Eval("Torque") %></td>
                        </tr>
                  </ItemTemplate>
          </asp:Repeater>

   
    </tbody>
  </table>
        </div>
  
</div>

</asp:Content>
