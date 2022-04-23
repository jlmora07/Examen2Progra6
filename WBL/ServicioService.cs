using BD;
using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WBL
{
    public interface IServicioService
    {
        Task<DBEntity> CREATE(ServicioEntity entity);
        Task<DBEntity> DELETE(ServicioEntity entity);
        Task<IEnumerable<ServicioEntity>> GET();
        Task<ServicioEntity> GETBYID(ServicioEntity entity);
        Task<DBEntity> UPDATE(ServicioEntity entity);
    }

    public class ServicioService : IServicioService
    {
        private readonly IDataAccess sql;

        public ServicioService(IDataAccess _sql)
        {
            sql = _sql;
        }

        #region MetodosCRUD

        //Metodo Get
        public async Task<IEnumerable<ServicioEntity>> GET()
        {
            try
            {
                var result = sql.QueryAsync<ServicioEntity>("dbo.ServicioObtener");
                return await result;
            }
            catch (Exception)
            {

                throw;
            }


        }

        //MetodoGetById
        public async Task<ServicioEntity> GETBYID(ServicioEntity entity)
        {
            try
            {
                var result = sql.QueryFirstAsync<ServicioEntity>("dbo.ServicioObtener", new { entity.IdServicio });
                return await result;
            }
            catch (Exception)
            {

                throw;
            }


        }

        //Metodo Create
        public async Task<DBEntity> CREATE(ServicioEntity entity)
        {
            try
            {
                var result = sql.ExecuteAsync("dbo.ServicioInsertar", new
                {
                    entity.NombreServicio,
                    entity.PlazoEntrega,
                    entity.CostoServicio,
                    entity.Estado,
                    entity.CuentaContable
                });


                return await result;
            }
            catch (Exception)
            {

                throw;
            }

        }


        //Metodo Update
        public async Task<DBEntity> UPDATE(ServicioEntity entity)
        {
            try
            {
                var result = sql.ExecuteAsync("dbo.ServicioActualizar", new
                {
                    entity.IdServicio,
                    entity.NombreServicio,
                    entity.PlazoEntrega,
                    entity.CostoServicio,
                    entity.Estado,
                    entity.CuentaContable
                });


                return await result;
            }
            catch (Exception)
            {

                throw;
            }

        }

        //Metodo Delete
        public async Task<DBEntity> DELETE(ServicioEntity entity)
        {
            try
            {
                var result = sql.ExecuteAsync("dbo.ServicioEliminar", new
                {
                    entity.IdServicio

                });


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
