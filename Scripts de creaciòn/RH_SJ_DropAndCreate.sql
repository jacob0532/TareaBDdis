USE [recursos_humanos_SJ]
GO
ALTER TABLE [dbo].[PersonalSJ] DROP CONSTRAINT [FK_PersonalCartago.persona_FK]
GO
ALTER TABLE [dbo].[Persona] DROP CONSTRAINT [FK_Persona.direccion_FK]
GO
ALTER TABLE [dbo].[Direccion] DROP CONSTRAINT [FK_Direccion.provinciaFK]
GO
ALTER TABLE [dbo].[Direccion] DROP CONSTRAINT [FK_Direccion.distritoFK]
GO
ALTER TABLE [dbo].[Direccion] DROP CONSTRAINT [FK_Direccion.cantonFK]
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 13/05/2022 14:58:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Provincia]') AND type in (N'U'))
DROP TABLE [dbo].[Provincia]
GO
/****** Object:  Table [dbo].[PersonalSJ]    Script Date: 13/05/2022 14:58:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonalSJ]') AND type in (N'U'))
DROP TABLE [dbo].[PersonalSJ]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 13/05/2022 14:58:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Persona]') AND type in (N'U'))
DROP TABLE [dbo].[Persona]
GO
/****** Object:  Table [dbo].[Distrito]    Script Date: 13/05/2022 14:58:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Distrito]') AND type in (N'U'))
DROP TABLE [dbo].[Distrito]
GO
/****** Object:  Table [dbo].[Direccion]    Script Date: 13/05/2022 14:58:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Direccion]') AND type in (N'U'))
DROP TABLE [dbo].[Direccion]
GO
/****** Object:  Table [dbo].[Canton]    Script Date: 13/05/2022 14:58:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Canton]') AND type in (N'U'))
DROP TABLE [dbo].[Canton]
GO
/****** Object:  Table [dbo].[Canton]    Script Date: 13/05/2022 14:58:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Canton](
	[canton_PK] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
 CONSTRAINT [PK__Canton__7FFE75851B09F0DF] PRIMARY KEY CLUSTERED 
(
	[canton_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Direccion]    Script Date: 13/05/2022 14:58:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Direccion](
	[direccion_PK] [int] IDENTITY(1,1) NOT NULL,
	[direccion_exacta] [varchar](50) NULL,
	[provinciaFK] [int] NOT NULL,
	[cantonFK] [int] NOT NULL,
	[distritoFK] [int] NOT NULL,
 CONSTRAINT [PK__Direccio__3CE8A8742C643D63] PRIMARY KEY CLUSTERED 
(
	[direccion_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Distrito]    Script Date: 13/05/2022 14:58:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Distrito](
	[distrito_PK] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
 CONSTRAINT [PK__Distrito__5AA0BB122CE6282B] PRIMARY KEY CLUSTERED 
(
	[distrito_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 13/05/2022 14:58:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[persona_PK] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellido1] [varchar](50) NULL,
	[apellido2] [varchar](50) NULL,
	[cedula] [varchar](50) NULL,
	[direccion_FK] [int] NOT NULL,
 CONSTRAINT [PK__Persona__189F5A23C5BA73AA] PRIMARY KEY CLUSTERED 
(
	[persona_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonalSJ]    Script Date: 13/05/2022 14:58:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonalSJ](
	[personal_SJ_PK] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[contrasenna] [varchar](50) NULL,
	[estado] [bit] NULL,
	[persona_FK] [int] NOT NULL,
 CONSTRAINT [PK__Personal__896C3E7AF35D8DDF] PRIMARY KEY CLUSTERED 
(
	[personal_SJ_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 13/05/2022 14:58:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincia](
	[provincia_PK] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
 CONSTRAINT [PK__Provinci__9A2E19457F848865] PRIMARY KEY CLUSTERED 
(
	[provincia_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Direccion]  WITH CHECK ADD  CONSTRAINT [FK_Direccion.cantonFK] FOREIGN KEY([cantonFK])
REFERENCES [dbo].[Canton] ([canton_PK])
GO
ALTER TABLE [dbo].[Direccion] CHECK CONSTRAINT [FK_Direccion.cantonFK]
GO
ALTER TABLE [dbo].[Direccion]  WITH CHECK ADD  CONSTRAINT [FK_Direccion.distritoFK] FOREIGN KEY([distritoFK])
REFERENCES [dbo].[Provincia] ([provincia_PK])
GO
ALTER TABLE [dbo].[Direccion] CHECK CONSTRAINT [FK_Direccion.distritoFK]
GO
ALTER TABLE [dbo].[Direccion]  WITH CHECK ADD  CONSTRAINT [FK_Direccion.provinciaFK] FOREIGN KEY([provinciaFK])
REFERENCES [dbo].[Distrito] ([distrito_PK])
GO
ALTER TABLE [dbo].[Direccion] CHECK CONSTRAINT [FK_Direccion.provinciaFK]
GO
ALTER TABLE [dbo].[Persona]  WITH CHECK ADD  CONSTRAINT [FK_Persona.direccion_FK] FOREIGN KEY([direccion_FK])
REFERENCES [dbo].[Direccion] ([direccion_PK])
GO
ALTER TABLE [dbo].[Persona] CHECK CONSTRAINT [FK_Persona.direccion_FK]
GO
ALTER TABLE [dbo].[PersonalSJ]  WITH CHECK ADD  CONSTRAINT [FK_PersonalCartago.persona_FK] FOREIGN KEY([persona_FK])
REFERENCES [dbo].[Persona] ([persona_PK])
GO
ALTER TABLE [dbo].[PersonalSJ] CHECK CONSTRAINT [FK_PersonalCartago.persona_FK]
GO
