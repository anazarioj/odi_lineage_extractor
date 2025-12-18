CREATE TABLE [dbo].[AMP_Sec_Boundary]
(
[ACLTypeId] [smallint] NOT NULL,
[CountryId] [int] NOT NULL,
[InsuranceBusinessId] [int] NOT NULL,
[ACLId] [int] NOT NULL,
[FromDate] [date] NULL,
[ToDate] [date] NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS OFF
GO
CREATE TRIGGER [dbo].[Trg_SQLcm_AMP_Sec_Boundary] ON [dbo].[AMP_Sec_Boundary]
WITH EXECUTE AS CALLER
FOR INSERT, UPDATE, DELETE
AS EXTERNAL NAME [Trg_SQLcm_dbo_AMP_Sec_Boundary].[CLRTriggers].[DMLTrigger]
GO
ALTER TABLE [dbo].[AMP_Sec_Boundary] ADD CONSTRAINT [PK_AMP_Sec_Boundary] PRIMARY KEY CLUSTERED ([ACLTypeId], [CountryId], [InsuranceBusinessId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_AMP_Sec_Boundary] ON [dbo].[AMP_Sec_Boundary] ([ACLId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AMP_Sec_Boundary_1] ON [dbo].[AMP_Sec_Boundary] ([InsuranceBusinessId], [CountryId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AMP_Sec_Boundary] ADD CONSTRAINT [FK_AMP_Sec_Boundary_AMP_Common_InsuranceBusiness] FOREIGN KEY ([InsuranceBusinessId]) REFERENCES [dbo].[AMP_Common_InsuranceBusiness] ([InsuranceBusinessId])
GO
ALTER TABLE [dbo].[AMP_Sec_Boundary] WITH NOCHECK ADD CONSTRAINT [FK_AMP_Sec_Boundary_AMP_Generic_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[AMP_Generic_Country] ([CountryId])
GO
ALTER TABLE [dbo].[AMP_Sec_Boundary] WITH NOCHECK ADD CONSTRAINT [FK_AMP_Sec_Boundary_AMP_Sec_ACL] FOREIGN KEY ([ACLId]) REFERENCES [dbo].[AMP_Sec_ACL] ([ACLId]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[AMP_Sec_Boundary] WITH NOCHECK ADD CONSTRAINT [FK_AMP_Sec_Boundary_AMP_Sec_ACLType] FOREIGN KEY ([ACLTypeId]) REFERENCES [dbo].[AMP_Sec_ACLType] ([ACLTypeId])
GO
