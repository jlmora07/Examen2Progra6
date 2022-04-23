-- =============================================
-- Author:		<Juan Luis>
-- Create date: <20-04-22 23:25>/
-- Description:	<Procedimiento para insertar solicitudes>/
-- =============================================

CREATE PROCEDURE SolicitudInsertar

@IdCliente			int,
@IdServicio			int,
@Cantidad			int,
@Monto				decimal(18,2),
@FechaEntrega		datetime,
@UsuarioEntrega		varchar(50),
@Observaciones		varchar(250)

AS
 BEGIN
  SET NOCOUNT ON

  BEGIN TRANSACTION TRASA

  BEGIN TRY

  INSERT INTO dbo.Solicitud
  (
	
	   IdCliente
      ,IdServicio
      ,Cantidad
      ,Monto
      ,FechaEntrega
      ,UsuarioEntrega
      ,Observaciones
   

  )
  VALUES
  (
		@IdCliente,
		@IdServicio,
		@Cantidad,
		@Monto,
		@FechaEntrega,
		@UsuarioEntrega,
		@Observaciones

  )

  COMMIT TRANSACTION TRASA
  SELECT 0 AS CodeError, '' AS MsgError

  END TRY

	  BEGIN CATCH
		SELECT 
			   ERROR_NUMBER() AS CodeError,
			   ERROR_MESSAGE() AS MsgError

	  ROLLBACK TRANSACTION TRASA
  
  END CATCH

  END
