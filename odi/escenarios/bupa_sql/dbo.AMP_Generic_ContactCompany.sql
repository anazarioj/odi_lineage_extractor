CREATE TABLE [dbo].[AMP_Generic_ContactCompany]
(
[ContactBaseId] [int] NOT NULL,
[Name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LanguageId] [int] NOT NULL,
[WebSite] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FoundingDate] [datetime] NULL,
[NationalityId] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AMP_Generic_ContactCompany] ADD CONSTRAINT [AMP_Generic_ContactCompany_PK] PRIMARY KEY CLUSTERED ([ContactBaseId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AMP_Generic_ContactCompany_Name] ON [dbo].[AMP_Generic_ContactCompany] ([Name]) INCLUDE ([ContactBaseId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AMP_Generic_ContactCompany] ADD CONSTRAINT [AMP_Generic_ContactCompany_AMP_Generic_ContactBase_FK1] FOREIGN KEY ([ContactBaseId]) REFERENCES [dbo].[AMP_Generic_ContactBase] ([ContactBaseId])
GO
ALTER TABLE [dbo].[AMP_Generic_ContactCompany] ADD CONSTRAINT [FK_AMP_Generic_ContactCompany_AMP_Generic_Language] FOREIGN KEY ([LanguageId]) REFERENCES [dbo].[AMP_Generic_Language] ([LanguageId])
GO
CREATE FULLTEXT INDEX ON [dbo].[AMP_Generic_ContactCompany] KEY INDEX [AMP_Generic_ContactCompany_PK] ON [ProviderCat]
GO
ALTER FULLTEXT INDEX ON [dbo].[AMP_Generic_ContactCompany] ADD ([Name] LANGUAGE 1033)
GO
