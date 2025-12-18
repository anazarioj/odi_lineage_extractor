CREATE TABLE [dbo].[AMP_Common_Status]
(
[StatusId] [int] NOT NULL IDENTITY(1, 1) NOT FOR REPLICATION,
[StatusTypeId] [int] NOT NULL,
[Code] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Description] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Enabled] [bit] NOT NULL CONSTRAINT [DF_AMP_Common_Status_Enabled] DEFAULT ((1))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AMP_Common_Status] ADD CONSTRAINT [AMP_Common_Status_PK] PRIMARY KEY CLUSTERED ([StatusId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AMP_Common_Status_Code] ON [dbo].[AMP_Common_Status] ([Code]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_StatusType_Code] ON [dbo].[AMP_Common_Status] ([StatusTypeId], [Code]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AMP_Common_Status] ADD CONSTRAINT [AMP_Common_StatusType_AMP_Common_Status_FK1] FOREIGN KEY ([StatusTypeId]) REFERENCES [dbo].[AMP_Common_StatusType] ([StatusTypeId])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Enabled = 1, Disabled = 0', 'SCHEMA', N'dbo', 'TABLE', N'AMP_Common_Status', 'COLUMN', N'Enabled'
GO
