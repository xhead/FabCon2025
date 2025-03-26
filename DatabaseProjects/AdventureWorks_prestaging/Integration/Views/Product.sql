create view Integration.Product as 
select 
	p.ProductID,
	p.ProductNumber,
	p.Name as ProductName,
	p.ListPrice,
	p.StandardCost,
	p.Color,
	p.Weight,
	p.Size,
	pc.Name as ProductCategory,
	ps.Name as ProductSubCategory,
	pm.Name as ProductModel
from Production.Product p
	join Production.ProductSubcategory ps 
		on p.ProductSubcategoryID = ps.ProductSubcategoryID
	join Production.ProductCategory pc 
		on ps.ProductCategoryID = pc.ProductCategoryID
	join Production.ProductModel pm 
		on p.ProductModelID = pm.ProductModelID