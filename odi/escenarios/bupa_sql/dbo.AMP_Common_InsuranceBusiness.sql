CREATE TABLE [dbo].[AMP_Common_InsuranceBusiness]
(
[InsuranceBusinessId] [int] NOT NULL IDENTITY(1, 1) NOT FOR REPLICATION,
[EntityId] [int] NOT NULL,
[Name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Description] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Email] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhoneNum] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CorporateEmail] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CorporatePhoneNum] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CountryId] [int] NOT NULL,
[CreatedOn] [datetime] NULL CONSTRAINT [DF_AMP_Common_InsuranceBusiness_CreatedOn] DEFAULT (getdate()),
[CreatedBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_AMP_Common_InsuranceBusiness_CreatedBy] DEFAULT (suser_name()),
[LastUpdatedOn] [datetime] NULL,
[LastUpdatedBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FunctionalCurrencyId] [int] NULL,
[LocalCurrencyId] [int] NULL,
[ContactBaseId] [int] NULL,
[MembersAutoClaimPayment] [bit] NOT NULL CONSTRAINT [DF_AMP_Common_InsuranceBusiness_MembersAutoClaimPayment] DEFAULT ((0)),
[ApplyPPASameClaimOnly] [bit] NOT NULL CONSTRAINT [DF_AMP_Common_InsuranceBusiness_ApplyPPASameClaimOnly] DEFAULT ((0)),
[UsesOnlyStandardMedicalCodes] [bit] NOT NULL CONSTRAINT [DF_AMP_Common_InsuranceBusiness_UsesOnlyStandardMedicalCodes] DEFAULT ((0)),
[RestrictBillingProviderCountry] [bit] NOT NULL CONSTRAINT [DF_AMP_Common_InsuranceBusiness_RestrictBillingProviderCountry] DEFAULT ((0)),
[IsProviderPartnership] [bit] NOT NULL CONSTRAINT [DF_AMP_Common_InsuranceBusiness_IsProviderPartnership] DEFAULT ((0)),
[HasUploadFlatFileFunctionality] [bit] NULL,
[IsReimbursementCreditAdjustment] [bit] NULL,
[IsOneYearBillingCycle] [bit] NULL,
[IsEbilling] [bit] NULL CONSTRAINT [DF_AMP_Common_InsuranceBusiness_IsEbilling] DEFAULT (CONVERT([bit],(0))),
[IsEnhancedBilling] [bit] NULL,
[AllowInterestCharge] [bit] NULL,
[IsOnShore] [bit] NOT NULL CONSTRAINT [DF_IsOnShore] DEFAULT ((1)),
[IsSeparatedAccount] [bit] NULL CONSTRAINT [DF__AMP_Commo__IsSep__4B97C5EE] DEFAULT ((0)),
[IsConfiguredForCommissionAdjustment] [bit] NULL CONSTRAINT [DF__AMP_Commo__IsCon__77AC1DAD] DEFAULT ((0)),
[MemberEOBsByReceivedDate] [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AMP_Common_InsuranceBusiness] ADD CONSTRAINT [PK_AMP_Common_InsuranceBusiness] PRIMARY KEY CLUSTERED ([InsuranceBusinessId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AMP_Common_InsuranceBusiness] ADD CONSTRAINT [FK_AMP_Common_InsuranceBusiness_AMP_Common_Entity] FOREIGN KEY ([EntityId]) REFERENCES [dbo].[AMP_Common_Entity] ([EntityId])
GO
ALTER TABLE [dbo].[AMP_Common_InsuranceBusiness] ADD CONSTRAINT [FK_AMP_Common_InsuranceBusiness_AMP_Generic_ContactCompany] FOREIGN KEY ([ContactBaseId]) REFERENCES [dbo].[AMP_Generic_ContactCompany] ([ContactBaseId])
GO
ALTER TABLE [dbo].[AMP_Common_InsuranceBusiness] ADD CONSTRAINT [FK_AMP_Common_InsuranceBusiness_AMP_Generic_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[AMP_Generic_Country] ([CountryId])
GO
ALTER TABLE [dbo].[AMP_Common_InsuranceBusiness] ADD CONSTRAINT [FK__AMP_Commo__Funct__19C59F05] FOREIGN KEY ([FunctionalCurrencyId]) REFERENCES [dbo].[AMP_Generic_Currency] ([CurrencyId])
GO
ALTER TABLE [dbo].[AMP_Common_InsuranceBusiness] ADD CONSTRAINT [FK__AMP_Commo__Local__375601EC] FOREIGN KEY ([LocalCurrencyId]) REFERENCES [dbo].[AMP_Generic_Currency] ([CurrencyId])
GO
