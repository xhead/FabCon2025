-- exec tSQLt.NewTestClass 'ProductTests'
create proc ProductTests.[Test that Staging.Product row with new ProductID creates new dw.Product row] as

-- Arrange

    IF OBJECT_ID('#actual') IS NOT NULL DROP TABLE #actual;
    IF OBJECT_ID('#expected') IS NOT NULL DROP TABLE #expected;

exec tSQLt.FakeTable 'dw','Product', @Identity=1, @ComputedColumns=1, @Defaults=1

insert into dw.Product(
 	 [ProductID]    
    ,[Product]      
    ,[ProductNumber]
    ,[Color]        
    ,[StandardCost] 
    ,[ListPrice]    
    ,[Model]        
    ,[Category]    
)
values (
	1	
	,'Product1'		
	,'ProductNum1'		
	,'Color1'			
	,1.11
	,2.22	
	,'Model1'
	,'Category1'
)

insert into Staging.Product(
 	 [ProductID]    
    ,[Product]      
    ,[ProductNumber]
    ,[Color]        
    ,[StandardCost] 
    ,[ListPrice]    
    ,[Model]        
    ,[Category]    
)
values (
	2	
	,'Product2'		
	,'ProductNum2'		
	,'Color2'			
	,3.33
	,4.44	
	,'Model2'
	,'Category2'
)

select * 
into #expected
from (values (
	1	
	,'Product1'		
	,'ProductNum1'		
	,'Color1'			
	,1.11
	,2.22	
	,'Model1'
	,'Category1'
)
,
(
	2	
	,'Product2'		
	,'ProductNum2'		
	,'Color2'			
	,3.33
	,4.44	
	,'Model2'
	,'Category2'
)) x (	
	[ProductID]    
    ,[Product]      
    ,[ProductNumber]
    ,[Color]        
    ,[StandardCost] 
    ,[ListPrice]    
    ,[Model]        
    ,[Category]    
)

-- ACT
EXEC Staging.MergeProduct

select [ProductID]    
    ,[Product]      
    ,[ProductNumber]
    ,[Color]        
    ,[StandardCost] 
    ,[ListPrice]    
    ,[Model]        
    ,[Category]    
into #actual
from dw.Product

-- ASSERT
exec tSQLt.AssertEqualsTable '#expected', '#actual'