
-- =============================================
-- Author:		<Juan Luis>
-- Create date: <20-04-2022>/
-- Description:	<Procedimiento que devuelve el listado de solicitudes>/
-- =============================================

CREATE PROCEDURE dbo.SolicitudObtener

	@IdSolicitud INT = NULL

AS
BEGIN 

	SET NOCOUNT ON

	SELECT IdSolicitud
		  ,C.IdCliente
		  ,SV.IdServicio
		  ,Cantidad
		  ,Monto
		  ,FechaEntrega
		  ,UsuarioEntrega
		  ,Observaciones
	  FROM 
			Solicitud S
	  INNER JOIN Servicio SV
	  ON S.IdServicio = SV.IdServicio
	  INNER JOIN Cliente C
	  ON S.IdCliente = C.IdCliente

	  WHERE
			(@IdSolicitud IS NULL OR S.IdSolicitud=@IdSolicitud)

END