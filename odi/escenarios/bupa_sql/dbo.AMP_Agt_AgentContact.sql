CREATE TABLE [dbo].[AMP_Agt_AgentContact]
(
[AgentContactId] [int] NOT NULL IDENTITY(1, 1) NOT FOR REPLICATION,
[AgentId] [int] NOT NULL,
[ContactBaseId] [int] NOT NULL,
[Active] [bit] NOT NULL CONSTRAINT [DF_AMP_Agt_AgentContact_Active] DEFAULT ((1))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AMP_Agt_AgentContact] ADD CONSTRAINT [PK_AMP_Agt_AgentContact] PRIMARY KEY CLUSTERED ([AgentContactId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AMP_Agt_AgentContact] WITH NOCHECK ADD CONSTRAINT [FK_AMP_Agt_AgentContact_AMP_Agt_Agent] FOREIGN KEY ([AgentId]) REFERENCES [dbo].[AMP_Agt_Agent] ([AgentId])
GO
ALTER TABLE [dbo].[AMP_Agt_AgentContact] ADD CONSTRAINT [FK_AMP_Agt_AgentContact_AMP_Generic_ContactBase] FOREIGN KEY ([ContactBaseId]) REFERENCES [dbo].[AMP_Generic_ContactBase] ([ContactBaseId])
GO
