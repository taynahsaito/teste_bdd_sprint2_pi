Feature: Editar consultas

  Scenario: Editar uma consulta existente com sucesso
    Given eu estou na tela de detalhes da consulta
    When clico no botão de edição
    And modifico os detalhes da consulta
    And confirmo as alterações
    Then o sistema deve salvar as alterações e a consulta deve ser atualizada com os novos detalhes