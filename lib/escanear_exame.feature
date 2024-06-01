Feature: Escanear exame pela câmera e o sistema realizar a verificação das informações com sucesso

  Scenario: Escanear exame pela câmera e verificar informações com sucesso
    Given eu tiro uma foto do meu exame e envio para o sistema
    When eu abro a câmera
    Then o sistema deve retornar minhas informações, informando se cada uma delas está dentro dos padrões ou não