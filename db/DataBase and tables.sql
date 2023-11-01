/****** First, create the database ******/
USE [master]
GO

CREATE DATABASE [LoanSystem]

/****** Create the tables Customer******/
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
    [Income] [numeric](10, 2) NOT NULL,
    [Supervisor] [varchar](50) NOT NULL,
    [OtherIncome] [numeric](10, 2) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
    [idCustomer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Create the tables Installments******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Installments](
    [idInstallment] [int] IDENTITY(1,1) NOT NULL,
    [installmentNumber] [int] NULL,
    [amount] [numeric](10, 2) NOT NULL,
    [installmentAmount] [numeric](10, 2) NOT NULL,
    [interest] [numeric](10, 2) NOT NULL,
    [paymentDate] [datetime] NULL,
    [status] [varchar](50) NOT NULL,
    [loan] [int] NULL,
PRIMARY KEY CLUSTERED 
(
    [idInstallment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Create the tables Employee******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Create the tables Companies******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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

/****** Create the tables Guarantor******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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

/****** Create the tables Notification******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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

/****** Create the tables LoanApplication******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoanApplication](
    [idApplication] [int] IDENTITY(1,1) NOT NULL,
    [installmentCount] [int] NOT NULL,
    [requestedAmount] [int] NOT NULL,
    [loanInterest] [int] NOT NULL,
    [approval] [int] NOT NULL,
    [paymentMethod] [int] NOT NULL,
    [Customer] [int] NOT NULL,
    [guarantors] [int] NOT NULL,
    [Employee] [int] NOT NULL,
    [applicationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
    [idApplication] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Installments]  WITH CHECK ADD FOREIGN KEY([loan])
REFERENCES [dbo].[LoanApplication] ([idApplication])
GO
ALTER TABLE [dbo].[LoanApplication]  WITH CHECK ADD FOREIGN KEY([Employee])
REFERENCES [dbo].[Employee] ([idEmployee])
GO
ALTER TABLE [dbo].[LoanApplication]  WITH CHECK ADD FOREIGN KEY([Customer])
REFERENCES [dbo].[Customer] ([idCustomer])
GO
ALTER TABLE [dbo].[LoanApplication]  WITH CHECK ADD FOREIGN KEY([guarantors])
REFERENCES [dbo].[Guarantor] ([idGuarantor])
GO
USE [master]
GO
