<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanelMerc/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="SliderMerc.aspx.cs" Inherits="MercedesBenzProject.AdminPanelMerc.SliderMerc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        .col-lg-12{
            margin-bottom:30px;
        }
        th{
            background-color:#54a0ff;
            color:snow;
            font-size:15px
        }
        tr{
            transition:0.3s linear;
        }
        tr:hover{
            background-color:silver;
        }
         .Fotozoom {
            transition: transform .2s;
           
        }

            .Fotozoom:hover {
                -ms-transform: scale(5.5); /* IE 9 */
                -webkit-transform: scale(5.5); /* Safari 3-8 */
                transform: scale(5.5);
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-bottom: 22px">
        <img style="width: 1cm; height: 1cm" src="../Image/MercedesBenzKing.png" />
        <span style="font-family: 'Times New Roman'; font-size: 25px">Mercedes-Benz / Slayder foto</span>
    </div>
   
    <div class="col-lg-12">
         <p style="font-size:15px;font-family:Tahoma;margin-bottom:-1px">Avtomobil növünü seçin</p>
        <asp:DropDownList ID="DDLCarsModel" AutoPostBack="true" OnSelectedIndexChanged="DDLCarsModel_SelectedIndexChanged" CssClass="form-control" runat="server"></asp:DropDownList>
    </div>
   
     <div class="col-lg-12">
          <p style="font-size:15px;font-family:Tahoma;margin-bottom:-1px">Slayd sırası</p>
         <asp:TextBox ID="txtORDER"  TextMode="Number" CssClass="form-control" runat="server"></asp:TextBox>
    </div>
      <div class="col-lg-12">
                <%--  Main kod--%>
                <img  src="fileupload.png" />
                <asp:Image style="width:10cm;height:7cm;border:1px solid snow; color:snow" ID="imgnews" runat="server" />
                <asp:FileUpload ID="fileimg" runat="server" onchange='openFile(event)' />
            </div>
   
    <div class="col-lg-12">
        <asp:LinkButton Style="font-size:20px;" ID="SubmitBTN" OnClick="SubmitBTN_Click" class="btn btn-success form-control" runat="server">✔Təsdiqlə</asp:LinkButton>
    </div>
 <div class="col-lg-12">
     <table class="table">
         <thead>
             <tr>
                 <th>Foto</th>
                 <th>Sıra</th>
                 <th>Düzəlt</th>
                 <th>Sil</th>
             </tr>
         </thead>   
         <tbody>
             <asp:Repeater ID="rpslider" OnItemCommand="rpslider_ItemCommand" runat="server">
                 <ItemTemplate>
             <tr>
                  <td>
                        <img  class="Fotozoom" src='../CaruselMG/<%#Eval("CaruselURL") %>' width="100"/></td>
                 <td><%#Eval("CardROWS") %></td>
                 <td>
                        <asp:LinkButton class="BTNProses" ID="EditBTN" runat="server"  CommandArgument='<%#Eval("CARUSELID") %>' CommandName="Edit" CssClass="btn"><img src="EditBTN.png" /></asp:LinkButton></td>
                    <td>
                        <asp:LinkButton class="BTNProses" ID="DeleteBTN" runat="server"  CommandArgument='<%#Eval("CARUSELID") %>' CommandName="Delete" CssClass="btn"><img src="DeleteBTN.png" /></asp:LinkButton></td>
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
