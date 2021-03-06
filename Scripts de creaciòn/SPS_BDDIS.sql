USE [biblioteca]
GO
/****** Object:  StoredProcedure [dbo].[validar_profesores_activos]    Script Date: 17/05/2022 22:53:07 ******/
DROP PROCEDURE [dbo].[validar_profesores_activos]
GO
/****** Object:  StoredProcedure [dbo].[validar_deudas_prestamo]    Script Date: 17/05/2022 22:53:07 ******/
DROP PROCEDURE [dbo].[validar_deudas_prestamo]
GO
/****** Object:  StoredProcedure [dbo].[realizar_prestamo]    Script Date: 17/05/2022 22:53:07 ******/
DROP PROCEDURE [dbo].[realizar_prestamo]
GO
/****** Object:  StoredProcedure [dbo].[prestamos_vencidos_select]    Script Date: 17/05/2022 22:53:07 ******/
DROP PROCEDURE [dbo].[prestamos_vencidos_select]
GO
/****** Object:  StoredProcedure [dbo].[prestamos_activos_select]    Script Date: 17/05/2022 22:53:07 ******/
DROP PROCEDURE [dbo].[prestamos_activos_select]
GO
/****** Object:  StoredProcedure [dbo].[libros_select]    Script Date: 17/05/2022 22:53:07 ******/
DROP PROCEDURE [dbo].[libros_select]
GO
/****** Object:  StoredProcedure [dbo].[libros_select]    Script Date: 17/05/2022 22:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Joshua Arcia
-- Create date: 17/05/2022
-- Description:	Consulta los libros de la base de datos con toda su informacion
-- =============================================
CREATE PROCEDURE [dbo].[libros_select] 
	-- Add the parameters for the stored procedure here
	@p1 int = 0, 
	@p2 int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
    -- Insert statements for procedure here
	BEGIN TRY
	
	SELECT L.titulo as [Titulo],  A.nombre as [Autor],C.nombre as [Categoria], L.annoPublicacion as [Año],E.nombre AS [Editorial], L.issn as [ISSN] 
	FROM Libro L
	INNER JOIN Editorial E on L.idEditorialFK = E.id
	INNER JOIN Autor A on L.idAutorFK = A.id
	INNER JOIN Categoria C on L.idCategoriaFK = C.id
	RETURN 0;
	END TRY

	BEGIN CATCH
	SELECT    
    ERROR_PROCEDURE() AS [Procedimiento]
    ,ERROR_LINE() AS [Linea]  
    ,ERROR_MESSAGE() AS [Mensaje de error]  
	RETURN -1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[prestamos_activos_select]    Script Date: 17/05/2022 22:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Joshua Arcia
-- Create date: 17/05/2022
-- Description:	Obtiene los prestamos activos de la biblioteca
-- =============================================
CREATE   PROCEDURE [dbo].[prestamos_activos_select] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
    -- Insert statements for procedure here
	BEGIN TRY
	
	DROP TABLE IF EXISTS #TempTableEstudiantes;
	SELECT * INTO #TempTableEstudiantes
	FROM OPENQUERY(MYSQL,'SELECT * FROM persona');

	SELECT PxE.id as [Id Prestamo],
	(
	 SELECT nombre FROM #TempTableEstudiantes
	 WHERE persona_PK = PxE.idPersona
	) as [Cedula del estudiante],
	PxE.fecha as [Fecha de entrega],
	PxE.periodo as [Periodo de prestamo],
	L.titulo as [Libro prestado],
	ENC.nombre as [Encargado]
	FROM PrestamoXEstudiante PxE
	INNER JOIN Encargado ENC on PxE.idEncargadoFK = ENC.id
	INNER JOIN Libro L on PxE.idLibroFK = L.id
	WHERE (
	NOT EXISTS(SELECT idPrestamoFK FROM EntregaxEstudiante WHERE PxE.id = idPrestamoFK)
	AND
	DATEADD(day,periodo,PxE.fecha) > CAST(GETDATE() AS date)
	);

	DROP TABLE #TempTableEstudiantes;
	RETURN 0;
	END TRY

	BEGIN CATCH
	SELECT    
    ERROR_PROCEDURE() AS [Procedimiento]
    ,ERROR_LINE() AS [Linea]  
    ,ERROR_MESSAGE() AS [Mensaje de error]  
	RETURN -1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[prestamos_vencidos_select]    Script Date: 17/05/2022 22:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Joshua Arcia
-- Create date: 17/05/2022
-- Description:	Obtiene los prestamos vencidos de la biblioteca
-- =============================================
CREATE   PROCEDURE [dbo].[prestamos_vencidos_select] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
    -- Insert statements for procedure here
	BEGIN TRY
	
	DROP TABLE IF EXISTS #TempTableEstudiantes;
	SELECT * INTO #TempTableEstudiantes
	FROM OPENQUERY(MYSQL,'SELECT * FROM persona');

	SELECT PxE.id as [Id Prestamo],
	(
	 SELECT nombre FROM #TempTableEstudiantes
	 WHERE persona_PK = PxE.idPersona
	) as [Cedula del estudiante],
	PxE.fecha as [Fecha de entrega],
	PxE.periodo as [Periodo de prestamo],
	L.titulo as [Libro prestado],
	ENC.nombre as [Encargado]
	FROM PrestamoXEstudiante PxE
	INNER JOIN Encargado ENC on PxE.idEncargadoFK = ENC.id
	INNER JOIN Libro L on PxE.idLibroFK = L.id
	WHERE (
	NOT EXISTS(SELECT idPrestamoFK FROM EntregaxEstudiante WHERE PxE.id = idPrestamoFK)
	AND
	DATEADD(day,periodo,PxE.fecha) < CAST(GETDATE() AS date)
	);

	DROP TABLE #TempTableEstudiantes;
	RETURN 0;
	END TRY

	BEGIN CATCH
	SELECT    
    ERROR_PROCEDURE() AS [Procedimiento]
    ,ERROR_LINE() AS [Linea]  
    ,ERROR_MESSAGE() AS [Mensaje de error]  
	RETURN -1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[realizar_prestamo]    Script Date: 17/05/2022 22:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Joshua Arcia
-- Create date: 17/05/2022
-- Description:	Realiza un prestamo
-- =============================================
CREATE   PROCEDURE [dbo].[realizar_prestamo]
	-- Add the parameters for the stored procedure here
	@idUsuarioPrestamo int,
	@sede int,
	@periodo int,
	@fecha date,
	@idLibroFK int,
	@idEncargadoFK int,
	@debe int,
	@activo int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
    -- Insert statements for procedure here
	BEGIN TRY

	EXEC	@debe = biblioteca.dbo.validar_deudas_prestamo
			@idUsuario = @idUsuarioPrestamo;
	
	EXEC	@activo = biblioteca.dbo.validar_profesores_activos
			@idUsuario = @idUsuarioPrestamo;

	IF (@activo = 1 AND @debe = 0)
	BEGIN
	INSERT INTO [dbo].[PrestamoXEstudiante]
           ([fecha]
           ,[periodo]
           ,[idPersona]
           ,[idLibroFK]
           ,[idEncargadoFK])
     VALUES
           (@fecha
           ,@periodo
           ,@idUsuarioPrestamo
           ,@idLibroFK
           ,@idEncargadoFK)
	RETURN 0;
	END

	ELSE
		SELECT 'El usuario no califica para realizar el préstamo'
		RETURN 1;
	END TRY

	BEGIN CATCH
	SELECT    
    ERROR_PROCEDURE() AS [Procedimiento]
    ,ERROR_LINE() AS [Linea]  
    ,ERROR_MESSAGE() AS [Mensaje de error]  
	RETURN -1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[validar_deudas_prestamo]    Script Date: 17/05/2022 22:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Joshua Arcia
-- Create date: 17/05/2022
-- Description:	Verifica si la persona tiene deudas en financiero
-- =============================================
CREATE   PROCEDURE [dbo].[validar_deudas_prestamo]
	-- Add the parameters for the stored procedure here
	@idUsuario int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
    -- Insert statements for procedure here
	BEGIN TRY
	
	DROP TABLE IF EXISTS #TempTableFinanciero;
	SELECT * INTO #TempTableFinanciero
	FROM OPENQUERY(MYSQL,'SELECT * FROM financiero.multaxpersona');

	IF (EXISTS(SELECT idPersona FROM #TempTableFinanciero WHERE idPersona = @idUsuario))
		BEGIN
			DROP TABLE #TempTableFinanciero;
			RETURN 1 --Tiene multas
		END
	ELSE
		DROP TABLE #TempTableFinanciero;
		RETURN 0 --No tiene multas
	END TRY

	BEGIN CATCH
	SELECT    
    ERROR_PROCEDURE() AS [Procedimiento]
    ,ERROR_LINE() AS [Linea]  
    ,ERROR_MESSAGE() AS [Mensaje de error]  
	RETURN -1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[validar_profesores_activos]    Script Date: 17/05/2022 22:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Joshua Arcia
-- Create date: 17/05/2022
-- Description:	Verifica si el profesor está activo, en una sede
-- =============================================
CREATE   PROCEDURE [dbo].[validar_profesores_activos]
	-- Add the parameters for the stored procedure here
	@idUsuario int,
	@sede int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
    -- Insert statements for procedure here
	BEGIN TRY
	IF @sede = 1
	BEGIN
		RETURN SELECT estado FROM recursos_humanos.dbo.PersonalCartago WHERE estado = 1 AND personal_cartago_PK = @idUsuario
	END

	ELSE IF @sede = 2
	BEGIN
		RETURN SELECT estado FROM recursos_humanos_alajuela.dbo.PersonalAlajuela WHERE estado = 1 AND personal_alajuela_PK = @idUsuario
	END

	ELSE IF @sede = 3
	BEGIN
		RETURN SELECT estado FROM recursos_humanos_SJ.dbo.PersonalSJ WHERE estado = 1 AND personal_SJ_PK = @idUsuario
	END

	ElSE
	SELECT 'El identificador de sede no es correcto'
	RETURN 0;
	
	END TRY

	BEGIN CATCH
	SELECT    
    ERROR_PROCEDURE() AS [Procedimiento]
    ,ERROR_LINE() AS [Linea]  
    ,ERROR_MESSAGE() AS [Mensaje de error]  
	RETURN -1;
	END CATCH
END
GO
