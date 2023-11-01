	/****** Primero crea la base de datos ******/
	USE [master]
	GO

	CREATE DATABASE [LoanSystem]

	/****** Segundo crea las tablas ******/
	USE [LoanSystem]
	GO

	SET ANSI_NULLS ON
	GO
	SET QUOTED_IDENTIFIER ON
	GO

	CREATE TABLE [dbo].[Clientes](
		[idCliente] [int] IDENTITY(1,1) NOT NULL,
		[Nombre] [varchar](50) NOT NULL,
		[Telefono] [varchar](50) NULL,
		[Celular] [varchar](50) NOT NULL,
		[Cedula] [nvarchar](20) NULL,
		[Residencia] [varchar](50) NOT NULL,
		[Correo] [varchar](50) NULL,
		[Sexo] [varchar](50) NULL,
		[Empresa] [varchar](50) NOT NULL,
		[Telefono_Empresa] [varchar](50) NOT NULL,
		[Puesto] [varchar](50) NOT NULL,
		[Ingreso] [varchar](50) NOT NULL,
		[Supervisor] [varchar](50) NOT NULL,
		[Otro_Ingreso] [varchar](50) NOT NULL,
	 CONSTRAINT [PK_Clietes] PRIMARY KEY CLUSTERED 
	(
		[idCliente] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
	GO

	CREATE TABLE [dbo].[cuotas](
		[id_cuota] [int] IDENTITY(1,1) NOT NULL,
		[no_cuota] [int] NULL,
		[monto] [int] NULL,
		[monto_cuota] [int] NULL,
		[interes_cuota] [int] NULL,
		[fecha_de_pago] [datetime] NULL,
		[estado] [int] NULL,
		[prestamo] [int] NULL,
	PRIMARY KEY CLUSTERED 
	(
		[id_cuota] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	GO

	CREATE TABLE [dbo].[Empleado](
		[idEmpleado] [int] IDENTITY(1,1) NOT NULL,
		[Nombre] [varchar](50) NULL,
		[Celular] [varchar](50) NULL,
		[Sueldo] [varchar](50) NULL,
		[Usuario] [varchar](50) NULL,
		[Contra] [varchar](50) NULL,
		[Categoria] [varchar](50) NULL,
	 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
	(
		[idEmpleado] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	UNIQUE NONCLUSTERED 
	(
		[Usuario] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	GO

	CREATE TABLE [dbo].[EmpleadoImagenes](
		[IdImagenes] [int] NOT NULL,
		[Imagen] [image] NOT NULL,
		[Usuario] [int] NULL,
	PRIMARY KEY CLUSTERED 
	(
		[IdImagenes] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

	GO

	CREATE TABLE [dbo].[Empresas](
		[idEmpresa] [int] NOT NULL,
		[Nombre] [varchar](50) NULL,
		[Calle] [varchar](100) NULL,
		[Ciudad] [varchar](50) NULL,
		[Sector] [varchar](50) NULL,
		[Numero] [int] NULL,
	 CONSTRAINT [PK_Empresas] PRIMARY KEY CLUSTERED 
	(
		[idEmpresa] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	GO

	CREATE TABLE [dbo].[garante](
		[idGarante] [int] IDENTITY(1,1) NOT NULL,
		[Nombre] [varchar](50) NULL,
		[redidencia] [varchar](50) NULL,
		[Sueldo] [int] NULL,
		[cedula] [varchar](20) NULL,
		[empresa] [varchar](20) NULL,
		[correo] [varchar](20) NULL,
		[contacto] [varchar](20) NULL,
	PRIMARY KEY CLUSTERED 
	(
		[idGarante] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	GO

	CREATE TABLE [dbo].[Garantes](
		[idGarantes] [int] NOT NULL,
		[Nombre] [varchar](50) NULL,
		[Residencia] [varchar](100) NULL,
		[Sueldo] [int] NOT NULL,
		[cedula] [varchar](12) NULL,
		[empresa] [varchar](25) NULL,
		[correo] [varchar](25) NULL,
		[contacto] [varchar](25) NULL,
	 CONSTRAINT [PK_Garantes] PRIMARY KEY CLUSTERED 
	(
		[idGarantes] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	GO

	CREATE TABLE [dbo].[Notificacion](
		[idNotificacion] [int] IDENTITY(1,1) NOT NULL,
		[tipo] [int] NULL,
		[empleado] [varchar](50) NULL,
		[cliente] [varchar](50) NULL,
		[cantidad] [int] NULL,
		[descripcion] [varchar](100) NULL,
		[fecha] [datetime] NULL DEFAULT (getdate()),
	PRIMARY KEY CLUSTERED 
	(
		[idNotificacion] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	GO

	CREATE TABLE [dbo].[solicitud_prestamo](
		[id_solicitud] [int] IDENTITY(1,1) NOT NULL,
		[cantidad_cuota] [int] NOT NULL,
		[cantidad_solicitada] [int] NOT NULL,
		[interes_prestamos] [int] NOT NULL,
		[aprobacion] [int] NOT NULL,
		[forma_de_pago] [int] NOT NULL,
		[cliente] [int] NULL,
		[garantes] [int] NULL,
		[fecha_de_solicitud] [datetime] NULL,
	PRIMARY KEY CLUSTERED 
	(
		[id_solicitud] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	GO

	ALTER TABLE [dbo].[cuotas]  WITH CHECK ADD FOREIGN KEY([prestamo])
	REFERENCES [dbo].[solicitud_prestamo] ([id_solicitud])
	GO
	ALTER TABLE [dbo].[EmpleadoImagenes]  WITH CHECK ADD FOREIGN KEY([Usuario])
	REFERENCES [dbo].[Empleado] ([idEmpleado])
	GO
	ALTER TABLE [dbo].[solicitud_prestamo]  WITH CHECK ADD FOREIGN KEY([cliente])
	REFERENCES [dbo].[Clietes] ([idCliente])
	GO
	ALTER TABLE [dbo].[solicitud_prestamo]  WITH CHECK ADD FOREIGN KEY([garantes])
	REFERENCES [dbo].[garante] ([idGarante])
	GO
	USE [master]
	GO