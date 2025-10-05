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
        Cliente cliente = null;
        public bool dniEncontrado { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                pnlConfirmado.Visible = false;
            }
        }

        protected void btnVerificarDNI_Click(object sender, EventArgs e)
        {
            ClienteNegocio clienteNegocio = new ClienteNegocio();
            try
            {
                pnlVerificarDni.Visible = false;
                pnlConfirmado.Visible = true;
                cliente = clienteNegocio.ObtenerPorDocumento(txtDni.Text);

                txtDocumento.Enabled = false;
                txtDocumento.Text = cliente != null ? cliente.Documento : txtDni.Text;

                if (cliente != null)
                {
                    dniEncontrado = true;

                    txtNombre.Text = cliente.Nombre;
                    txtApellido.Text = cliente.Apellido;
                    txtEmail.Text = cliente.Email;
                    txtDireccion.Text = cliente.Direccion;
                    txtCiudad.Text = cliente.Ciudad;
                    txtCP.Text = cliente.CP.ToString();

                    Session.Add("cliente", cliente);
                }

            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
            }
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
        }


        protected void btnParticipar_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (!Page.IsValid)
                return;

            ClienteNegocio negocio = new ClienteNegocio();
            VoucherNegocio voucherNegocio = new VoucherNegocio();
            int idCliente = -1;

            //TRIM ELIMINA ESPACION EN BLANCO
            try
            {
                if (!chkTerminos.Checked)
                {
                    lblMensaje.Text = "Debes aceptar los términos y condiciones.";
                    lblMensaje.Visible = true;
                    return;
                }

                if (Session["cliente"] == null)
                {
                    Cliente nuevo = new Cliente
                    {
                        Documento = txtDocumento.Text.Trim(),
                        Nombre = txtNombre.Text.Trim(),
                        Apellido = txtApellido.Text.Trim(),
                        Email = txtEmail.Text.Trim(),
                        Direccion = txtDireccion.Text.Trim(),
                        Ciudad = txtCiudad.Text.Trim(),
                        CP = int.Parse(txtCP.Text),
                    };

                    idCliente = negocio.Agregar(nuevo);
                    cliente = nuevo;
                    cliente.Id = idCliente;
                    Session.Add("cliente", cliente);

                }
                else
                {
                    idCliente = ((Cliente)Session["cliente"]).Id;
                }
                

                voucherNegocio.ModificarVoucher(Session["CodigoVoucher"].ToString(), idCliente, int.Parse(Session["IdArticulo"].ToString()));

                Response.Redirect("Exitos.aspx", false);
                //int codigoPostal;
                //if (int.TryParse(txtCP.Text.Trim(), out codigoPostal))
                //{
                //    nuevo.CP = codigoPostal;
                //}
                //else
                //{
                //    lblMensaje.Text = "El código postal debe ser numérico.";
                //    lblMensaje.Visible = true;
                //    return;
                //}
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