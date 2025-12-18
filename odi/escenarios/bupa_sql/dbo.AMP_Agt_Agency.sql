CREATE TABLE [dbo].[AMP_Agt_Agency]
(
[AgencyId] [int] NOT NULL IDENTITY(1, 1) NOT FOR REPLICATION,
[LegacyAgentID] [int] NULL,
[StatusId] [int] NOT NULL,
[InsuranceBusinessId] [int] NOT NULL,
[AgencyName] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CountryId] [int] NOT NULL,
[Anonymous] [bit] NULL,
[FromDate] [datetime] NOT NULL CONSTRAINT [DF_AMP_Agt_Agency_FromDate] DEFAULT (getdate()),
[ToDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AMP_Agt_Agency] ADD CONSTRAINT [PK_AMP_Agt_Agency] PRIMARY KEY CLUSTERED ([AgencyId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AMP_Agt_Agency] ADD CONSTRAINT [FK_AMP_Agt_Agency_AMP_Common_InsuranceBusiness] FOREIGN KEY ([InsuranceBusinessId]) REFERENCES [dbo].[AMP_Common_InsuranceBusiness] ([InsuranceBusinessId])
GO
ALTER TABLE [dbo].[AMP_Agt_Agency] ADD CONSTRAINT [FK_AMP_Agt_Agency_AMP_Common_Status] FOREIGN KEY ([StatusId]) REFERENCES [dbo].[AMP_Common_Status] ([StatusId])
GO
ALTER TABLE [dbo].[AMP_Agt_Agency] ADD CONSTRAINT [FK_AMP_Agt_Agency_AMP_Generic_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[AMP_Generic_Country] ([CountryId])
GO
