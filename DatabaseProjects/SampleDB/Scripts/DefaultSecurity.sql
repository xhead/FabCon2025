If Not Exists(Select * From sys.sysusers Where name = 'StandardLogin')
Begin
   Create User StandardLogin For Login StandardLogin
End
Alter Role SampleRole Add Member StandardLogin