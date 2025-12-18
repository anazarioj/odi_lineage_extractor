SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[AMPView_Agt_AgentHierarchyInfo]
AS
SELECT     ah.AgentHierarchyId, ViewAg.AgentId, ViewAg.AgentNumber, ViewAg.Name AS AgentName, ViewAg.Is_Individual, ViewAg.ContactBaseId, ah.AgencyId, 
                      Agy.AgencyName, ah.ParentAgentId, ah.MailingCode, ah.StatusId, Ib.Name AS InsuranceBusinessName, 
                      ISNULL(dbo.AMPfn_Agt_GetAgentLegacyNumbers(ah.AgentId), ' ') AS LegacyNumbers, ah.FromDate, ah.ToDate,ah.PaymentMethodId, ViewAg.EffectivePermissions
FROM         dbo.AMP_Agt_AgentHierarchy AS ah INNER JOIN
                      dbo.AMP_Agt_Agency AS Agy ON ah.AgencyId = Agy.AgencyId INNER JOIN
                      dbo.AMP_Common_InsuranceBusiness AS Ib ON Agy.InsuranceBusinessId = Ib.InsuranceBusinessId INNER JOIN
                      dbo.AMPview_Sec_AgentInfo AS ViewAg ON ah.AgentId = ViewAg.AgentId INNER JOIN
                      dbo.AMPview_Sec_CanReadAgentHierarchy AS vcrah ON ah.AgentHierarchyId = vcrah.AgentHierarchyId
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ah"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 209
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Agy"
            Begin Extent = 
               Top = 5
               Left = 366
               Bottom = 120
               Right = 546
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Ib"
            Begin Extent = 
               Top = 158
               Left = 562
               Bottom = 273
               Right = 800
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ViewAg"
            Begin Extent = 
               Top = 192
               Left = 268
               Bottom = 307
               Right = 503
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vcrah"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 241
               Right = 217
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 17
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      ', 'SCHEMA', N'dbo', 'VIEW', N'AMPView_Agt_AgentHierarchyInfo', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane2', N'   Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2130
         Alias = 2325
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'AMPView_Agt_AgentHierarchyInfo', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=2
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'AMPView_Agt_AgentHierarchyInfo', NULL, NULL
GO
