using System;
using Negocio;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPWeb_Equipo_16B
{
    public partial class Login : System.Web.UI.Page
    {

        protected void btnSiguiente_Click(object sender, EventArgs e)
        {
            string codigoIngresado = txtCodigo.Text.Trim();
            VoucherNegocio negocio = new VoucherNegocio();

            if (negocio.ValidarCodigo(codigoIngresado))
            {
                //codigo valido
                Response.Redirect("Articulos.aspx?codigo=" + codigoIngresado);
            }
            else
            {
                //codigo invalido
                lblError.Text = "El código ingresado no existe o ya fue utilizado.";
                lblError.Visible = true;
            }
        }
    }
}