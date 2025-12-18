CREATE TABLE [dbo].[AMP_Generic_Language]
(
[LanguageId] [int] NOT NULL,
[Name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ISOCode] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AMP_Generic_Language] ADD CONSTRAINT [AMP_Generic_Language_PK] PRIMARY KEY CLUSTERED ([LanguageId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
