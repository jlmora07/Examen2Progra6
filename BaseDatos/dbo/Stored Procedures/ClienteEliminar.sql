-- =============================================
-- Author:		<Juan Luis>
-- Create date: <21-04-2022>/
-- Description:	<Procedimiento que elimina cliente>/
-- =============================================

CREATE PROCEDURE [dbo].[ClienteEliminar]
  @IdCliente INT

AS
 BEGIN
  SET NOCOUNT ON

  BEGIN TRANSACTION TRASA

  BEGIN TRY

   DELETE FROM dbo.Cliente
   WHERE IdCliente= @IdCliente

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
