CREATE TABLE [dbo].[AMP_Agt_AgentLegacyNumbers]
(
[AgentLegacyNumberId] [int] NOT NULL IDENTITY(1, 1) NOT FOR REPLICATION,
[AgentId] [int] NOT NULL,
[LegacyNumber] [nvarchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TypeId] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AMP_Agt_AgentLegacyNumbers] ADD CONSTRAINT [PK_dbo_AMP_Agt_AgentLegacyNumbers] PRIMARY KEY CLUSTERED ([AgentLegacyNumberId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AMP_Agt_AgentLegacyNumbers] ON [dbo].[AMP_Agt_AgentLegacyNumbers] ([AgentId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AMP_Agt_AgentLegacyNumbers_TypeId] ON [dbo].[AMP_Agt_AgentLegacyNumbers] ([LegacyNumber], [TypeId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AMP_Agt_AgentLegacyNumbers] ADD CONSTRAINT [FK_AMP_Agt_AgentLegacyNumbers_AMP_Common_Code] FOREIGN KEY ([TypeId]) REFERENCES [dbo].[AMP_Common_Code] ([CodeId])
GO
ALTER TABLE [dbo].[AMP_Agt_AgentLegacyNumbers] ADD CONSTRAINT [FK_dbo.AMP_Agt_AgentLegacyNumbers_AMP_Agt_Agent] FOREIGN KEY ([AgentId]) REFERENCES [dbo].[AMP_Agt_Agent] ([AgentId])
GO
