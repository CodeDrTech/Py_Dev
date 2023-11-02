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
    [name] [varchar](50) NOT NULL,
    [phone] [varchar](50) NULL,
    [cellphone] [varchar](50) NOT NULL,
    [idNumber] [nvarchar](20) NULL,
    [residence] [varchar](50) NOT NULL,
    [email] [varchar](50) NULL,
    [gender] [varchar](50) NULL,
    [company] [varchar](50) NOT NULL,
    [companyPhone] [varchar](50) NOT NULL,
    [position] [varchar](50) NOT NULL,
    [income] [numeric](10, 2) NOT NULL,
    [supervisor] [varchar](50) NOT NULL,
    [otherIncome] [numeric](10, 2) NOT NULL,
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
    [name] [varchar](50) NULL,
    [cellphone] [varchar](50) NULL,
    [salary] [varchar](50) NULL,
    [username] [varchar](50) NULL,
    [password] [varchar](50) NULL,
    [category] [varchar](50) NULL,
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
    [name] [varchar](50) NULL,
    [street] [varchar](100) NULL,
    [city] [varchar](50) NULL,
    [sector] [varchar](50) NULL,
    [number] [int] NULL,
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
    [name] [varchar](50) NULL,
    [residence] [varchar](50) NULL,
    [salary] [int] NULL,
    [idNumber] [varchar](20) NULL,
    [company] [varchar](20) NULL,
    [email] [varchar](20) NULL,
    [contact] [varchar](20) NULL,
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
    [type] [varchar](100) NULL,
    [idApplication] [int] NULL,
    [customer] [int] NULL,
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
    [requestedAmount] [numeric](10, 2) NOT NULL,
    [loanInterest] [numeric](10, 2) NOT NULL,
    [approvalAmount] [numeric](10, 2) NOT NULL,
    [paymentMethod] [varchar](50) NOT NULL,
    [idCustomer] [int] NOT NULL,
    [idGuarantor] [int] NOT NULL,
    [idEmployee] [int] NOT NULL,
	[status] [varchar](20) NOT NULL,
    [applicationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
    [idApplication] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Notification]  WITH CHECK ADD FOREIGN KEY([idApplication])
REFERENCES [dbo].[LoanApplication] ([idApplication])
GO
ALTER TABLE [dbo].[LoanApplication]  WITH CHECK ADD FOREIGN KEY([idEmployee])
REFERENCES [dbo].[Employee] ([idEmployee])
GO
ALTER TABLE [dbo].[LoanApplication]  WITH CHECK ADD FOREIGN KEY([idCustomer])
REFERENCES [dbo].[Customer] ([idCustomer])
GO
ALTER TABLE [dbo].[LoanApplication]  WITH CHECK ADD FOREIGN KEY([idGuarantor])
REFERENCES [dbo].[Guarantor] ([idGuarantor])
GO
USE [master]
GO
