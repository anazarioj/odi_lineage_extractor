CREATE TABLE [dbo].[AMP_Generic_ContactBase]
(
[ContactBaseId] [int] NOT NULL IDENTITY(1, 1) NOT FOR REPLICATION
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AMP_Generic_ContactBase] ADD CONSTRAINT [PK_AMP_Generic_ContactBase] PRIMARY KEY CLUSTERED ([ContactBaseId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
