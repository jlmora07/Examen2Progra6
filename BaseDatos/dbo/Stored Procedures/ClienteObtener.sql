
-- =============================================
-- Author:		<Juan Luis>
-- Create date: <20-04-2022>/
-- Description:	<Procedimiento que devuelve el listado de clientes>/
-- =============================================

CREATE PROCEDURE dbo.ClienteObtener
	@IdCliente INT = NULL

AS
BEGIN 
	SET NOCOUNT ON

	SELECT IdCliente
		  ,Identificacion
		  ,Nombre
		  ,PrimerApellido
		  ,SegundoApellido
		  ,FechaNacimiento
		  ,Nacionalidad
		  ,FechaDefuncion
		  ,Genero
		  ,NombreApellidosPadre
		  ,NombreApellidosMadre
		  ,Pasaporte
		  ,CuentaIBAN
		  ,CorreoNotifica
		  ,t.IdTipoIdentificacion
		  ,t.Descripcion
	  FROM 
			dbo.Cliente C
	  INNER JOIN TipoCliente T
	  ON C.IdTipoIdentificacion = T.IdTipoIdentificacion
	WHERE
	    (@IdCliente IS NULL OR IdCliente=@IdCliente)		      

END