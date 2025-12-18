SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--HPQC 6968 afs 09/01/2016  TPA  UI Application Added to allow search for agent by Insurance Business.
-- select * from AMPfn_Agt_AgentHierarchySearch('0012', 4)

CREATE function [dbo].[AMPfn_Agt_AgentHierarchySearch](
	@SearchCondition NVARCHAR(50), 
	@SearchType TINYINT
) 
returns @Agents table(
	AgentHierarchyId int not null,
	AgentId int not null, 
	AgentNumber nvarchar(20),
	AgentName nvarchar(202),
	Is_Individual int not null,
	ContactBaseId int not null,
	AgencyId int not null,
	AgencyName nvarchar(50),
	ParentAgentId int,
	MailingCode int not null,
	StatusId int,
	InsuranceBusinessName nvarchar(100),
	LegacyNumbers nvarchar(max),
	FromDate datetime,
	ToDate datetime,
    PaymentMethodId int,
	EffectivePermissions bigint) as
begin
	IF @SearchType = 1 -- Company Name
		insert into @Agents
		--SELECT agt.* FROM dbo.AMPview_Sec_AgentInfo agt (NOLOCK)
		SELECT distinct agt.* FROM AMPView_Agt_AgentHierarchyInfo agt (NOLOCK)
		WHERE agt.Is_Individual = 0 AND AgentName LIKE  @SearchCondition + '%' -- '%' +

	ELSE IF @SearchType = 2 -- Last Name
		insert into @Agents
		SELECT distinct agt.* FROM dbo.AMPView_Agt_AgentHierarchyInfo agt (NOLOCK)
		INNER JOIN dbo.AMP_Generic_ContactIndividual ind (NOLOCK) ON ind.ContactBaseId = agt.ContactBaseId
		WHERE agt.Is_Individual <> 0 AND LastName LIKE  @SearchCondition + '%'  -- '%' +

	ELSE IF @SearchType = 3 -- First Name
		insert into @Agents
		SELECT distinct agt.* FROM dbo.AMPView_Agt_AgentHierarchyInfo agt (NOLOCK)
		INNER JOIN dbo.AMP_Generic_ContactIndividual ind (NOLOCK) ON ind.ContactBaseId = agt.ContactBaseId
		WHERE agt.Is_Individual <> 0 AND FirstName LIKE @SearchCondition + '%' -- '%' +

	ELSE IF @SearchType = 4 -- Agent Number
		insert into @Agents
		SELECT distinct agt.* FROM dbo.AMPView_Agt_AgentHierarchyInfo agt (NOLOCK)
		WHERE agt.AgentNumber LIKE '%' + @SearchCondition + '%'
		-- Next change was done in order to perform an Index Seek not an Index Scan. Mauricio Vargas 04/13/2009
--		WHERE agt.AgentNumber LIKE @SearchCondition + '%'

	ELSE IF @SearchType = 5 -- Agency Name
		insert into @Agents
		SELECT distinct agt.* FROM dbo.AMPView_Agt_AgentHierarchyInfo agt (NOLOCK)
		--WHERE AgencyName LIKE '%' + @SearchCondition + '%'
--		Next change was done in order to perform an Index Seek not an Index Scan. Mauricio Vargas 04/13/2009
		--WHERE AgencyName LIKE @SearchCondition + '%'
		INNER JOIN dbo.AMP_Agt_AgentHierarchy ah (NOLOCK) ON ah.AgentId = agt.AgentId
		INNER JOIN 
			(SELECT AgencyId FROM dbo.AMP_Agt_Agency agy (NOLOCK)
			WHERE agy.[AgencyName] LIKE '%' + @SearchCondition + '%') P	ON P.AgencyId = ah.AgencyId 
		-- The following condition was added by Yoleny because when  the Agent was in 2 AgentHierarchy in 
		-- the same agency, one of them closed, was giving two records in the search.
		WHERE ah.ToDate is null 

	ELSE IF @SearchType = 6 -- Contact Last Name
		insert into @Agents
		SELECT distinct agt.* FROM dbo.AMPView_Agt_AgentHierarchyInfo agt (NOLOCK)
		INNER JOIN 
			(SELECT AgentId FROM dbo.AMP_Agt_AgentContact ac (NOLOCK)
			INNER JOIN dbo.AMP_Generic_ContactIndividual cind (NOLOCK)
			ON cind.ContactBaseId = ac.ContactBaseId
			AND cind.LastName LIKE '%' + @SearchCondition + '%') P ON P.AgentId = agt.AgentId
