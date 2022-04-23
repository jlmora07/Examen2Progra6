CREATE PROCEDURE [dbo].[TipoClienteLista]
AS
BEGIN 
	SET NOCOUNT ON

	SELECT 
	       IdTipoIdentificacion
		 , Descripcion
		 
	FROM
	    dbo.TipoCliente

END