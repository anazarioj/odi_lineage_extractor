CREATE TABLE [dbo].[AMP_Generic_AddressType]
(
[AddressTypeId] [int] NOT NULL IDENTITY(1, 1) NOT FOR REPLICATION,
[TypeName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AMP_Generic_AddressType] ADD CONSTRAINT [PK_AMP_Generic_AddressType] PRIMARY KEY CLUSTERED ([AddressTypeId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
