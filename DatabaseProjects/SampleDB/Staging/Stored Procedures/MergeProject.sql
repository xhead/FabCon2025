
CREATE proc [Staging].[MergeProject] (@DataFactoryTaskKey int) 
as



merge dw.[Project] trg
	using Staging.[Project] src
	on  trg.[ProjectId] = src.[ProjectId]


when matched and trg.RowHash <> src.RowHash then 	
	update set          
		 [Project]                = src.[Project]       
		,[Project Code]           = src.[Project Code]  
		,[Project Description]    = src.[Project Description] 
		,[Project Start Date]	  = src.[Project Start Date]	 
		,[Project End Date]		  = src.[Project End Date]		 
		,[Project Status]         = src.[Project Status]
		,[Project Manager]        = src.[ProjectManager]
		,[LastUpdated]	          = src.[LastUpdated]	 
		,[UpdatedBy]	          = src.[UpdatedBy]	 

 
when not matched by target then  
	insert (	
		 [ProjectId]     
		,[Project]       
		,[Project Code]  
		,[Project Description]   
		,[Project Start Date]	
		,[Project End Date]		
		,[Project Status]
		,[Project Manager]
		,[LastUpdated]	
		,[UpdatedBy]		
	)

	values (
		 [ProjectId]     
		,[Project]       
		,[Project Code]  
		,[Project Description]  
		,[Project Start Date]	
		,[Project End Date]		
		,[Project Status]
		,[ProjectManager]
		,[LastUpdated]	
		,[UpdatedBy]			
	); 


update ETL.DataFactoryTask set
	LastCopied = getdate()
where DataFactoryTaskKey = @DataFactoryTaskKey