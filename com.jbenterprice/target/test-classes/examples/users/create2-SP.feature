@crear3
Feature: Crear un nuevo producto usando la API v1

	Background:
	* url urlbase
	* def ruta_crear = "/api/v1/product/"
	* def nuevo_producto = 
	"""
	{
		"name":"Huawei",
		"description":"Telefono de alta gama",
		"price": 1850
	}
	"""
	
	Scenario Outline: Crear un producto de manera exitosa usando Examples
	Given path ruta_crear,"/"
	And request <producto>
	And header Accept = "application/json"
	When method post
	Then status 400
	And match responseType == 'json'
	And match $ == {"sku": "#notnull", "status":false, "message": "La descripción del producto no fue proporcionada"}
	
	Examples:
	| producto |
	|  { name : "Redmi  101", description: "", price: 1100 } |

	