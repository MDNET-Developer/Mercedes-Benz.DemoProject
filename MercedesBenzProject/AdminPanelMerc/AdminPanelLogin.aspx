<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPanelLogin.aspx.cs" Inherits="MercedesBenzProject.AdminPanelMerc.AdminPanelLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Panel Mercedes-Benz</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="icon" href="../Image/favicon.ico" />
</head>
<body>
    <form id="form1" runat="server">
        <style>
            body{
                background-image:url(https://car-images.bauersecure.com/pagefiles/71803/1752x1168/mercedessclass2017-097.jpg?mode=max&quality=90&scale=down);
                 background-size:cover;
                margin:0;
                padding:0;
            }
            #loginPLACE{
                position:absolute;
                top:50%;
                left:50%;
               transform: translate(-50%, -50%);
               height:10cm;
               width:10cm;
               border-radius:20px;
               background-color:rgb(189, 181, 181,0.7);
            }
                .texbox {
                    width: 300px;
                    height: 50px;
                    outline: none;
                    margin-bottom: 33px;
                    margin-left:35px;
                    transition:0.3s ease;
                    border-radius:20px;
                    border:1px solid #ededed;
                }
                .texbox:focus{
                    transform: scale(1.1); 
                }
                .btn{
                     width: 300px;
                    height: 40px;
                    outline: none;
                    margin-bottom: 33px;
                    margin-left:35px;
                    text-align:center;
                    font-size:22px;
                       
                }
                #goz{
                      transition:0.3s linear;
                      color:black;
                }
                #goz:hover{
                    color:#ffa502;
                }
        </style>
        <div>
            <div id="loginPLACE">
                  <h1 style="color: snow; text-align: center"> - Log in - </h1>
                    <asp:TextBox placeholder=" 👦 İstifadəçi adı" class="texbox" ID="txtUser" runat="server"></asp:TextBox>
                    <asp:TextBox placeholder=" 🔒 Şifrə" class="texbox" ID="txtPass" type="password" runat="server"></asp:TextBox>
                 <label onclick="myFunction()" style="margin-left: 30px; cursor: pointer;">
                    <img src="ShowMercPass.png" /><a id="goz">Şifrəni göstər</a></label>
                <asp:LinkButton ID="LogInBTN" OnClick="LogInBTN_Click" CssClass="btn btn-success" runat="server">Daxil ol</asp:LinkButton>
            </div>
        </div>
         <script>   function myFunction() {
  var x = document.getElementById("txtPass");
  if (x.type === "password") {
    x.type = "text";

  } else {
    x.type = "password";
  }
}

 function mesaj() {

            alert("Yazdığınız istifadəçi adı vəya şifrəniz doğru deyil. Zəhmət olmasa dəqiqləşdirdikdən sonra daxil olmağa cəhd edin. Əgər siz istifadəçi şifrəsini unutmusuzsa aşğıda Şifrəni unutmusuz ? düyməsinə daxil olub şifrəni bərpa eliyə bilərsiz");
        }
        </script>
    </form>
</body>


</html>
