
-- =============================================
-- Author:		<Juan Luis>
-- Create date: <20-04-2022>/
-- Description:	<Procedimiento que devuelve el listado de servicio>/
-- =============================================

CREATE PROCEDURE dbo.ServicioObtener
	@IdServicio INT = NULL

AS
BEGIN 
	SET NOCOUNT ON

    SELECT IdServicio
          ,NombreServicio
          ,PlazoEntrega
          ,CostoServicio
          ,Estado
          ,CuentaContable
      FROM 
           dbo.Servicio
	WHERE
	    (IdServicio IS NULL OR IdServicio=@IdServicio)	      

END