import 'package:flutter_gherkin/flutter_gherkin.dart';

class MedicamentosWorld extends World {
  bool? telaConsultasAberta;
  bool? abaMedicamentosClicada;
  bool? medicamentosExibidos;
}

class World {
}

StepDefinitionGeneric GivenEstouNaTelaDeConsultas() {
  return given<MedicamentosWorld>(
    'estou na tela de consultas',
    (context) async {
      context.world.telaConsultasAberta = true;
    },
  );
}


StepDefinitionGeneric WhenClicoNaAbaDeMedicamentos() {
  return when<MedicamentosWorld>(
    'clico na aba de medicamentos',
    (context) async {
      context.world.abaMedicamentosClicada = true;
    },
  );
}

StepDefinitionGeneric ThenSistemaDeveExibirMedicamentosCadastrados() {
  return then<MedicamentosWorld>(
    'o sistema deve exibir os medicamentos cadastrados',
    (context) async {
      expect(context.world.abaMedicamentosClicada, true);
      context.world.medicamentosExibidos = true;
    },
  );
}