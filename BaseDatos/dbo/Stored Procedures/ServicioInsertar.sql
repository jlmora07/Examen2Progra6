-- =============================================
-- Author:		<Juan Luis>
-- Create date: <20-04-22 23:25>/
-- Description:	<Procedimiento para insertar servicios>/
-- =============================================

CREATE PROCEDURE ServicioInsertar

@NombreServicio		varchar(128),
@PlazoEntrega		int,
@CostoServicio		decimal(18,2),
@Estado				bit,
@CuentaContable		varchar(50)

AS

 BEGIN
  SET NOCOUNT ON

  BEGIN TRANSACTION TRASA

  BEGIN TRY

  INSERT INTO dbo.Servicio
  (
       NombreServicio
      ,PlazoEntrega
      ,CostoServicio
      ,Estado
      ,CuentaContable
  

  )
  VALUES
  (
	  @NombreServicio,
      @PlazoEntrega,
      @CostoServicio,
      @Estado,
      @CuentaContable

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

