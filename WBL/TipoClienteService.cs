using BD;
using Entity.dbo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WBL
{
    public interface ITipoClienteService
    {
       Task<IEnumerable<TipoClienteEntity>> GETLISTA();
    }

    public class TipoClienteService : ITipoClienteService
    {
        private readonly IDataAccess sql;

        public TipoClienteService(IDataAccess _sql)
        {
            sql = _sql;
        }

        #region MetodosCRUD

        //Metodo Get

        public async Task<IEnumerable<TipoClienteEntity>> GETLISTA()
        {
            try
            {
                var result = sql.QueryAsync<TipoClienteEntity>("dbo.TipoClienteLista");
                return await result;
            }
            catch (Exception)
            {

                throw;
            }


        }

      
        

      
        #endregion
    }
}
