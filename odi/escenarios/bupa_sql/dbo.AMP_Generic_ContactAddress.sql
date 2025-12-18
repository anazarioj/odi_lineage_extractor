CREATE TABLE [dbo].[AMP_Generic_ContactAddress](
	[ContactAddressId] [INT] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ContactBaseId] [INT] NOT NULL,
	[AddressLine1] [NVARCHAR](80) NOT NULL,
	[AddressLine2] [NVARCHAR](80) NULL,
	[CityId] [INT] NOT NULL,
	[State] [NVARCHAR](50) NULL,
	[Zip] [NVARCHAR](10) NULL,
	[CountryId] [INT] NOT NULL,
	[AddressTypeId] [INT] NOT NULL,
	[FromDate] [DATETIME] NOT NULL,
	[ToDate] [DATETIME] NULL,
	[Synch] [TIMESTAMP] NOT NULL,
	[Colonyid] [INT] NULL,
	[Municipality] [VARCHAR](100) NULL,
	[Street] [NVARCHAR](160) NULL,
	[Exterior] [NVARCHAR](10) NULL,
	[Interior] [NVARCHAR](10) NULL,
	[LocalityId] [INT] NULL,
	[ProofOfAddressTypeId] [INT] NULL,
	[Latitude] [DECIMAL](18, 9) NULL,
	[Longitude] [DECIMAL](18, 9) NULL,
 CONSTRAINT [PK_AMP_Generic_Address] PRIMARY KEY CLUSTERED 
(
	[ContactAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[AMP_Generic_ContactAddress]  WITH CHECK ADD  CONSTRAINT [AMP_Generic_Address_AMP_Generic_AddressType_FK2] FOREIGN KEY([AddressTypeId])
REFERENCES [dbo].[AMP_Generic_AddressType] ([AddressTypeId])
GO

ALTER TABLE [dbo].[AMP_Generic_ContactAddress] CHECK CONSTRAINT [AMP_Generic_Address_AMP_Generic_AddressType_FK2]
GO

ALTER TABLE [dbo].[AMP_Generic_ContactAddress]  WITH CHECK ADD  CONSTRAINT [AMP_Generic_Address_AMP_Generic_ContactBase_FK1] FOREIGN KEY([ContactBaseId])
REFERENCES [dbo].[AMP_Generic_ContactBase] ([ContactBaseId])
GO

ALTER TABLE [dbo].[AMP_Generic_ContactAddress] CHECK CONSTRAINT [AMP_Generic_Address_AMP_Generic_ContactBase_FK1]
GO

ALTER TABLE [dbo].[AMP_Generic_ContactAddress]  WITH CHECK ADD  CONSTRAINT [FK_AMP_Generic_ContactAddress_AMP_Generic_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[AMP_Generic_City] ([CityId])
GO

ALTER TABLE [dbo].[AMP_Generic_ContactAddress] CHECK CONSTRAINT [FK_AMP_Generic_ContactAddress_AMP_Generic_City]
GO

ALTER TABLE [dbo].[AMP_Generic_ContactAddress]  WITH CHECK ADD  CONSTRAINT [FK_AMP_Generic_ContactAddress_AMP_Generic_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[AMP_Generic_Country] ([CountryId])
GO

ALTER TABLE [dbo].[AMP_Generic_ContactAddress] CHECK CONSTRAINT [FK_AMP_Generic_ContactAddress_AMP_Generic_Country]
GO


