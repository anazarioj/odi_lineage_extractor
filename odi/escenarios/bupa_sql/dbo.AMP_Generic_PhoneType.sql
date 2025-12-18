CREATE TABLE [dbo].[AMP_Generic_PhoneType]
(
[PhoneTypeId] [int] NOT NULL,
[TypeName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AMP_Generic_PhoneType] ADD CONSTRAINT [AMP_Generic_PhoneType_PK] PRIMARY KEY CLUSTERED ([PhoneTypeId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
