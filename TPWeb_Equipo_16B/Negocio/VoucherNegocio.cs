using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class VoucherNegocio
    {
        public bool ValidarCodigo(string codigo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT CodigoVoucher " + "FROM Vouchers " + "WHERE CodigoVoucher = @codigo " + "AND IdCliente IS NULL " + "AND FechaCanje IS NULL");
                datos.setearParametro("@codigo", codigo);
                datos.ejecutarAccion();

                return datos.Lector.Read(); 
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
