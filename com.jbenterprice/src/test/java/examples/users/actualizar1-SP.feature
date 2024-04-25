@actuaok
Feature: Actualizar un producto usando la api v1
	Background:
	* url "http://localhost:8081"
	* def ruta_crear = "/api/v1/product/"

	Given path ruta_crear,"/"
	And request { name : "Iphone 900", description: "Gama Alta de Apple", price: 3000 }
	And header Accept = "application/json"
	When method post
	Then status 201
	* def sku_creado = response.sku

	Scenario Outline: Actualizar un producto de manera exitosa		
		Given path ruta_crear,"/",sku_creado,"/"
		
		And request <producto>
		And header Accept = "application/json"
		When method put
		Then status 400
		* print response
		And match responseType == "json"
		And match $ == {"sku":"#notnull", "status":false , "message":"El nuevo nombre no debe estar en blanco" }
		Examples:
		| producto |
		| { name : "", description: "Gama Alta de Apple 1", price: 2100 } |
	#	| { name : "Iphone Actualizado 2", description: "Gama Alta de Apple 2", price: 2200 } |
	#	| { name : "Iphone Actualizado 3", description: "Gama Alta de Apple 3", price: 2300 } |
	
	
