<%@ Page Title="" Language="C#" MasterPageFile="~/menu.Master" AutoEventWireup="true" CodeBehind="resultados.aspx.cs" Inherits="Exam_2.Capa_Logica.resultados" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../CSS/resultados.css" rel="stylesheet" />
    <link href="../CSS/menu.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <nav>
        <a href="menu.aspx">Inicio</a>
        <a href="p2.aspx">Candidatos</a>
        <a href="Resultados.aspx">Resultados</a>
        <a href="login.aspx">Salir</a>
        <div class="animation start-home"></div>
    </nav>

    <h2>Resultados de la votación</h2>
    <br />

    <asp:GridView ID="GridViewResultados" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="Candidato" HeaderText="Candidato" />
            <asp:BoundField DataField="Votos" HeaderText="Votos" />
        </Columns>
    </asp:GridView>
</asp:Content>