--		Next change was done in order to perform an Index Seek not an Index Scan. Mauricio Vargas 04/13/2009
--			AND cind.LastName LIKE @SearchCondition + '%') P ON P.AgentId = agt.AgentId
		WHERE agt.Is_Individual <> 0

	ELSE IF @SearchType = 7 -- Contact First Name
		insert into @Agents
		SELECT distinct agt.* FROM dbo.AMPView_Agt_AgentHierarchyInfo agt (NOLOCK)
		INNER JOIN 
			(SELECT AgentId FROM dbo.AMP_Agt_AgentContact ac (NOLOCK)
			INNER JOIN dbo.AMP_Generic_ContactIndividual cind (NOLOCK)
			ON cind.ContactBaseId = ac.ContactBaseId
		AND cind.FirstName LIKE '%' + @SearchCondition + '%') P	ON P.AgentId = agt.AgentId
--		Next change was done in order to perform an Index Seek not an Index Scan. Mauricio Vargas 04/13/2009
--			AND cind.FirstName LIKE @SearchCondition + '%') P	ON P.AgentId = agt.AgentId
		WHERE agt.Is_Individual <> 0

	ELSE IF @SearchType = 8 -- Legacy Number
		insert into @Agents
		SELECT distinct agt.* FROM dbo.AMPView_Agt_AgentHierarchyInfo agt (NOLOCK)
		INNER JOIN dbo.AMP_Agt_AgentLegacyNumbers aln (NOLOCK) ON aln.AgentId = agt.AgentId
		WHERE agt.LegacyNumbers LIKE '%' + @SearchCondition + '%' 
--		Next change was done in order to perform an Index Seek not an Index Scan. Mauricio Vargas 04/13/2009
--		WHERE agt.LegacyNumbers LIKE @SearchCondition + '%' 

	ELSE IF @SearchType = 9 -- Country Name
		insert into @Agents
		SELECT DISTINCT agt.* FROM dbo.AMPView_Agt_AgentHierarchyInfo agt (NOLOCK)
		INNER JOIN dbo.AMP_Generic_ContactAddress cadd (NOLOCK) ON cadd.ContactBaseId = agt.ContactBaseId
		INNER JOIN dbo.AMP_Generic_Country cty (NOLOCK) ON cty.CountryId = cadd.CountryId 
--		WHERE cty.[Name] LIKE '%' + @SearchCondition + '%'
--		Next change was done in order to perform an Index Seek not an Index Scan. Mauricio Vargas 04/13/2009
		WHERE cty.[Name] LIKE @SearchCondition + '%'

	ELSE IF @SearchType = 10 -- Phone Number
		insert into @Agents
		SELECT distinct agt.* FROM dbo.AMPView_Agt_AgentHierarchyInfo agt (NOLOCK)
		INNER JOIN dbo.AMP_Generic_ContactPhone cp (NOLOCK)	ON cp.ContactBaseId = agt.ContactBaseId
		WHERE cp.PhoneNumber LIKE '%' + @SearchCondition + '%'
--		Next change was done in order to perform an Index Seek not an Index Scan. Mauricio Vargas 04/13/2009
--		WHERE cp.PhoneNumber LIKE @SearchCondition + '%'

	ELSE IF @SearchType = 11 -- Alias
		insert into @Agents
		SELECT distinct agt.* FROM dbo.AMPView_Agt_AgentHierarchyInfo agt (NOLOCK)
		--INNER JOIN dbo.AMP_Agt_AgentHierarchy ah (NOLOCK) ON ah.AgentId = agt.AgentId
		INNER JOIN dbo.AMP_Agt_AgentAlias aa (NOLOCK)	ON aa.AgentHierarchyId = agt.AgentHierarchyId
		WHERE aa.Alias LIKE '%' + @SearchCondition + '%'
--		Next change was done in order to perform an Index Seek not an Index Scan. Mauricio Vargas 04/13/2009
		--WHERE aa.Alias LIKE @SearchCondition + '%'
	--HPQC 6968 TPA UI Application Added to allow search for agent by Insurance Business.
   	ELSE IF @SearchType = 12 -- Insurance Bussiness
	    insert into @Agents
		SELECT distinct agt.* FROM dbo.AMPView_Agt_AgentHierarchyInfo agt (NOLOCK)
		INNER JOIN dbo.AMP_Agt_AgentHierarchy ah (NOLOCK) ON ah.AgentId = agt.AgentId
		WHERE agt.InsuranceBusinessName LIKE '%' + @SearchCondition + '%'
--		Next change was done in order to perform an Index Seek not an Index Scan. Mauricio Vargas 04/13/2009
		--WHERE aa.Alias LIKE @SearchCondition + '%'
  return
end


GO
GRANT SELECT ON  [dbo].[AMPfn_Agt_AgentHierarchySearch] TO [AMEDEX\SrvActReportProd]
GO
