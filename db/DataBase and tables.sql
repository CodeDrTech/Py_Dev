/****** First, create the database ******/
USE [master]
GO

CREATE DATABASE [LoanSystem]

/****** Second, create the tables ******/
USE [LoanSystem]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Customer](
    [idCustomer] [int] IDENTITY(1,1) NOT NULL,
    [Name] [varchar](50) NOT NULL,
    [Phone] [varchar](50) NULL,
    [Cellphone] [varchar](50) NOT NULL,
    [IDNumber] [nvarchar](20) NULL,
    [Residence] [varchar](50) NOT NULL,
    [Email] [varchar](50) NULL,
    [Gender] [varchar](50) NULL,
    [Company] [varchar](50) NOT NULL,
    [CompanyPhone] [varchar](50) NOT NULL,
    [Position] [varchar](50) NOT NULL,
    [Income] [varchar](50) NOT NULL,
    [Supervisor] [varchar](50) NOT NULL,
    [OtherIncome] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
    [idCustomer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Installments](
    [idInstallment] [int] IDENTITY(1,1) NOT NULL,
    [installmentNumber] [int] NULL,
    [amount] [int] NULL,
    [installmentAmount] [int] NULL,
    [interest] [int] NULL,
    [paymentDate] [datetime] NULL,
    [status] [int] NULL,
    [loan] [int] NULL,
PRIMARY KEY CLUSTERED 
(
    [idInstallment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Employee](
    [idEmployee] [int] IDENTITY(1,1) NOT NULL,
    [Name] [varchar](50) NULL,
    [Cellphone] [varchar](50) NULL,
    [Salary] [varchar](50) NULL,
    [Username] [varchar](50) NULL,
    [Password] [varchar](50) NULL,
    [Category] [varchar](50) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
    [idEmployee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
    [Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[EmployeeImages](
    [ImageId] [int] NOT NULL,
    [Image] [image] NOT NULL,
    [User] [int] NULL,
PRIMARY KEY CLUSTERED 
(
    [ImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

CREATE TABLE [dbo].[Companies](
    [idCompany] [int] NOT NULL,
    [Name] [varchar](50) NULL,
    [Street] [varchar](100) NULL,
    [City] [varchar](50) NULL,
    [Sector] [varchar](50) NULL,
    [Number] [int] NULL,
 CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED 
(
    [idCompany] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Guarantor](
    [idGuarantor] [int] IDENTITY(1,1) NOT NULL,
    [Name] [varchar](50) NULL,
    [Residence] [varchar](50) NULL,
    [Salary] [int] NULL,
    [IDNumber] [varchar](20) NULL,
    [Company] [varchar](20) NULL,
    [Email] [varchar](20) NULL,
    [Contact] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
    [idGuarantor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Guarantors](
    [idGuarantor] [int] NOT NULL,
    [Name] [varchar](50) NULL,
    [Residence] [varchar](100) NULL,
    [Salary] [int] NOT NULL,
    [IDNumber] [varchar](12) NULL,
    [Company] [varchar](25) NULL,
    [Email] [varchar](25) NULL,
    [Contact] [varchar](25) NULL,
 CONSTRAINT [PK_Guarantors] PRIMARY KEY CLUSTERED 
(
    [idGuarantor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Notification](
    [idNotification] [int] IDENTITY(1,1) NOT NULL,
    [type] [int] NULL,
    [employee] [varchar](50) NULL,
    [client] [varchar](50) NULL,
    [quantity] [int] NULL,
    [description] [varchar](100) NULL,
    [date] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
    [idNotification] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[LoanApplication](
    [idApplication] [int] IDENTITY(1,1) NOT NULL,
    [installmentCount] [int] NOT NULL,
    [requestedAmount] [int] NOT NULL,
    [loanInterest] [int] NOT NULL,
    [approval] [int] NOT NULL,
    [paymentMethod] [int] NOT NULL,
    [client] [int] NULL,
    [guarant
