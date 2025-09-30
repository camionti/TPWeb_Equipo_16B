<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Codigo.aspx.cs" Inherits="TPWeb_Equipo_16B.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="row">
  <div class="col-2"> </div>
  <div class="col">
    <div class="form-group">
      <label for="txtCodigo">Ingresa el código de tu voucher!</label>
      
      <asp:TextBox ID="txtCodigo" runat="server" CssClass="form-control"
                   placeholder="Ej:ABC123"></asp:TextBox>
    </div>

    <asp:Button Text="Siguiente" CssClass="btn btn-primary"
                ID="btnSiguiente" runat="server"
                OnClick="btnSiguiente_Click" />

    <asp:Label ID="lblError" runat="server" ForeColor="Red" Visible="false"></asp:Label>
  </div>
  <div class="col-2"> </div>
</div>



</asp:Content>
