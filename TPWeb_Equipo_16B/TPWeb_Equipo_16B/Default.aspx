<%@ Page Title="Participá y ganá" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPWeb_Equipo_16B.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row  align-items-center justify-content-center">
        <div class="col-6 my-5 bg-dark bg-opacity-50 rounded">
            <div class="form-group row align-items-center justify-content-center">

                <label class="text-white h5 font-weight-light my-2 col-12 text-center" for="txtCodigox">¡Ingresa el código de tu voucher!</label>
      
                 <div class="col-8 d-flex flex-column">
                    <asp:TextBox ID="txtCodigo" runat="server" CssClass="form-control justify-self-start"
                        placeholder="Ej:ABC123"></asp:TextBox>
                    <asp:Label ID="lblError" runat="server" CssClass="text-white bg-danger rounded mt-2 py-1 px-2 align-self-start text-nowrap" Visible="false" />
                 </div>

                <asp:Button Text="Canjear" 
                    CssClass="btn btn-primary col-3 align-self-start"
                    ID="btnSiguiente" runat="server"
                    OnClick="btnSiguiente_Click" />
            </div>
        </div>
    </div>

</asp:Content>
