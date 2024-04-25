@actuaok2
Feature: Actualizar un producto usando la api v1
	Background:
	* url "http://localhost:8081"
	* def ruta_crear = "/api/v1/product/"

	Given path ruta_crear,"/"
	And request { name : "Iphone 900", description: "Gama Alta de Apple", price: 3000 }
	And header Accept = "application/json"
	When method post
	Then status 201
	* print  response.sku 
	* def  sku_creado = response.sku + "123"


	Scenario Outline: Actualizar un producto de manera exitosa		
		Given path ruta_crear,"/",sku_creado,"/"
		And request <producto>
		And header Accept = "application/json"
		When method put
		Then status 400
		* print response
		And match responseType == "json"
		And match $ == {"sku":"#notnull", "status":false , "message":"El producto no fue encontrado" }
		Examples:
		| producto |
  	| { name : "Iphone Actualizado 2", description: "Gama Alta de Apple 2", price: 2200 } |

	
	
