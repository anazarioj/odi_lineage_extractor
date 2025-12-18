CREATE TABLE [dbo].[AMP_Agt_AliasType]
(
[AliasTypeId] [int] NOT NULL,
[Name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Description] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AMP_Agt_AliasType] ADD CONSTRAINT [PK_AMP_Agt_AliasType] PRIMARY KEY CLUSTERED ([AliasTypeId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
