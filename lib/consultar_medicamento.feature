Feature: Consultar medicamentos cadastrados

  Scenario: Consultar medicamentos cadastrados com sucesso
    Given eu informo o email 'usuario@gmail.com'
    And informo a senha teste123
    When acesso o sistema de gestão de saúde na aba "medicamentos"
    Then o sistema deve retornar todos os medicamentos cadastrados anteriormente pelo paciente