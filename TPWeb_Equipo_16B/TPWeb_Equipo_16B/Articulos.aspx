<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Articulos.aspx.cs" Inherits="TPWeb_Equipo_16B.Articulos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .card-title{
            color:#00e0ff;
        }

        #carX .carousel-item { height: 320px; }
        #carX .carousel-item img{
          width:100%;
          height:100%;
          object-fit:cover;
        }

        .card{
            background-color:#03002a;
            border: 1px solid #e9e9e9;
            border-radius: 8px;
        }

         /* Alto fijo y uniforme para el carrusel dentro de la card */
        .card .carousel-item{ height: 300px; }
        .card .carousel-item img{
        width:100%; height:100%; object-fit:cover; border-radius: 6px;
        }

        @media (max-width: 576px) { #carX .carousel-item { height: 220px; } }
        @media (min-width: 992px) { #carX .carousel-item { height: 380px; } }

    </style>

    <h2 class="my-3">Por favor elija un artículo</h2>

    <div class="row align-items-stretch justify-content-around">
        <asp:Repeater ID="repArticulos" runat="server">
            <ItemTemplate>

                <!--Card-->
                <div class="card col-12 col-lg-4 p-2 text-white shadow">

                    <!--Carrousel Imagenes-->
                    <div id='<%# "car_" + Eval("Id") %>' class="carousel slide" data-ride="carousel">
                      <div  id="carX" class="carousel-inner">
                        <asp:Repeater ID="rptImagenes" runat="server" DataSource='<%# Eval("Imagen") %>'>
                          <ItemTemplate>
                            <div class='carousel-item <%# Container.ItemIndex == 0 ? "active" : "" %>'>
                              <img src='<%# Eval("UrlImagen") %>' class="d-block w-100" alt="img" />
                            </div>
                          </ItemTemplate>
                        </asp:Repeater>
                      </div>

                      <!-- Controles en BS4: anchors + href + data-slide -->
                      <a class="carousel-control-prev" href='<%# "#car_" + Eval("Id") %>' role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Anterior</span>
                      </a>
                      <a class="carousel-control-next" href='<%# "#car_" + Eval("Id") %>' role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Siguiente</span>
                      </a>
                    </div>


                    <div class="card-body d-flex flex-column align-items-start justify-content-around">
                        <!--<h5 class="card-title"><%#Eval("Codigo") %></h5>-->
                        <h5 class="card-title"><%#Eval("Nombre") %></h5>
                        <p class="card-text"><%#Eval("Marca") %></p>
                        <p class="card-text"><%#Eval("Descripcion") %></p>
                        <p class="card-text bg-success px-2 py-1 rounded">$ <%#Eval("Precio", "{0:N0}") %></p>
                    </div>
            

                    <asp:Button Text="Elegir premio" CssClass="btn btn-danger"
                      CommandArgument ='<%# Eval("Id") %>'
                      ID="btnPrueba" runat="server"
                      OnClick="btnPrueba_Click" />
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
