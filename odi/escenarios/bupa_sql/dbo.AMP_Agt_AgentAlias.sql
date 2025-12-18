CREATE TABLE [dbo].[AMP_Agt_AgentAlias]
(
[AgentAliasId] [int] NOT NULL IDENTITY(1, 1) NOT FOR REPLICATION,
[AgentHierarchyId] [int] NOT NULL,
[AliasTypeId] [int] NOT NULL,
[Alias] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AMP_Agt_AgentAlias] ADD CONSTRAINT [PK_AMP_Agt_AgentAlias] PRIMARY KEY CLUSTERED ([AgentAliasId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AMP_Agt_AgentAlias] ON [dbo].[AMP_Agt_AgentAlias] ([AgentHierarchyId], [AliasTypeId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AMP_Agt_AgentAlias] WITH NOCHECK ADD CONSTRAINT [FK_AMP_Agt_AgentAlias_AMP_Agt_AgentHierarchy] FOREIGN KEY ([AgentHierarchyId]) REFERENCES [dbo].[AMP_Agt_AgentHierarchy] ([AgentHierarchyId])
GO
ALTER TABLE [dbo].[AMP_Agt_AgentAlias] WITH NOCHECK ADD CONSTRAINT [FK_AMP_Agt_AgentAlias_AMP_Agt_AliasType] FOREIGN KEY ([AliasTypeId]) REFERENCES [dbo].[AMP_Agt_AliasType] ([AliasTypeId])
GO
