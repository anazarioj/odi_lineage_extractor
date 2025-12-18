CREATE TABLE [dbo].[AMP_Agt_Agent]
(
[AgentId] [int] NOT NULL IDENTITY(1, 1) NOT FOR REPLICATION,
[AgentNumber] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactBaseId] [int] NOT NULL,
[FromDate] [datetime] NOT NULL CONSTRAINT [DF_AMP_Agt_Agent_FromDate] DEFAULT (getdate()),
[OldNumbers] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsDirectSales] [bit] NULL CONSTRAINT [DF_AMP_Agt_Agent_IsDirectSales] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AMP_Agt_Agent] ADD CONSTRAINT [PK_AMP_Agt_Agent] PRIMARY KEY CLUSTERED ([AgentId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_AMP_Agt_Agent] ON [dbo].[AMP_Agt_Agent] ([AgentNumber]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AMP_Agt_Agent_1] ON [dbo].[AMP_Agt_Agent] ([ContactBaseId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AMP_Agt_Agent] ADD CONSTRAINT [FK_AMP_Agt_Agent_AMP_Generic_Contact_Base] FOREIGN KEY ([ContactBaseId]) REFERENCES [dbo].[AMP_Generic_ContactBase] ([ContactBaseId]) ON UPDATE CASCADE
GO
