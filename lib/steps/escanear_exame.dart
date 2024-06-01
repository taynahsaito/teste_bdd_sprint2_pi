import 'package:flutter_gherkin/flutter_gherkin.dart';

class ExameWorld extends World {
  String? exameFoto;
  bool? cameraAberta;
}

StepDefinitionGeneric GivenTiroFotoExame() {
  return given<String, ExameWorld>(
    'tiro uma foto do meu exame e mando para o sistema',
    (exameFoto, context) async {
      context.world.exameFoto = exameFoto;
    },
  );
}

StepDefinitionGeneric WhenAbroCamera() {
  return when<ExameWorld>(
    'abro a câmera',
    (context) async {
      context.world.cameraAberta = true;
    },
  );
}

StepDefinitionGeneric ThenSistemaDeveRetornarInformacoes() {
  return then<ExameWorld>(
    'o sistema deve retornar minhas informações, informando se cada uma delas está dentro dos padrões ou não',
    (context) async {
      final fotoEnviada = context.world.exameFoto;
      final cameraAberta = context.world.cameraAberta;

      expect(fotoEnviada, isNotNull);
      expect(cameraAberta, true);
    },
  );
}