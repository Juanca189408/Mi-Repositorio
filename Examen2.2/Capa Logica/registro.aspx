<%@ Page Title="" Language="C#" MasterPageFile="~/menu.Master" AutoEventWireup="true" CodeBehind="registro.aspx.cs" Inherits="Exam_2.Capa_Logica.registro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../CSS/registro.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h2>Registro de Usuario</h2>
        <div class="form-container">
            <asp:TextBox ID="Tcorreo" runat="server" CssClass="textbox" placeholder="Correo electrónico" />
            <asp:TextBox ID="Tcontrasena" runat="server" TextMode="Password" CssClass="textbox" placeholder="Contraseña" />
            <asp:TextBox ID="Tnombre" runat="server" CssClass="textbox" placeholder="Nombre" />
            <asp:TextBox ID="Tapellido" runat="server" CssClass="textbox" placeholder="Apellido" />
            <asp:Button ID="B2" runat="server" Text="Registrarse" OnClick="B2_Click" CssClass="button" />
        </div>
    </div>
</asp:Content>
