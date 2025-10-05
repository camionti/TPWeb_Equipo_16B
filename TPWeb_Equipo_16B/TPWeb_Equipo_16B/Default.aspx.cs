using Negocio;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPWeb_Equipo_16B
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSiguiente_Click(object sender, EventArgs e)
        {
            string codigoIngresado = txtCodigo.Text.Trim();
            VoucherNegocio negocio = new VoucherNegocio();

            if (string.IsNullOrEmpty(codigoIngresado))
            {
                lblError.Text = "Debe escribir un código.";
                lblError.Visible = true;
            }
            else if (negocio.ValidarCodigo(codigoIngresado))
            {
                //codigo valido
                Session.Add("CodigoVoucher", codigoIngresado);
                Response.Redirect("Articulos.aspx");
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