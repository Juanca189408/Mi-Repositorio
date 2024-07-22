<%@ Page Title="" Language="C#" MasterPageFile="~/menu.Master" AutoEventWireup="true" CodeBehind="menu.aspx.cs" Inherits="Exam_2.Capa_Logica.menu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../CSS/menu.css" rel="stylesheet" />
    <link href="../CSS/inicio.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<nav>
	<a href="menu.aspx">Inicio</a>
	<a href="p2.aspx">Candidatos</a>
	<a href="Resultados.aspx">Resultados</a>
	<a href="login.aspx">Salir</a>
	<div class="animation start-home"></div>
</nav>
</asp:Content>
