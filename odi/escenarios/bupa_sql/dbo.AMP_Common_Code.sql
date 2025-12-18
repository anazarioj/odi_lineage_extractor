CREATE TABLE [dbo].[AMP_Common_Code]
(
[CodeId] [int] NOT NULL IDENTITY(1, 1) NOT FOR REPLICATION,
[CodeTypeId] [int] NOT NULL,
[Name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Description] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AMP_Common_Code] ADD CONSTRAINT [AMP_Claim_Code_PK] PRIMARY KEY CLUSTERED ([CodeId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE STATISTICS [stat_AMP_Common_Code_Name_CodeTypeId] ON [dbo].[AMP_Common_Code] ([Name], [CodeTypeId])
GO
ALTER TABLE [dbo].[AMP_Common_Code] ADD CONSTRAINT [FK_AMP_Common_Code_AMP_Common_CodeType] FOREIGN KEY ([CodeTypeId]) REFERENCES [dbo].[AMP_Common_CodeType] ([CodeTypeId])
GO
