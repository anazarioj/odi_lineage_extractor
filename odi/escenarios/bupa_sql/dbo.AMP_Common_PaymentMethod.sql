CREATE TABLE [dbo].[AMP_Common_PaymentMethod]
(
[PaymentMethodId] [int] NOT NULL IDENTITY(1, 1) NOT FOR REPLICATION,
[Method] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Description] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IsCommissionPaymentMethod] [bit] NULL CONSTRAINT [DF__AMP_Commo__IsCom__122BD516] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AMP_Common_PaymentMethod] ADD CONSTRAINT [PK_AMP_Common_PaymentMethod] PRIMARY KEY CLUSTERED ([PaymentMethodId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
