-- =============================================
-- Author:		<Juan Luis>
-- Create date: <20-04-22 23:25>/
-- Description:	<Procedimiento para actualizar clientes>/
-- =============================================

CREATE PROCEDURE ClienteActualizar
@IdCliente              int,
@Identificacion			varchar(128),
@IdTipoIdentificacion	int,
@Nombre					varchar(128),
@PrimerApellido			varchar(128),
@SegundoApellido		varchar(128),
@FechaNacimiento		datetime,
@Nacionalidad			int,
@FechaDefuncion			datetime,
@Genero					char(1),
@NombreApellidosPadre	varchar(200),
@NombreApellidosMadre	varchar(200),
@Pasaporte				varchar(50),
@CuentaIBAN				varchar(50),
@CorreoNotifica			varchar(128)


AS
 BEGIN
  SET NOCOUNT ON

  BEGIN TRANSACTION TRASA

  BEGIN TRY

  UPDATE dbo.Cliente
    SET
  
	   Identificacion = @Identificacion,
       IdTipoIdentificacion = @IdTipoIdentificacion,
       Nombre = @Nombre,
       PrimerApellido = @PrimerApellido,
       SegundoApellido = @SegundoApellido,
       FechaNacimiento = @FechaNacimiento,
       Nacionalidad = @Nacionalidad,
       FechaDefuncion = @FechaDefuncion,
       Genero = @Genero,
       NombreApellidosPadre = @NombreApellidosPadre,
       NombreApellidosMadre = @NombreApellidosMadre,
       Pasaporte = @Pasaporte,
       CuentaIBAN = @CuentaIBAN,
       CorreoNotifica = @CorreoNotifica
       
   WHERE IdCliente = @IdCliente
      
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
