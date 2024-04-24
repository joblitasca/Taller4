Feature: Error al eliminar el producto usando la api

Background:
* def ruta_crear = "/api/v1/product/"
* url "http://localhost:8081"
* def feature_result = callonce read("nuevo.feature")
* print feature_result.response 
* def sku_creado = feature_result.response.sku

Scenario Outline: Falla al eliminar producto
Given path ruta_crear, "/", sku_creado, "/"
And header Accept = "application/json"
When method delete
Then status <expected_status_code>
And match responseType == "json"
And match $ == {"status": false, "message": "#string"}

Examples:
| expected_status_code |
| 404                  |
| 500                  |