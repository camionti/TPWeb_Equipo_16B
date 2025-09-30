using System;
using Dominio;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class ClienteNegocio
    {
        private string connectionString = "Server=.;Database=PROMOS_DB;Trusted_Connection=True;";

        public List<Cliente> Listar()
        {
            List<Cliente> lista = new List<Cliente>();
            using (SqlConnection conexion = new SqlConnection(connectionString))
            {
                conexion.Open();
                SqlCommand comando = new SqlCommand("SELECT Id, Documento, Nombre, Apellido, Email, Direccion, Ciudad, CP FROM Clientes", conexion);
                SqlDataReader lector = comando.ExecuteReader();

                while (lector.Read())
                {
                    Cliente cli = new Cliente
                    {
                        Id = (int)lector["Id"],
                        Documento = (string)lector["Documento"],
                        Nombre = (string)lector["Nombre"],
                        Apellido = (string)lector["Apellido"],
                        Email = (string)lector["Email"],
                        Direccion = (string)lector["Direccion"],
                        Ciudad = (string)lector["Ciudad"],
                        CP = (int)lector["CP"]
                    };
                    lista.Add(cli);
                }
            }
            return lista;
        }

        public void Agregar(Cliente nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("INSERT INTO Clientes " +
                    "(Documento, Nombre, Apellido, Email, Direccion, Ciudad, CP) " +
                    "VALUES (@Documento, @Nombre, @Apellido, @Email, @Direccion, @Ciudad, @CP)");

                datos.setearParametro("@Documento", nuevo.Documento);
                datos.setearParametro("@Nombre", nuevo.Nombre);
                datos.setearParametro("@Apellido", nuevo.Apellido);
                datos.setearParametro("@Email", nuevo.Email);
                datos.setearParametro("@Direccion", nuevo.Direccion);
                datos.setearParametro("@Ciudad", nuevo.Ciudad);
                datos.setearParametro("@CP", nuevo.CP);

                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

    }
}
