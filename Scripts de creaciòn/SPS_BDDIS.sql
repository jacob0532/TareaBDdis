USE [biblioteca]
GO
/****** Object:  StoredProcedure [dbo].[prestamos_vencidos_select]    Script Date: 17/05/2022 20:44:50 ******/
DROP PROCEDURE [dbo].[prestamos_vencidos_select]
GO
/****** Object:  StoredProcedure [dbo].[prestamos_activos_select]    Script Date: 17/05/2022 20:44:50 ******/
DROP PROCEDURE [dbo].[prestamos_activos_select]
GO
/****** Object:  StoredProcedure [dbo].[libros_select]    Script Date: 17/05/2022 20:44:50 ******/
DROP PROCEDURE [dbo].[libros_select]
GO
/****** Object:  StoredProcedure [dbo].[libros_select]    Script Date: 17/05/2022 20:44:50 ******/
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
	RETURN 1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[prestamos_activos_select]    Script Date: 17/05/2022 20:44:50 ******/
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
	RETURN 1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[prestamos_vencidos_select]    Script Date: 17/05/2022 20:44:50 ******/
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
	RETURN 1;
	END CATCH
END
GO
