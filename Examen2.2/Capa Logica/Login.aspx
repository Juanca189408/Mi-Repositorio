<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Exam_2.Capa_Logica.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../CSS/Estilos.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <section>
            <span></span>
            <h1>Votaciones</h1>
            <h2>Correo</h2>
            <asp:TextBox ID="Tcorreo" runat="server" TextMode="Email"></asp:TextBox>
            <h2>Contraseña</h2>
            <asp:TextBox ID="Tcontrasena" runat="server" TextMode="Password"></asp:TextBox><requiredfieldvalidator />
            <asp:Button ID="B1" runat="server" Text="Ingresar" OnClick="B1_Click" />
            <br /> <br /> <br />
             <asp:Button ID="B2" runat="server" Text="Registrarse" postbackurl="~/Capa Logica/registro.aspx" />

        </section>
    </form>
</body>
</html>
