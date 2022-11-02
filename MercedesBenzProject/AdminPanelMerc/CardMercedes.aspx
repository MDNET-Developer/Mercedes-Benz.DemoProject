<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanelMerc/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="CardMercedes.aspx.cs" Inherits="MercedesBenzProject.AdminPanelMerc.CardMercedes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
         .Fotozoom {
            transition: transform .2s;
           
        }

            .Fotozoom:hover {
                -ms-transform: scale(5.5); /* IE 9 */
                -webkit-transform: scale(5.5); /* Safari 3-8 */
                transform: scale(5.5);
            }
            .BTNProses{
                transition: transform .2s;
            }
            .BTNProses:hover{
                -ms-transform: scale(0.9); /* IE 9 */
                -webkit-transform: scale(0.9); /* Safari 3-8 */
                transform: scale(0.9);
            }
            .col-lg-12{
                margin-bottom:22px;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div style="margin-bottom:22px">
        <img style="width: 1cm; height: 1cm" src="../Image/MercedesBenzKing.png" /> <span style="font-family:'Times New Roman';font-size:25px">Mercedes-Benz / Avtomobil kartları</span>
  </div>
    <%--  Avtomobil markasini secin--%>
    <div class="col-lg-12">
         <asp:DropDownList ID="DDLCardType" CssClass="form-control" runat="server"></asp:DropDownList>
    </div>
    <br />
    <%--Avtomobil modelini yaz--%>
     <div class="col-lg-12 p-1">
                <asp:TextBox ID="txtCarsName" placeholder="Avtomobil modeli" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-lg-12 p-1">
               
                <%--  Main kod--%>
                <img  src="fileupload.png" />
                <asp:Image style="width:10cm;height:7cm;border:1px solid snow; color:snow" ID="imgnews" runat="server" />
                <asp:FileUpload ID="fileimg" runat="server" onchange='openFile(event)' />
            </div>
    <div class="col-lg-12 p-1">
        <asp:LinkButton Style="font-size:20px;" ID="SubmitBTN" OnClick="SubmitBTN_Click" class="btn btn-success form-control" runat="server">✔Təsdiqlə</asp:LinkButton>
    </div>
    <div class="col-lg-12">
            <table class="table table-hover">
            <thead>
                <tr>
                    <th>Avtomobilin markası</th>
                    <th>Avtomobilin şəkili</th>   
                    <th>Dəyiş</th>
                    <th>Sil</th>
                </tr>
            </thead>
            <tbody>
               <asp:Repeater ID="RPCard" runat="server" OnItemCommand="RPCard_ItemCommand">
                    <ItemTemplate>
                <tr>
                    <td><%# Eval("CardHead")%></td>
                    <td>
                        <img  class="Fotozoom" src='../MercImage/<%#Eval("CardPhoto")%>' width="100"/></td>
                    <td>
                        <asp:LinkButton class="BTNProses" ID="EditBTN" runat="server"  CommandArgument='<%#Eval("CarsCardID") %>' CommandName="Edit" CssClass="btn"><img src="EditBTN.png" /></asp:LinkButton></td>
                    <td>
                        <asp:LinkButton class="BTNProses" ID="DeleteBTN" runat="server"  CommandArgument='<%#Eval("CarsCardID") %>' CommandName="Delete" CssClass="btn"><img src="DeleteBTN.png" /></asp:LinkButton></td>
                </tr>
                
                </ItemTemplate>
        
                </asp:Repeater>
         
            </tbody>
        </table>
    </div>
    <script>
var openFile = function(file) {
    var input = file.target;

    var reader = new FileReader();
    reader.onload = function(){
      var dataURL = reader.result;
      var output = document.getElementById('ContentPlaceHolder1_imgnews');
      output.src = dataURL;
    };
    reader.readAsDataURL(input.files[0]);
  };
    </script>
</asp:Content>
