<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanelMerc/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="InformationMerc.aspx.cs" Inherits="MercedesBenzProject.AdminPanelMerc.InformationMerc" %>
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
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-bottom: 22px">
        <img style="width: 1cm; height: 1cm" src="../Image/MercedesBenzKing.png" />
        <span style="font-family: 'Times New Roman'; font-size: 25px">Mercedes-Benz / Avtomobil haqqında informasiya</span>
    </div>
    <div class="col-lg-12">
        <asp:DropDownList  ID="DDLCarsModel" CssClass="form-control" runat="server"></asp:DropDownList>
    </div>
    <div class="col-lg-12">
        <div class="col-md-3">
            <asp:TextBox ID="txtEngine" CssClass="form-control" placeholder="Mühərrik" runat="server"></asp:TextBox>
        </div>
        <div class="col-md-3">
            <asp:TextBox ID="txtCYL" CssClass="form-control" placeholder="Cyl" runat="server"></asp:TextBox>
        </div>
        <div class="col-md-3">
            <asp:TextBox ID="txtPower" CssClass="form-control" placeholder="At gücü" runat="server"></asp:TextBox>
        </div>
        <div class="col-md-3">
            <asp:TextBox ID="txtTorque" CssClass="form-control" placeholder="Tork / Fırlanma anı" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="col-lg-12">
          <asp:LinkButton Style="font-size:20px;" ID="SubmitBTN" OnClick="SubmitBTN_Click" class="btn btn-success form-control" runat="server">✔Təsdiqlə</asp:LinkButton>
    </div>
    <div class="col-lg-12">
        <table class="table">
            <thead>
                <tr>
                    <th>Mühərrik</th>
                    <th>Cyl</th>
                    <th>At gücü</th>
                    <th>Tork / Fırlanma anı</th>
                    <th>Düzəliş et</th>
                    <th>Sil</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="RPCarInfo" runat="server" OnItemCommand="RPCarInfo_ItemCommand">
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("Engine")%></td>
                           <td><%# Eval("Cyl")%></td>
                            <td><%# Eval("Power")%></td>
                            <td><%# Eval("Torque")%></td>
                            <td>
                                <asp:LinkButton class="BTNProses" ID="EditBTN" runat="server" CommandArgument='<%#Eval("InfoCarsID") %>' CommandName="Edit" CssClass="btn"><img src="EditBTN.png" /></asp:LinkButton></td>
                            <td>
                                <asp:LinkButton class="BTNProses" ID="DeleteBTN" runat="server" CommandArgument='<%#Eval("InfoCarsID") %>' CommandName="Delete" CssClass="btn"><img src="DeleteBTN.png" /></asp:LinkButton></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>
</asp:Content>
