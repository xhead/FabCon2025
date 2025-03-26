CREATE TABLE [Control].[ChangeTracking]
(
	Change varchar(500) Not Null Primary Key,
	AppliedOn datetime Not Null Default getdate()
)
