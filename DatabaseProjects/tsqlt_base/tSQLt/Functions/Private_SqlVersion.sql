﻿CREATE FUNCTION tSQLt.Private_SqlVersion()
RETURNS TABLE
AS
RETURN
  SELECT CAST(SERVERPROPERTY('ProductVersion')AS NVARCHAR(128)) ProductVersion,
         CAST(SERVERPROPERTY('Edition')AS NVARCHAR(128)) Edition;