CREATE TABLE [dbo].[AOS_WebProfile]
(
[WebProfileId] [int] NOT NULL IDENTITY(1, 1) NOT FOR REPLICATION,
[Name] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UserType] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AOS_WebProfile] ADD CONSTRAINT [PK_AOS_WebProfile] PRIMARY KEY CLUSTERED ([WebProfileId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
