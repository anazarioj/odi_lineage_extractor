CREATE TABLE [dbo].[AMP_Agt_AgentHierarchy]
(
[AgentHierarchyId] [int] NOT NULL IDENTITY(1, 1) NOT FOR REPLICATION,
[AgentId] [int] NOT NULL,
[AgencyId] [int] NOT NULL,
[ParentAgentId] [int] NULL,
[ForwardAddress] [bit] NOT NULL CONSTRAINT [DF_AMP_Agt_AgentHierarchy_TransferComm] DEFAULT ((0)),
[MailingCode] [int] NOT NULL,
[BillingMailingCode] [int] NOT NULL,
[NewBusinessMailingCode] [int] NOT NULL CONSTRAINT [DF_AMP_Agt_AgentHierarchy_NewBusinessMailingCode] DEFAULT ((1889)),
[EOBMailingCode] [int] NOT NULL CONSTRAINT [DF_AMP_Agt_AgentHierarchy_EOBMailingCode] DEFAULT ((1889)),
[StatusId] [int] NOT NULL,
[PaymentMethodId] [int] NOT NULL,
[MinCommPaymentAmount] [decimal] (18, 2) NULL CONSTRAINT [DF_AMP_Agt_AgentHierarchy_MinCommPaymentAmount] DEFAULT ((0)),
[HoldCommissionNB] [bit] NOT NULL CONSTRAINT [DF_AMP_Agt_AgentHierarchy_HoldCommissionNB] DEFAULT ((0)),
[HoldCommissionRN] [bit] NOT NULL CONSTRAINT [DF_AMP_Agt_AgentHierarchy_HoldCommissionRN] DEFAULT ((0)),
[HoldCommissionMA] [bit] NOT NULL CONSTRAINT [DF_AMP_Agt_AgentHierarchy_HoldCommissionMA] DEFAULT ((0)),
[FromDate] [datetime] NOT NULL,
[ToDate] [datetime] NULL,
[LegacyAgentID] [int] NULL,
[WebProfileId] [int] NOT NULL CONSTRAINT [DF_AMP_Agt_AgentHierarchy_WebProfileId] DEFAULT ((4)),
[HoldCommissionGen] [bit] NOT NULL CONSTRAINT [DF__AMP_Agt_A__HoldC__44638242] DEFAULT ((0)),
[WebClaimSubmissionAccess] [bit] NOT NULL CONSTRAINT [WebClaimSubmissionAccess] DEFAULT ((0)),
[IsAutoEmision] [bit] NOT NULL CONSTRAINT [DF_AMP_Agt_AgentHierarchy_IsAutoEmision] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AMP_Agt_AgentHierarchy] ADD CONSTRAINT [PK_AMP_Agt_AgentHierarchy] PRIMARY KEY CLUSTERED ([AgentHierarchyId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AMP_Agt_AgentHierarchy] ON [dbo].[AMP_Agt_AgentHierarchy] ([AgencyId], [AgentId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AMP_Agt_AgentHierarchy_agent] ON [dbo].[AMP_Agt_AgentHierarchy] ([AgentId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AMP_Agt_AgentHierarchy_1] ON [dbo].[AMP_Agt_AgentHierarchy] ([ParentAgentId], [AgentId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AMP_Agt_AgentHierarchy] WITH NOCHECK ADD CONSTRAINT [FK_AMP_Agt_AgentHierarchy_AMP_Agt_Agent] FOREIGN KEY ([ParentAgentId]) REFERENCES [dbo].[AMP_Agt_Agent] ([AgentId])
GO
ALTER TABLE [dbo].[AMP_Agt_AgentHierarchy] WITH NOCHECK ADD CONSTRAINT [FK_AMP_Agt_AgentHierarchy_AMP_Agt_Agent1] FOREIGN KEY ([AgentId]) REFERENCES [dbo].[AMP_Agt_Agent] ([AgentId])
GO
ALTER TABLE [dbo].[AMP_Agt_AgentHierarchy] WITH NOCHECK ADD CONSTRAINT [FK_AMP_Agt_AgentHierarchy_AMP_Agt_AgentAgency] FOREIGN KEY ([AgencyId]) REFERENCES [dbo].[AMP_Agt_Agency] ([AgencyId])
GO
ALTER TABLE [dbo].[AMP_Agt_AgentHierarchy] ADD CONSTRAINT [FK_AMP_Agt_AgentHierarchy_AMP_Agt_AgentLegacyNumbers] FOREIGN KEY ([LegacyAgentID]) REFERENCES [dbo].[AMP_Agt_AgentLegacyNumbers] ([AgentLegacyNumberId])
GO
ALTER TABLE [dbo].[AMP_Agt_AgentHierarchy] ADD CONSTRAINT [FK_AMP_Agt_AgentHierarchy_AMP_Common_Code] FOREIGN KEY ([MailingCode]) REFERENCES [dbo].[AMP_Common_Code] ([CodeId])
GO
ALTER TABLE [dbo].[AMP_Agt_AgentHierarchy] ADD CONSTRAINT [FK_AMP_Agt_AgentHierarchy_AMP_Common_Code_EOBMailingCode] FOREIGN KEY ([EOBMailingCode]) REFERENCES [dbo].[AMP_Common_Code] ([CodeId])
GO
ALTER TABLE [dbo].[AMP_Agt_AgentHierarchy] ADD CONSTRAINT [FK_AMP_Agt_AgentHierarchy_AMP_Common_Code1] FOREIGN KEY ([BillingMailingCode]) REFERENCES [dbo].[AMP_Common_Code] ([CodeId])
GO
ALTER TABLE [dbo].[AMP_Agt_AgentHierarchy] ADD CONSTRAINT [FK_AMP_Agt_AgentHierarchy_AMP_Common_Code2] FOREIGN KEY ([NewBusinessMailingCode]) REFERENCES [dbo].[AMP_Common_Code] ([CodeId])
GO
ALTER TABLE [dbo].[AMP_Agt_AgentHierarchy] ADD CONSTRAINT [FK_AMP_Agt_AgentHierarchy_AMP_Common_PaymentMethod] FOREIGN KEY ([PaymentMethodId]) REFERENCES [dbo].[AMP_Common_PaymentMethod] ([PaymentMethodId])
GO
ALTER TABLE [dbo].[AMP_Agt_AgentHierarchy] ADD CONSTRAINT [FK_AMP_Agt_AgentHierarchy_AMP_Common_Status] FOREIGN KEY ([StatusId]) REFERENCES [dbo].[AMP_Common_Status] ([StatusId])
GO
ALTER TABLE [dbo].[AMP_Agt_AgentHierarchy] ADD CONSTRAINT [FK_AMP_Agt_AgentHierarchy_AOS_WebProfile] FOREIGN KEY ([WebProfileId]) REFERENCES [dbo].[AOS_WebProfile] ([WebProfileId])
GO
