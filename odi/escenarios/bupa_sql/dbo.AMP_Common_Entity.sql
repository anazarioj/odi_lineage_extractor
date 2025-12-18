CREATE TABLE [dbo].[AMP_Common_Entity]
(
[EntityId] [int] NOT NULL IDENTITY(1, 1) NOT FOR REPLICATION,
[Name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Description] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedOn] [datetime] NULL CONSTRAINT [DF_AMP_Common_Entity_CreatedOn] DEFAULT (getdate()),
[CreatedBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_AMP_Common_Entity_CreatedBy] DEFAULT (suser_name()),
[LastUpdatedOn] [datetime] NULL,
[LastUpdatedBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsCommissionable] [bit] NOT NULL CONSTRAINT [DF_AMP_Common_Entity_IsCommissionable] DEFAULT ((0)),
[IsAutoEmision] [bit] NOT NULL CONSTRAINT [DF_AMP_Common_Entity_IsAutoEmision] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AMP_Common_Entity] ADD CONSTRAINT [PK_AMP_Common_Entity] PRIMARY KEY CLUSTERED ([EntityId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
