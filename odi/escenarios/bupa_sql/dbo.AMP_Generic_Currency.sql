CREATE TABLE [dbo].[AMP_Generic_Currency]
(
[CurrencyId] [int] NOT NULL IDENTITY(1, 1) NOT FOR REPLICATION,
[Code] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Description] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Symbol] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Inactive] [bit] NOT NULL CONSTRAINT [DF_AMP_Generic_Currency_Inactive] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AMP_Generic_Currency] ADD CONSTRAINT [AMP_Generic_Currency_PK] PRIMARY KEY CLUSTERED ([CurrencyId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AMP_Generic_Currency] ADD CONSTRAINT [FK_AMP_Generic_Currency_AMP_Generic_Currency1] FOREIGN KEY ([CurrencyId]) REFERENCES [dbo].[AMP_Generic_Currency] ([CurrencyId])
GO
EXEC sp_addextendedproperty N'MS_Description', N'This column has the currency symbol, as $ or MxP', 'SCHEMA', N'dbo', 'TABLE', N'AMP_Generic_Currency', 'COLUMN', N'Symbol'
GO
