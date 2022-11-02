<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanelMerc/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="Menu_Mercedes.aspx.cs" Inherits="MercedesBenzProject.AdminPanelMerc.Menu_Mercedes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
           .element{  border-radius:15px; 
            outline:none;
            height:1cm;
            border:2px solid silver;
            transition:0.3s ease-in-out;
                
        }
         .element:focus {
                transform: scale(1.2);
                border: 2px solid lightblue;
                box-shadow: 0 0 16px lightblue;
            }
         th{
             background-color:#0984e3;
             color:snow;
             font-family:'Times New Roman'
                 
         }
         tr{
             transition:0.3s linear;
         }
         tr:hover{
             background-color:silver;
         }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <img style="width: 1cm; height: 1cm" src="../Image/MercedesBenzKing.png" /> <span style="font-family:'Times New Roman';font-size:25px">Mercedes-Benz Menu</span>
    <br />
      <br />
    <div class="col-lg-12 container">
        <div class="col-md-3">
              <asp:TextBox class="element" placeholder="Menu adı" ID="TextBox1" runat="server"></asp:TextBox>
        </div>
         <div class="col-md-3">
              <asp:TextBox class="element" placeholder="Menu URL" ID="TextBox2" runat="server"></asp:TextBox>
        </div>
        <div class="col-md-3">
              <asp:TextBox class="element" textmode="Number" placeholder="Menu Sıra" ID="TextBox3" runat="server"></asp:TextBox>
        </div>
         <div class="col-md-3">
             <asp:Button ID="SubmitDataBTN" OnClick="SubmitDataBTN_Click" CssClass="btn btn-success" runat="server" Text="✔ Təsdiq et" />
        </div>
    </div>
    <div style="margin-top:22px" class="col-lg-12">
         <table class="table table-bordered ">

            <thead>
                <tr>
                    <th>Menu adı</th>
                    <th>Menu URL</th>
                    <th>Menu sıra</th>
                    <th>Düzəliş et</th>
                    <th>Sil</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="RepeatMenu" runat="server" OnItemCommand="RepeatMenu_ItemCommand">
                    <ItemTemplate>
                        <tr>
                          <td><%#Eval("MenuName") %></td>
                            <td><%#Eval("MenuURL") %></td>
                            <td><%#Eval("MenuROW") %></td>

                            <td>
                                <asp:Button  ID="EditBTN"  runat="server" CssClass="btn btn-warning" Text="✎ Düzəliş et" CommandName="edit" CommandArgument='<%#Eval("MenuID") %>'/>
                            </td>
                            <td>
                                <asp:Button  ID="DeleteBTN" runat="server" CssClass="btn btn-danger" Text="⌫ Sil" CommandName="delete" CommandArgument='<%#Eval("MenuID") %>'/>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
  </table>
    </div>
</asp:Content>
