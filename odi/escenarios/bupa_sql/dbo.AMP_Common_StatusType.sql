CREATE TABLE [dbo].[AMP_Common_StatusType]
(
[StatusTypeId] [int] NOT NULL IDENTITY(1, 1) NOT FOR REPLICATION,
[TypeName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AMP_Common_StatusType] ADD CONSTRAINT [AMP_Common_StatusType_PK] PRIMARY KEY CLUSTERED ([StatusTypeId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
