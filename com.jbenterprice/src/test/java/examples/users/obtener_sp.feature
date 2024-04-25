@obtener_sp
Feature: Listar producto usando la API /api/v1/product/
	Background:
    * url 'http://localhost:8081'
    * def ruta_crear = '/api/v1/product/'
    * def ruta_crearbad = '/api/v1/product1/'
		* def skubad = '1841' 
  	* def skubad1 = '@' 
	  * def skubad2 = 'null'
	  * def skubad3 = 123
	    
	Scenario: No Obtener un producto 
    Given path ruta_crear,"/",skubad,"/"
    And header Accept = 'application/json'
    When method get
    Then status 200
    And match responseType == 'json'
    And match $ == {"products":'#array',"status":false,"message":"El producto no fue encontrado"} 
    
    Given path ruta_crear,"/",skubad1,"/"
    And header Accept = 'application/json'
    When method get
    Then status 200
    And match responseType == 'json'
    And match $ == {"products":'#array',"status":false,"message":"El producto no fue encontrado"} 
    
    Given path ruta_crear,"/",skubad2,"/"
    And header Accept = 'application/json'
    When method get
    Then status 200
    And match responseType == 'json'
    And match $ == {"products":'#array',"status":false,"message":"El producto no fue encontrado"}     

    Given path ruta_crear,"/",skubad3,"/"
    And header Accept = 'application/json'
    When method get
    Then status 200
    And match responseType == 'json'
    And match $ == {"products":'#array',"status":false,"message":"El producto no fue encontrado"}     
    
    Given path ruta_crearbad,"/",skubad3,"/"
    And header Accept = 'application/json'
    When method get
    Then status 404
     
    
    