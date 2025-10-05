using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Conexion;
using dominio;

namespace TPWeb_Equipo_16B
{
    public partial class Articulos : System.Web.UI.Page
    {
        public List<Articulo> ListaArticulo { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            ConexionArticulo conArticulo = new ConexionArticulo();
            ListaArticulo = conArticulo.Listar();

            if(!IsPostBack)
            {
                repArticulos.DataSource = ListaArticulo;
                repArticulos.DataBind();
            }
        }
        protected void btnPrueba_Click(object sender, EventArgs e)
        {
            int id = int.Parse(((Button)sender).CommandArgument);
            Session.Add("IdArticulo", id);
            Response.Redirect("Formulario.aspx", false);
        }
    }
}