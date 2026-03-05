Feature: Signup and Login Tests - DemoBlaze

  Background:
    * url baseUrl
    * def password = 'Test123'
    * def username = 'user' + java.util.UUID.randomUUID()
    * def signupBody = read('requests/signup.json')
    * def loginBody = read('requests/login.json')
  # ---------------------------------------------------------
  # Crear nuevo usuario
  # ---------------------------------------------------------
  Scenario: Crear nuevo usuario correctamente

    * def username = 'user' + java.util.UUID.randomUUID()
    * def signupBody = read('requests/signup.json')

    Given path '/signup'
    And request signupBody
    When method post
    Then status 200
    Then status 200
    * def cleanResponse = response.trim()
    And match cleanResponse == '""'

  # ---------------------------------------------------------
  # Intentar crear usuario ya existente
  # ---------------------------------------------------------
  Scenario: Intentar crear usuario ya existente

    * def username = 'usuarioFijoTest'

    # Crear primero
    Given path '/signup'
    And request signupBody
    When method post
    Then status 200

    # Intentar crearlo nuevamente
    Given path '/signup'
    And request signupBody
    When method post
    Then status 200

    And def expected = read('responses/userAlreadyExists.json')
    And match response == expected

  # ---------------------------------------------------------
  # Login correcto
  # ---------------------------------------------------------
  Scenario: Login con usuario y password correctos

    * def username = 'user' + java.util.UUID.randomUUID()
    * def signupBody = read('requests/signup.json')
    * def loginBody = read('requests/login.json')

    # Crear usuario
    Given path '/signup'
    And request signupBody
    When method post
    Then status 200

    # Login
    Given path '/login'
    And request loginBody
    When method post
    Then status 200

    And match response contains "Auth_token:"

  # ---------------------------------------------------------
  # Login incorrecto
  # ---------------------------------------------------------
  Scenario: Login con password incorrecto

    * def username = 'user' + java.util.UUID.randomUUID()
    * def password = 'Test123'
    * def signupBody = read('requests/signup.json')

    # Crear usuario
    Given path '/signup'
    And request signupBody
    When method post
    Then status 200

    # Intentar login con password incorrecta
    * def password = 'claveIncorrecta'
    * def loginBody = read('requests/login.json')

    Given path '/login'
    And request loginBody
    When method post
    Then status 200
    And match response.errorMessage == "Wrong password."