Print 'Backfilling Reference.Color';

With colors As (
	Select * From (Values 
	('Blue'),
	('Red'),
	('Orange'),
	('Green'),
	('Black')
	) x (Color)
)
Merge Into Reference.Color trg 
Using colors src On trg.Color = src.Color

When Not Matched By Target Then 
	Insert (Color) Values (src.Color)

When Not Matched By Source Then 
	Delete
;
Print 'Complete'
