using Dominio;
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
    public partial class Formulario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnParticipar_Click(object sender, EventArgs e)
        {
            //TRIM ELIMINA ESPACION EN BLANCO
            try
            {
                if (!chkTerminos.Checked)
                {
                    lblMensaje.Text = "Debes aceptar los términos y condiciones.";
                    lblMensaje.Visible = true;
                    return;
                }

                Cliente nuevo = new Cliente
                {
                    Documento = txtDocumento.Text.Trim(),
                    Nombre = txtNombre.Text.Trim(),
                    Apellido = txtApellido.Text.Trim(),
                    Email = txtEmail.Text.Trim(),
                    Direccion = txtDireccion.Text.Trim(),
                    Ciudad = txtCiudad.Text.Trim()
                };

                int codigoPostal;
                if (int.TryParse(txtCP.Text.Trim(), out codigoPostal))
                {
                    nuevo.CP = codigoPostal;
                }
                else
                {
                    lblMensaje.Text = "El código postal debe ser numérico.";
                    lblMensaje.Visible = true;
                    return;
                }
          
                ClienteNegocio negocio = new ClienteNegocio();
                negocio.Agregar(nuevo);

             
                Response.Redirect("Exitos.aspx");
            }
            catch (Exception ex)
            {
                lblMensaje.CssClass = "text-danger";
                lblMensaje.Text = "Error: " + ex.Message;
                lblMensaje.Visible = true;
            }
        }
    }
}