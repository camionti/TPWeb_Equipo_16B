<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Formulario.aspx.cs" Inherits="TPWeb_Equipo_16B.Formulario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


    <asp:UpdatePanel ID="upVerificarDNI" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

            <!--Panel verificar DNI-->
            <asp:Panel ID="pnlVerificarDni" runat="server" Visible="true" CssClass="row justify-content-center">
                    
                    <div class="col-6 bg-dark row p-2 pb-4 my-4 justify-content-center rounded ">
                        <h3 class="col-12 text-center font-weight-normal text-white">Verificá tu DNI</h3>

                        <asp:TextBox ID="txtDni" TextMode="Number" CssClass="form-control col-6" runat="server" />

                        <!--Btn confirmacion DNI-->
                        <asp:Button ID="btnVerificarDNI" runat="server"
                                    Text="Verificar DNI" CssClass="btn btn-primary col-3 ml-4"
                                    OnClick="btnVerificarDNI_Click" />

                        <div class="d-flex bg-black col-12">
                            <asp:RequiredFieldValidator 
                                ID="rfvTxtDni" 
                                ControlToValidate="txtDni" 
                                runat="server" 
                                ErrorMessage="Ingresá el DNI" 
                                Display="Dynamic" 
                                SetFocusOnError="true"
                                CssClass="text-white bg-danger rounded mt-3 mb-1 ml-4 py-1 px-2 text-nowrap"/>
                            <asp:RegularExpressionValidator runat="server"
                                ControlToValidate="txtDni"
                                ErrorMessage="Se necesitan 8 dígitos para el DNI"
                                ValidationExpression="^\d{8}$"
                                Display="Dynamic"
                                SetFocusOnError="true" 
                                CssClass="text-white bg-danger rounded mt-3 mb-1 ml-4 py-1 px-2 text-nowrap"
                                />
                        </div>

                    </div>
            </asp:Panel>


            <!--Panel Formulario-->
            <asp:Panel ID="pnlConfirmado" runat="server" Visible="false" CssClass="mb-3 bg-dark text-white p-2 pb-3 rounded mt-4">
                <div class="container">

                    <%if (!dniEncontrado)
                        { %>
                        <h2>Ingresá tus datos y registrate</h2>
                    <%   } else { %>
                        <h2>Verificá tus datos</h2>
                    <% }%>

                <div class="row bg-black">
                    <!-- DNI -->
                    <div class="col-md-4 mb-3 d-flex flex-column">
                        <label for="txtDocumento">DNI</label>
                        <asp:TextBox runat="server" ID="txtDocumento" CssClass="form-control"/>
                        <asp:RequiredFieldValidator 
                            ID="rfvTxtDocumento" 
                            ControlToValidate="txtDocumento" 
                            runat="server" 
                            ErrorMessage="Ingresá el DNI" 
                            Display="Dynamic" 
                            SetFocusOnError="true"
                            CssClass="text-white bg-danger rounded py-1 px-2 align-self-start text-nowrap mt-1"/>
                        <asp:RegularExpressionValidator runat="server"
                            ControlToValidate="txtDocumento"
                            ErrorMessage="Se necesitan 8 dígitos para el DNI"
                            ValidationExpression="^\d{8}$"
                            Display="Dynamic" SetFocusOnError="true"
                            CssClass="text-white bg-danger rounded py-1 px-2 align-self-start text-nowrap mt-1"/>
                    </div>

                    <!-- Nombre -->
                    <div class="col-md-4 mb-3 d-flex flex-column">
                        <label for="txtNombre">Nombre</label>
                        <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" MinLength="3" MaxLength="50"/>
                        <asp:RequiredFieldValidator                             
                            ID="rfvTxtNombre" 
                            ControlToValidate="txtNombre" 
                            runat="server" 
                            ErrorMessage="Ingresá el DNI" 
                            Display="Dynamic"
                            SetFocusOnError="true"
                            CssClass="text-white bg-danger rounded py-1 px-2 align-self-start text-nowrap mt-1"/>
                    </div>

                    <!-- Apellido -->
                    <div class="col-md-4 mb-3">
                        <label for="txtApellido">Apellido</label>
                        <asp:TextBox runat="server" ID="txtApellido" MinLength="3" CssClass="form-control" />
                    </div>
                </div>

                <div class="row">
                    <!-- Email -->
                    <div class="col-md-6 mb-3 d-flex flex-column">
                        <label for="txtEmail">Email</label>
                        <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" TextMode="Email" />
                    <asp:RequiredFieldValidator                             
                        ID="rfvTxtEmail" 
                        ControlToValidate="txtEmail" 
                        runat="server" 
                        ErrorMessage="Ingresá tu email" 
                        Display="Dynamic"
                        SetFocusOnError="true"
                        CssClass="text-white bg-danger rounded py-1 px-2 align-self-start text-nowrap mt-1"/>
                    </div>
                    <asp:RegularExpressionValidator 
                        runat="server" ControlToValidate="txtEmail"
                        ErrorMessage="Formato de email inválido"
                        ValidationExpression="^[\w\.\-+%]+@(?:[\w-]+\.)+[A-Za-z]{2,}$" 
                        Display="Dynamic"
                        CssClass="text-white bg-danger rounded py-1 px-2 align-self-start text-nowrap mt-1"/>
                </div>

                <div class="row">
                    <!-- Dirección -->
                    <div class="col-md-6 mb-3 d-flex flex-column">
                        <label for="txtDireccion">Dirección</label>
                        <asp:TextBox runat="server" ID="txtDireccion" CssClass="form-control" MinLength="10"/>
                        <asp:RequiredFieldValidator                             
                            ID="RequiredFieldValidator1" 
                            ControlToValidate="txtEmail" 
                            runat="server" 
                            ErrorMessage="Ingresá tu dirección" 
                            Display="Dynamic"
                            SetFocusOnError="true"
                            CssClass="text-white bg-danger rounded py-1 px-2 align-self-start text-nowrap mt-1"/>
                    </div>

                    <!-- Ciudad -->
                    <div class="col-md-3 mb-3">
                        <label for="txtCiudad">Ciudad</label>
                        <asp:TextBox runat="server" ID="txtCiudad" CssClass="form-control" />
                    </div>

                    <!-- CP -->
                    <div class="col-md-3 mb-3 d-flex flex-column">
                        <label for="txtCP">CP</label>
                        <asp:TextBox runat="server" ID="txtCP" CssClass="form-control" TextMode="Number" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCP"
                            ErrorMessage="Ingresá tu CP" Display="Dynamic" 3
                            CssClass="text-white bg-danger rounded py-1 px-2 align-self-start text-nowrap mt-1"/>
                        <asp:RangeValidator runat="server" ControlToValidate="txtCP"
                            Type="Integer" MinimumValue="1000" MaximumValue="9999"
                            ErrorMessage="el CP debe ser entre 1000 y 9999" Display="Dynamic"
                            CssClass="text-white bg-danger rounded py-1 px-2 align-self-start text-nowrap  mt-1"/>
                    </div>
                </div>

                <!-- Checkbox -->
                <div class="form-check mb-3">
                    <asp:CheckBox runat="server" ID="chkTerminos" CssClass="form-check-input" />
                    <label class="form-check-label" for="chkTerminos">
                        Acepto los términos y condiciones.
                    </label>
                    <asp:Label ID="lblMensaje" runat="server" CssClass="text-white bg-danger rounded ml-1 align-self-start text-nowrap" />
                </div>

                <!-- Botón -->
                <asp:Button runat="server" ID="btnParticipar" CssClass="btn btn-primary" Text="¡Participar!" OnClick="btnParticipar_Click" />
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
