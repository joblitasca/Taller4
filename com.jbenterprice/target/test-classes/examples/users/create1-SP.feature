      
@crear2
Feature: Crear un nuevo producto usando la API v1

	Background:
	* url urlbase
	* def ruta_crear = "/api/v1/product/"
	* def nuevo_producto = 
	"""
	{
		"name":"",
		"description":"Telefono de alta gama",
		"price": 1850
	}
	"""
		
	Scenario: Crear un producto de manera exitosa validando el response
	Given path ruta_crear,"/"
	And request nuevo_producto
	And header Accept = "application/json"
	When method post
	Then status 400
	And match responseType == 'json'
	And match $ == {"sku": "#notnull", "status":false, "message": "El nombre del producto no fue proporcionado"}
	
	
	      