@listar_sp
Feature: Listar productos usando la API /api/v1/product1/
	Background:
    * url 'http://localhost:8081'
    * def ruta_crearbad = '/api/v1/product1/'
      
	Scenario: Listar productos de forma exitosa
    Given path ruta_crearbad
    And header Accept = 'application/json'
    When method get
    Then status 404

