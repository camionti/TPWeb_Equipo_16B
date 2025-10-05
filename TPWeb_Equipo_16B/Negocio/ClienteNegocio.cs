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

        public List<Cliente> Listar()
        {
            List<Cliente> lista = new List<Cliente>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT Id, Documento, Nombre, Apellido, Email, Direccion, Ciudad, CP FROM Clientes");
                datos.ejecutarLectura();

                while(datos.Lector.Read())
                {
                    Cliente cli = new Cliente
                    {
                        Id = (int)datos.Lector["Id"],
                        Documento = (string)datos.Lector["Documento"],
                        Nombre = (string)datos.Lector["Nombre"],
                        Apellido = (string)datos.Lector["Apellido"],
                        Email = (string)datos.Lector["Email"],
                        Direccion = (string)datos.Lector["Direccion"],
                        Ciudad = (string)datos.Lector["Ciudad"],
                        CP = (int)datos.Lector["CP"]
                    };

                    lista.Add(cli);
                }

                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public int Agregar(Cliente nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                //if (ExisteDNI(int.Parse(nuevo.Documento)))
                //    throw new InvalidOperationException("Ya existe un cliente con ese DNI.");
                //if (!string.IsNullOrEmpty(nuevo.Email) && ExisteEmail(nuevo.Email))
                //    throw new InvalidOperationException("Ya existe un cliente con ese email.");

                datos.setearConsulta("INSERT INTO Clientes " +
                    "(Documento, Nombre, Apellido, Email, Direccion, Ciudad, CP) " +
                    "OUTPUT INSERTED.Id " +
                    "VALUES (@Documento, @Nombre, @Apellido, @Email, @Direccion, @Ciudad, @CP)");

                datos.setearParametro("@Documento", nuevo.Documento);
                datos.setearParametro("@Nombre", nuevo.Nombre);
                datos.setearParametro("@Apellido", nuevo.Apellido);
                datos.setearParametro("@Email", nuevo.Email);
                datos.setearParametro("@Direccion", nuevo.Direccion);
                datos.setearParametro("@Ciudad", nuevo.Ciudad);
                datos.setearParametro("@CP", nuevo.CP);

                int nuevoId = Convert.ToInt32(datos.ejecutarEscalar());

                return nuevoId;
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

        public bool ExisteDNI( int dni)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT TOP (1) 1 FROM Clientes WHERE Documento = @dni");
                datos.setearParametro("@dni", dni);
                datos.ejecutarLectura();
                datos.Lector.Read();
                return Convert.ToInt32(datos.Lector[0]) == 1;
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

        public bool ExisteEmail(string email)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT TOP (1) 1 FROM Clientes WHERE Email = @email");
                datos.setearParametro("@email", email);
                datos.ejecutarLectura();
                datos.Lector.Read();
                return Convert.ToInt32(datos.Lector[0]) == 1;
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

        public Cliente ObtenerPorDocumento(string dni)
        {
            var datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT TOP (1) Id, Documento, Nombre, Apellido, Email, Direccion, Ciudad, CP FROM dbo.Clientes WHERE Documento = @dni");
                datos.setearParametro("@dni", dni);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    return new Cliente
                    {
                        Id = (int)datos.Lector["Id"],
                        Documento = (string)datos.Lector["Documento"],
                        Nombre = (string)datos.Lector["Nombre"],
                        Apellido = (string)datos.Lector["Apellido"],
                        Email = (string)datos.Lector["Email"],
                        Direccion = (string)datos.Lector["Direccion"],
                        Ciudad = (string)datos.Lector["Ciudad"],
                        CP = (int)datos.Lector["CP"]
                    };
                }
                return null;
            }
            catch (Exception ex) { throw ex; }

            finally { datos.cerrarConexion(); }
        }

    }
}
