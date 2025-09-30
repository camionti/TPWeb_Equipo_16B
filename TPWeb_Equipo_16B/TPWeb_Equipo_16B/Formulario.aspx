<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Formulario.aspx.cs" Inherits="TPWeb_Equipo_16B.Formulario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <h2>Ingresá tus datos</h2>

        <div class="row">
            <!-- DNI -->
            <div class="col-md-4 mb-3">
                <label for="txtDocumento">DNI</label>
                <asp:TextBox runat="server" ID="txtDocumento" CssClass="form-control" />
            </div>

            <!-- Nombre -->
            <div class="col-md-4 mb-3">
                <label for="txtNombre">Nombre</label>
                <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
            </div>

            <!-- Apellido -->
            <div class="col-md-4 mb-3">
                <label for="txtApellido">Apellido</label>
                <asp:TextBox runat="server" ID="txtApellido" CssClass="form-control" />
            </div>
        </div>

        <div class="row">
            <!-- Email -->
            <div class="col-md-6 mb-3">
                <label for="txtEmail">Email</label>
                <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" TextMode="Email" />
            </div>
        </div>

        <div class="row">
            <!-- Dirección -->
            <div class="col-md-6 mb-3">
                <label for="txtDireccion">Dirección</label>
                <asp:TextBox runat="server" ID="txtDireccion" CssClass="form-control" />
            </div>

            <!-- Ciudad -->
            <div class="col-md-3 mb-3">
                <label for="txtCiudad">Ciudad</label>
                <asp:TextBox runat="server" ID="txtCiudad" CssClass="form-control" />
            </div>

            <!-- CP -->
            <div class="col-md-3 mb-3">
                <label for="txtCP">CP</label>
                <asp:TextBox runat="server" ID="txtCP" CssClass="form-control" TextMode="Number" />
            </div>
        </div>

        <!-- Checkbox -->
        <div class="form-check mb-3">
            <asp:CheckBox runat="server" ID="chkTerminos" CssClass="form-check-input" />
            <label class="form-check-label" for="chkTerminos">
                Acepto los términos y condiciones.
            </label>
        </div>

        <!-- Botón -->
        <asp:Button runat="server" ID="btnParticipar" CssClass="btn btn-primary" Text="¡Participar!" OnClick="btnParticipar_Click" />
        <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger" />
    </div>
</asp:Content>
