CREATE TABLE [dbo].[AMP_Common_CodeType]
(
[CodeTypeId] [int] NOT NULL IDENTITY(1, 1) NOT FOR REPLICATION,
[Name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Description] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AMP_Common_CodeType] ADD CONSTRAINT [AMP_Common_CodeType_PK] PRIMARY KEY CLUSTERED ([CodeTypeId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
