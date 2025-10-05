<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Exitos.aspx.cs" Inherits="TPWeb_Equipo_16B.Exitos" %>
<%@ Import Namespace="Dominio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>¡<%:((Cliente)Session["cliente"])?.Nombre %> ya estas participando de nuestro sorteo!</h1>
    <p>TE DESAMOS MUCHA SUERTE🍀</p>
     <asp:Button Text="Volver al inicio" CssClass="btn btn-primary"
             ID="btnInicio" runat="server"
             OnClick="btnInicio_Click" />
</asp:Content>
