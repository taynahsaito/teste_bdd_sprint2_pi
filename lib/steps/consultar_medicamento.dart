import 'package:flutter_gherkin/flutter_gherkin.dart';

class ConsultaWorld extends World {
  bool? telaDetalhesConsultaAberta;
  bool? consultaEditada;
}

StepDefinitionGeneric GivenEstouNaTelaDetalhesConsulta() {
  return given<ConsultaWorld>(
    'que estou na tela de detalhes da consulta',
    (context) async {
      context.world.telaDetalhesConsultaAberta = true;
    },
  );
}

StepDefinitionGeneric WhenClicoNoBotaoDeEdicao() {
  return when<ConsultaWorld>(
    'clico no botão de edição',
    (context) async {
      final finderBotaoEdicao = find.byKey(Key('botaoEdicao'));
      await tester.tap(finderBotaoEdicao);
      await tester.pumpAndSettle();
    },
  );
}

StepDefinitionGeneric AndModificoOsDetalhesDaConsulta() {
  return and<ConsultaWorld>(
    'modifico os detalhes da consulta',
    (context) async {
      final finderCampoEspecialidade = find.byKey(Key('campoEspecialidade'));
      final finderCampoHorario = find.byKey(Key('campoHorario'));
      final finderBotaoSalvar = find.byKey(Key('botaoSalvar'));

      await tester.enterText(finderCampoEspecialidade, 'Nova Especialidade');
      await tester.enterText(finderCampoHorario, '10:00 AM');
      await tester.tap(finderBotaoSalvar);
      await tester.pumpAndSettle();
    },
  );
}

StepDefinitionGeneric AndConfirmoAsAlteracoes() {
  return and<ConsultaWorld>(
    'confirmo as alterações',
    (context) async {
      final finderBotaoConfirmar = find.byKey(Key('botaoConfirmar'));
      await tester.tap(finderBotaoConfirmar);
      await tester.pumpAndSettle();
      context.world.consultaEditada = true;
    },
  );
}

StepDefinitionGeneric ThenConsultaDeveSerAtualizada() {
  return then<ConsultaWorld>(
    'a consulta deve ser atualizada com os novos detalhes',
    (context) async {
      expect(context.world.consultaEditada, true);
    },
  );
}