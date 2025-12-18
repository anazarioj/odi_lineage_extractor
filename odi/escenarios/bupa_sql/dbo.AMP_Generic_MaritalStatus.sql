CREATE TABLE [dbo].[AMP_Generic_MaritalStatus]
(
[MaritalStatusId] [int] NOT NULL,
[Name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AMP_Generic_MaritalStatus] ADD CONSTRAINT [AMP_Generic_MaritalStatus_PK] PRIMARY KEY CLUSTERED ([MaritalStatusId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
