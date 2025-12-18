SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[AMPview_Sec_AgentInfo]
AS
SELECT DISTINCT 
                      agt.AgentId, agt.AgentNumber, ISNULL(CASE WHEN comp.ContactBaseId IS NULL THEN LastName + ' ' + FirstName ELSE comp.[Name] END, 
                      '***INVALID***') AS Name, agt.ContactBaseId, asv.EffectivePermissions, CASE WHEN comp.ContactBaseId IS NULL 
                      THEN 1 ELSE 0 END AS Is_Individual
FROM         dbo.AMP_Agt_Agent AS agt WITH (NOLOCK) LEFT OUTER JOIN
                      dbo.AMP_Generic_ContactCompany AS comp WITH (NOLOCK) ON comp.ContactBaseId = agt.ContactBaseId LEFT OUTER JOIN
                      dbo.AMP_Generic_ContactIndividual AS ind WITH (NOLOCK) ON ind.ContactBaseId = agt.ContactBaseId INNER JOIN
                      dbo.AMPview_Sec_CanReadAgents AS asv WITH (NOLOCK) ON asv.AgentId = agt.AgentId
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[29] 4[26] 2[24] 3) )"
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
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "agt"
            Begin Extent = 
               Top = 15
               Left = 29
               Bottom = 130
               Right = 183
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "comp"
            Begin Extent = 
               Top = 199
               Left = 456
               Bottom = 319
               Right = 608
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ind"
            Begin Extent = 
               Top = 170
               Left = 102
               Bottom = 320
               Right = 254
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "asv"
            Begin Extent = 
               Top = 28
               Left = 453
               Bottom = 113
               Right = 605
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
      Begin ColumnWidths = 14
         Width = 284
         Width = 1500
         Width = 1500
         Width = 2235
         Width = 1500
         Width = 1500
         Width = 1140
         Width = 1455
         Width = 1770
         Width = 2250
         Width = 1875
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 7620
         Alias = 2010
         Table = 1995
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy ', 'SCHEMA', N'dbo', 'VIEW', N'AMPview_Sec_AgentInfo', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane2', N'= 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'AMPview_Sec_AgentInfo', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=2
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'AMPview_Sec_AgentInfo', NULL, NULL
GO
