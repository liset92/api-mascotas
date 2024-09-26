Feature: Tienda de mascotas

  Scenario: Agregar una nueva mascota y verificar si fue insertada
    * def mascota = karate.read('classpath:resources/mascota.json')

    # 1. Adiciona una mascota nueva donde el nombre tenga el siguiente formato: Pug_Luna
    Given url 'https://petstore.swagger.io/v2/pet'
    And header Content-Type = 'application/json'
    And request mascota
    When method post
    Then status 200

    # 2. Verifica que la mascota está agregada correctamente
    Given url 'https://petstore.swagger.io/v2/pet/' + mascota.id
    When method get
    Then status 200
    And match response.name == mascota.name
    And match response.status == mascota.status

    # 3. Modifica el nombre de mascota por PugCarlino_Luna
    * def updatedMascota = mascota
    * def newName = 'PugCarlino_Luna'
    * updatedMascota.name = newName
    Given url 'https://petstore.swagger.io/v2/pet'
    And header Content-Type = 'application/json'
    And request updatedMascota
    When method put
    Then status 200

    # 4. Verifica que el nombre de la mascota fue modificado correctamente
    Given url 'https://petstore.swagger.io/v2/pet/' + updatedMascota.id
    When method get
    Then status 200
    And match response.name == newName
    And match response.status == updatedMascota.status

    # 5. Elimina la mascota agregada
    Given url 'https://petstore.swagger.io/v2/pet/' + updatedMascota.id
    When method delete
    Then status 200

    # Verifica que la mascota fue eliminada correctamente
    Given url 'https://petstore.swagger.io/v2/pet/' + updatedMascota.id
    When method get
    Then status 404