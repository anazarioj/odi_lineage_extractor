SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[AMPview_Sec_CanReadAgencies]
AS
WITH vwCanReadAgencies AS (SELECT     dbo.AMP_Agt_Agency.AgencyId, dbo.AMPview_Sec_CurrentUser_EffectivePermissions.aclid, 
                                                                                           dbo.AMPview_Sec_CurrentUser_EffectivePermissions.EffectivePermissions, - 1 AS IsNotAllCountry
                                                                    FROM         dbo.AMP_Sec_Boundary INNER JOIN
                                                                                           dbo.AMP_Agt_Agency ON 
                                                                                           dbo.AMP_Sec_Boundary.InsuranceBusinessId = dbo.AMP_Agt_Agency.InsuranceBusinessId INNER JOIN
                                                                                           dbo.AMPview_Sec_CurrentUser_EffectivePermissions ON 
                                                                                           dbo.AMP_Sec_Boundary.ACLId = dbo.AMPview_Sec_CurrentUser_EffectivePermissions.aclid
                                                                    WHERE     (dbo.AMP_Sec_Boundary.ACLTypeId = - 1) AND 
                                                                                           (dbo.AMPview_Sec_CurrentUser_EffectivePermissions.EffectivePermissions & 1 = 1) AND 
                                                                                           (dbo.AMP_Sec_Boundary.CountryId = 998)
                                                                    UNION
                                                                    SELECT     AMP_Agt_Agency_1.AgencyId, AMPview_Sec_CurrentUser_EffectivePermissions_1.aclid, 
                                                                                          AMPview_Sec_CurrentUser_EffectivePermissions_1.EffectivePermissions, 1 AS IsNotAllCountry
                                                                    FROM         dbo.AMP_Sec_Boundary AS AMP_Sec_Boundary_1 INNER JOIN
                                                                                          dbo.AMP_Agt_Agency AS AMP_Agt_Agency_1 ON 
                                                                                          AMP_Sec_Boundary_1.InsuranceBusinessId = AMP_Agt_Agency_1.InsuranceBusinessId AND 
                                                                                          AMP_Sec_Boundary_1.CountryId = AMP_Agt_Agency_1.CountryId INNER JOIN
                                                                                          dbo.AMPview_Sec_CurrentUser_EffectivePermissions AS AMPview_Sec_CurrentUser_EffectivePermissions_1 ON 
                                                                                          AMP_Sec_Boundary_1.ACLId = AMPview_Sec_CurrentUser_EffectivePermissions_1.aclid
                                                                    WHERE     (AMP_Sec_Boundary_1.ACLTypeId = - 1) AND 
                                                                                          (AMPview_Sec_CurrentUser_EffectivePermissions_1.EffectivePermissions & 1 = 1))
    SELECT     AgencyId, dbo.GetmainACL(aclid * IsNotAllCountry) AS ACLId, dbo.CombinePermissions(EffectivePermissions) AS EffectivePermissions
     FROM         vwCanReadAgencies AS vwCanReadAgencies_1
     GROUP BY AgencyId
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[39] 4[27] 2[13] 3) )"
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
         Begin Table = "vwCanReadAgencies_1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 5310
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1485
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'AMPview_Sec_CanReadAgencies', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'AMPview_Sec_CanReadAgencies', NULL, NULL
GO
