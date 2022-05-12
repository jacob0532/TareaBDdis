USE [Biblioteca]
GO
ALTER TABLE [dbo].[SancionXPrestamo] DROP CONSTRAINT [FK_SancionXPrestamo.idSancionFK]
GO
ALTER TABLE [dbo].[SancionXPrestamo] DROP CONSTRAINT [FK_SancionXPrestamo.idPrestamoFK]
GO
ALTER TABLE [dbo].[PrestamoXEstudiante] DROP CONSTRAINT [FK_PrestamoXEstudiante.idLibroFK]
GO
ALTER TABLE [dbo].[PrestamoXEstudiante] DROP CONSTRAINT [FK_PrestamoXEstudiante.idEncargadoFK]
GO
ALTER TABLE [dbo].[Libro] DROP CONSTRAINT [FK_Libro.idEditorialFK]
GO
ALTER TABLE [dbo].[Libro] DROP CONSTRAINT [FK_Libro.idCategoriaFK]
GO
ALTER TABLE [dbo].[Libro] DROP CONSTRAINT [FK_Libro.idAutorFK]
GO
ALTER TABLE [dbo].[EntregaXEstudiante] DROP CONSTRAINT [FK_EntregaXEstudiante.idPrestamoFK]
GO
ALTER TABLE [dbo].[EntregaXEstudiante] DROP CONSTRAINT [FK_EntregaXEstudiante.idEncargadoFK]
GO
/****** Object:  Table [dbo].[SancionXPrestamo]    Script Date: 12/5/2022 17:38:37 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SancionXPrestamo]') AND type in (N'U'))
DROP TABLE [dbo].[SancionXPrestamo]
GO
/****** Object:  Table [dbo].[Sancion ]    Script Date: 12/5/2022 17:38:37 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sancion ]') AND type in (N'U'))
DROP TABLE [dbo].[Sancion ]
GO
/****** Object:  Table [dbo].[PrestamoXEstudiante]    Script Date: 12/5/2022 17:38:37 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PrestamoXEstudiante]') AND type in (N'U'))
DROP TABLE [dbo].[PrestamoXEstudiante]
GO
/****** Object:  Table [dbo].[Libro]    Script Date: 12/5/2022 17:38:37 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Libro]') AND type in (N'U'))
DROP TABLE [dbo].[Libro]
GO
/****** Object:  Table [dbo].[EntregaXEstudiante]    Script Date: 12/5/2022 17:38:37 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EntregaXEstudiante]') AND type in (N'U'))
DROP TABLE [dbo].[EntregaXEstudiante]
GO
/****** Object:  Table [dbo].[Encargado]    Script Date: 12/5/2022 17:38:37 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Encargado]') AND type in (N'U'))
DROP TABLE [dbo].[Encargado]
GO
/****** Object:  Table [dbo].[Editorial]    Script Date: 12/5/2022 17:38:37 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Editorial]') AND type in (N'U'))
DROP TABLE [dbo].[Editorial]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 12/5/2022 17:38:37 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Categoria]') AND type in (N'U'))
DROP TABLE [dbo].[Categoria]
GO
/****** Object:  Table [dbo].[Autor]    Script Date: 12/5/2022 17:38:37 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Autor]') AND type in (N'U'))
DROP TABLE [dbo].[Autor]
GO
/****** Object:  Table [dbo].[Autor]    Script Date: 12/5/2022 17:38:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Autor__3213E83F5110E46B] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 12/5/2022 17:38:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Categori__3213E83F6DC496D1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Editorial]    Script Date: 12/5/2022 17:38:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Editorial](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Editoria__3213E83FD9E7EAD6] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Encargado]    Script Date: 12/5/2022 17:38:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Encargado](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Encargad__3213E83F8CE73BFC] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EntregaXEstudiante]    Script Date: 12/5/2022 17:38:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EntregaXEstudiante](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NOT NULL,
	[idPrestamoFK] [int] NOT NULL,
	[idEncargadoFK] [int] NOT NULL,
 CONSTRAINT [PK__EntregaX__3213E83FE31B7BBC] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Libro]    Script Date: 12/5/2022 17:38:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libro](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](50) NOT NULL,
	[annoPublicacion] [date] NOT NULL,
	[issn] [int] NOT NULL,
	[numSistema] [int] NOT NULL,
	[idAutorFK] [int] NOT NULL,
	[idEditorialFK] [int] NOT NULL,
	[idCategoriaFK] [int] NOT NULL,
 CONSTRAINT [PK__Libro__3213E83FC90EC8E8] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrestamoXEstudiante]    Script Date: 12/5/2022 17:38:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrestamoXEstudiante](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NOT NULL,
	[periodo] [int] NOT NULL,
	[idPersona] [int] NOT NULL,
	[idLibroFK] [int] NOT NULL,
	[idEncargadoFK] [int] NOT NULL,
 CONSTRAINT [PK__Prestamo__3213E83F230E1E67] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sancion ]    Script Date: 12/5/2022 17:38:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sancion ](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Sancion __3213E83F51F21C12] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SancionXPrestamo]    Script Date: 12/5/2022 17:38:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SancionXPrestamo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idPrestamoFK] [int] NOT NULL,
	[idSancionFK] [int] NOT NULL,
 CONSTRAINT [PK__SancionX__3213E83F477C1F22] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EntregaXEstudiante]  WITH CHECK ADD  CONSTRAINT [FK_EntregaXEstudiante.idEncargadoFK] FOREIGN KEY([idEncargadoFK])
REFERENCES [dbo].[Encargado] ([id])
GO
ALTER TABLE [dbo].[EntregaXEstudiante] CHECK CONSTRAINT [FK_EntregaXEstudiante.idEncargadoFK]
GO
ALTER TABLE [dbo].[EntregaXEstudiante]  WITH CHECK ADD  CONSTRAINT [FK_EntregaXEstudiante.idPrestamoFK] FOREIGN KEY([idPrestamoFK])
REFERENCES [dbo].[PrestamoXEstudiante] ([id])
GO
ALTER TABLE [dbo].[EntregaXEstudiante] CHECK CONSTRAINT [FK_EntregaXEstudiante.idPrestamoFK]
GO
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD  CONSTRAINT [FK_Libro.idAutorFK] FOREIGN KEY([idAutorFK])
REFERENCES [dbo].[Autor] ([id])
GO
ALTER TABLE [dbo].[Libro] CHECK CONSTRAINT [FK_Libro.idAutorFK]
GO
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD  CONSTRAINT [FK_Libro.idCategoriaFK] FOREIGN KEY([idCategoriaFK])
REFERENCES [dbo].[Categoria] ([id])
GO
ALTER TABLE [dbo].[Libro] CHECK CONSTRAINT [FK_Libro.idCategoriaFK]
GO
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD  CONSTRAINT [FK_Libro.idEditorialFK] FOREIGN KEY([idEditorialFK])
REFERENCES [dbo].[Editorial] ([id])
GO
ALTER TABLE [dbo].[Libro] CHECK CONSTRAINT [FK_Libro.idEditorialFK]
GO
ALTER TABLE [dbo].[PrestamoXEstudiante]  WITH CHECK ADD  CONSTRAINT [FK_PrestamoXEstudiante.idEncargadoFK] FOREIGN KEY([idEncargadoFK])
REFERENCES [dbo].[Encargado] ([id])
GO
ALTER TABLE [dbo].[PrestamoXEstudiante] CHECK CONSTRAINT [FK_PrestamoXEstudiante.idEncargadoFK]
GO
ALTER TABLE [dbo].[PrestamoXEstudiante]  WITH CHECK ADD  CONSTRAINT [FK_PrestamoXEstudiante.idLibroFK] FOREIGN KEY([idLibroFK])
REFERENCES [dbo].[Libro] ([id])
GO
ALTER TABLE [dbo].[PrestamoXEstudiante] CHECK CONSTRAINT [FK_PrestamoXEstudiante.idLibroFK]
GO
ALTER TABLE [dbo].[SancionXPrestamo]  WITH CHECK ADD  CONSTRAINT [FK_SancionXPrestamo.idPrestamoFK] FOREIGN KEY([idPrestamoFK])
REFERENCES [dbo].[PrestamoXEstudiante] ([id])
GO
ALTER TABLE [dbo].[SancionXPrestamo] CHECK CONSTRAINT [FK_SancionXPrestamo.idPrestamoFK]
GO
ALTER TABLE [dbo].[SancionXPrestamo]  WITH CHECK ADD  CONSTRAINT [FK_SancionXPrestamo.idSancionFK] FOREIGN KEY([idSancionFK])
REFERENCES [dbo].[Sancion ] ([id])
GO
ALTER TABLE [dbo].[SancionXPrestamo] CHECK CONSTRAINT [FK_SancionXPrestamo.idSancionFK]
GO
