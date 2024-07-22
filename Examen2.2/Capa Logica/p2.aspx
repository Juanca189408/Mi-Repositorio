<%@ Page Title="" Language="C#" MasterPageFile="~/menu.Master" AutoEventWireup="true" CodeBehind="p2.aspx.cs" Inherits="Exam_2.Capa_Logica.p2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../CSS/menu.css" rel="stylesheet" />
   <link href="../CSS/candidatos.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <nav>
	<a href="menu.aspx">Inicio</a>
	<a href="p2.aspx">Candidatos</a>
	<a href="Resultados.aspx">Resultados</a>
	<a href="login.aspx">Salir</a>
	<div class="animation start-home"></div>
</nav>
    <br />
     <br />
     <div class="candidates-container">
    <div class="candidates-container">
        <div class="candidato candidato-1">
            <img src="../Imagenes/piza.jpg" />
            <h3>R.Piza</h3>
          <asp:Button ID="btn1" runat="server" Text="PIZA" OnClick="btn1_Click" />
        </div>
        <div class="candidato candidato-2">
           <img src="../Imagenes/figueres.jpg" />
            <h3>JM.Figueres</h3>
          <asp:Button ID="btn2" runat="server" Text="FIGUERES" OnClick="btn2_Click" />
        </div>
        <div class="candidato candidato-3">
            <img src="../Imagenes/carlos.jpg" />
            <h3>C.Alvarado</h3>
         <asp:Button ID="btn3" runat="server" Text="ALVARADO" OnClick="btn3_Click" />
        </div>
    </div>
         <div>
        <asp:Label ID="lblMensajeError" runat="server" ForeColor="Red"></asp:Label>
    </div>
</asp:Content>
