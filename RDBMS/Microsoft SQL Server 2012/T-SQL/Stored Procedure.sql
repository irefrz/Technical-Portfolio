-- ================================================ 
-- This procedure adds the 'Budget' scenario labelled items
-- where the organization key is > parameter @Org and the average amount
-- computed for a group is > than the value of parameter @Amt.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Irene Fernandez>
-- Create date: <6/2/2016>
-- Description:	<Sample for Portfolio>
-- =============================================
CREATE PROCEDURE AdventureWorksSample @Org int=0, @Amt int=0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @Budget_Total float =0;
	DECLARE @OrgKey int;
	DECLARE @Dept int;
	DECLARE @Scen nvarchar(50);
	DECLARE @Avg float;
	DECLARE @Result varchar(250) = null;
	

	if (@Org = 0) 
	begin
		raiserror('Invalid, organization must be > 0',10,0)
		return
	end

	if (@Amt = 0) 
	begin
		raiserror('Invalid, amount must be > 0',20,0)
		return
	end

	-- LOOP THROUGH RECORDS TO GET SUM ON SCENARIOS NAMED 'BUDGET'
	DECLARE fin_cursor CURSOR READ_ONLY FOR
	select FF.OrganizationKey, FF.DepartmentGroupKey, DS.ScenarioName, round(avg(amount),2)  
	from AdventureWorksDW.dbo.FactFinance FF, AdventureWorksDW.dbo.DimScenario DS
	where FF.organizationkey >= 6 and DS.ScenarioKey = FF.ScenarioKey
	group by FF.OrganizationKey, FF.DepartmentGroupKey, DS.ScenarioName
	having round(avg(FF.Amount),2) > 8913
	order by FF.OrganizationKey, FF.DepartmentGroupKey,DS.ScenarioName;

	OPEN fin_cursor
	FETCH NEXT FROM fin_cursor INTO @OrgKey, @Dept, @Scen, @Avg
	WHILE @@FETCH_STATUS = 0
	BEGIN
		IF @Scen = 'Budget'
		BEGIN
		SELECT @Budget_Total = @Budget_Total + @Avg
		END

		FETCH NEXT FROM fin_cursor INTO @OrgKey, @Dept, @Scen, @Avg
	END
	CLOSE fin_cursor
	DEALLOCATE fin_cursor

	select @Result = null
	select @Result = CONCAT('Budget for organizations >= ',CONVERT(VARCHAR(20),@Org), ' is ', CONVERT(VARCHAR(50),ROUND(@Budget_Total,2)) )
	PRINT @Result

	
END
GO
