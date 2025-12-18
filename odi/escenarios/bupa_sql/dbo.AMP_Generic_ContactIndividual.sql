CREATE TABLE [dbo].[AMP_Generic_ContactIndividual]
(
[ContactBaseId] [int] NOT NULL,
[LastName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MiddleName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_AMP_Generic_ContactIndividual_MiddleName] DEFAULT (''),
[FirstName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DOB] [datetime] NULL,
[TitleId] [int] NULL,
[GenderId] [int] NOT NULL,
[LanguageId] [int] NOT NULL,
[MaritalStatusID] [int] NOT NULL CONSTRAINT [DF_AMP_Generic_ContactIndividual_MaritalStatusID] DEFAULT ((5)),
[NationalityId] [int] NULL,
[MaternalLastName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PaternalLastName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CountryOfBirthId] [int] NULL,
[StateOfBirthId] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AMP_Generic_ContactIndividual] ADD CONSTRAINT [AMP_Generic_ContactIndividual_PK] PRIMARY KEY CLUSTERED ([ContactBaseId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [_dta_index_AMP_Generic_ContactIndividual_8_1417316359__K1_K11] ON [dbo].[AMP_Generic_ContactIndividual] ([ContactBaseId], [NationalityId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AMP_Generic_ContactIndividual_DOB] ON [dbo].[AMP_Generic_ContactIndividual] ([DOB]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AMP_Generic_ContactIndividual_lastname] ON [dbo].[AMP_Generic_ContactIndividual] ([LastName]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AMP_Generic_ContactIndividual_LastName_MiddleName_FirstName_DOB] ON [dbo].[AMP_Generic_ContactIndividual] ([LastName]) INCLUDE ([MiddleName], [FirstName], [DOB]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AMP_Generic_ContactIndividual] ADD CONSTRAINT [FK_AMP_Generic_ContactIndividual_AMP_Common_Code] FOREIGN KEY ([TitleId]) REFERENCES [dbo].[AMP_Common_Code] ([CodeId])
GO
ALTER TABLE [dbo].[AMP_Generic_ContactIndividual] ADD CONSTRAINT [FK_AMP_Generic_ContactIndividual_AMP_Generic_ContactBase] FOREIGN KEY ([ContactBaseId]) REFERENCES [dbo].[AMP_Generic_ContactBase] ([ContactBaseId])
GO
ALTER TABLE [dbo].[AMP_Generic_ContactIndividual] ADD CONSTRAINT [FK_AMP_Generic_ContactIndividual_AMP_Generic_Country] FOREIGN KEY ([NationalityId]) REFERENCES [dbo].[AMP_Generic_Country] ([CountryId])
GO
ALTER TABLE [dbo].[AMP_Generic_ContactIndividual] ADD CONSTRAINT [FK_AMP_Generic_ContactIndividual_AMP_Generic_Gender] FOREIGN KEY ([GenderId]) REFERENCES [dbo].[AMP_Generic_Gender] ([GenderId])
GO
ALTER TABLE [dbo].[AMP_Generic_ContactIndividual] ADD CONSTRAINT [FK_AMP_Generic_ContactIndividual_AMP_Generic_Language] FOREIGN KEY ([LanguageId]) REFERENCES [dbo].[AMP_Generic_Language] ([LanguageId])
GO
ALTER TABLE [dbo].[AMP_Generic_ContactIndividual] ADD CONSTRAINT [FK_AMP_Generic_ContactIndividual_AMP_Generic_MaritalStatus] FOREIGN KEY ([MaritalStatusID]) REFERENCES [dbo].[AMP_Generic_MaritalStatus] ([MaritalStatusId])
GO
