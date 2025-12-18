SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO






-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
-- exec AMPsp_Agt_AgentSearch null, null,'77', 4
CREATE PROCEDURE [dbo].[AMPsp_Agt_AgentSearch]
	@AgencyId INT,
	@StatusId INT,
	@SearchCondition NVARCHAR(50), 
	@SearchType TINYINT
AS
	if @AgencyId is null
		--select * from AMPfn_Agt_AgentSearch(@SearchCondition, @SearchType) A
		select * from AMPfn_Agt_AgentHierarchySearch(@SearchCondition, @SearchType) A
		where (A.StatusId = @StatusId or @StatusId is null) --And A.ToDate is null
		-- The order by was added by Yoleny because the users requested. 
		Order by A.ToDate, A.StatusId
	else
		select 
			A.* 
		from 
			AMPfn_Agt_AgentHierarchySearch(@SearchCondition, @SearchType) A
			--AMPfn_Agt_AgentSearch(@SearchCondition, @SearchType) A
			--inner join AMP_Agt_AgentHierarchy H on A.AgentId = H.AgentId
		where
			(A.AgencyId = @AgencyId )
		--The following condition was added by Yoleny because Michel need to add a criteria by default 
		--where he can search only agent by status active to assign the agent to a new policy
			AND (A.StatusId = @StatusId or @StatusId is null)
		-- The order by was added by Yoleny because the users requested. 
		Order by A.ToDate, A.StatusId

	








GO
GRANT EXECUTE ON  [dbo].[AMPsp_Agt_AgentSearch] TO [AMEDEX\AOSWebPayment]
GO
GRANT EXECUTE ON  [dbo].[AMPsp_Agt_AgentSearch] TO [AMEDEX\SrvActReportProd]
GO
GRANT EXECUTE ON  [dbo].[AMPsp_Agt_AgentSearch] TO [webuser]
GO
