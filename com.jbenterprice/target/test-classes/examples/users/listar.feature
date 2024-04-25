@listar
Feature: Listar productos usando la API /api/v1/product/
	Background:
    * url 'http://localhost:8081'
    * def ruta_crear = '/api/v1/product/'
      
	Scenario: Listar productos de forma exitosa
    Given path ruta_crear,"/"
    And header Accept = 'application/json'
    When method get
    Then status 200
    # And match responseType == 'json'
    # And match $ == {"products":'#array',"status":true,"message":"Se encontró #num producto(s)"} 
