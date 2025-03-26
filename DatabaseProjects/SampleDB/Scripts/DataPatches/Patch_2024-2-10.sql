:SetVar Patchname Patch_2024-2-10

If Not Exists(Select * From Control.ChangeTracking Where Change = '$(PatchName)')
Begin

	Print 'Patching - $(PatchName)'

	-- do something 
	-- delete from dw.MyTable where BadData = 1

	Insert Into Control.ChangeTracking (Change, AppliedOn)
	Values ('$(patchName)', GetDate())

	Print 'Patch complete.'

End
