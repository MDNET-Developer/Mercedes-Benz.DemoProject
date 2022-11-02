<%@ Page Title="" Language="C#" MasterPageFile="~/MercedesBenz/MercedesMasterPage.Master" AutoEventWireup="true" CodeBehind="MercedesCars.aspx.cs" Inherits="MercedesBenzProject.MercedesBenz.MercedesCars" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <style>
        body{
            background-image:url(https://www.autotimesnews.com/wp-content/uploads/2020/01/Mercedes-3.jpg);
            background-size: cover;
        }
       .card {
           transform: scale(1);
           transition: .3s linear;
           text-align: center;
            cursor:pointer;
       }

           .card:hover {
               -ms-transform: scale(0.9); /* IE 9 */
               -webkit-transform: scale(0.9); /* Safari 3-8 */
               transform: scale(0.9);
           }
           .CarsA{
               text-decoration:none;
           }
           .CarsA:hover{
               text-decoration:none;
           }
          
   </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <div class="container">
        <div class="col-lg-12">
            <div style="float: right">
                <div style="width: 220px; border: 2px solid grey; border-radius: 15px;">
                    <asp:TextBox OnTextChanged="txtAxtar_TextChanged" Style="margin-left: 3px; width: 170px; background-color: black; color: snow; outline: none; border: none" placeholder="Search..." ID="txtAxtar" runat="server"></asp:TextBox>
                    <asp:LinkButton CssClass="MercSearchBtn" OnClick="btnAxtar_Click" ID="btnAxtar" runat="server"><img src="../Image/MercSearch_Icon.png" /></asp:LinkButton>
                </div>
            </div>
        </div>
        <br />
        <br />
        <br />
        <div class="row">
            <div class="col-lg-12"> <asp:Label Style=" font-size:55px; text-align:center;margin:10px" ID="Lblteesuf" runat="server" Text=""></asp:Label></div>
            <div class="col-lg-12">
               
                    <asp:Repeater ID="RpMercedes" runat="server">
                        <ItemTemplate>
                            <div class="col-md-3">
                            <a class="CarsA" href="MercedesCars_Detail.aspx?CarsCardID=<%#Eval("CarsCardID") %>">
                                <div class="card" style="width: 22rem; height: 20rem">
                                    <img style="width: 218px; height: 140px; padding: 5px" class="card-img-top" src="../MercImage/<%#Eval("CardPhoto") %>" alt="Card image cap">
                                    <div class="card-body">
                                        <p style="font-size: 20px; font-family: 'Times New Roman'; color: snow" class="card-text"><%#Eval("CardHead") %></p>
                                    </div>
                                </div>
                            </a>
                      </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
        </div>
    </div>
    <br />

</asp:Content>
