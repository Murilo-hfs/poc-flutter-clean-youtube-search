import 'dart:io';

import 'package:dio/dio.dart';
import 'package:poc_clean_arch_mobx/app/modules/errors/failure_datasource.dart';

class ResponseUtils {
  static Map<String, dynamic> validate(dynamic instance, Response response) {
    switch (response.statusCode) {
      case HttpStatus.ok:
        return Map.from(response.data);
      case HttpStatus.badRequest:
        StringBuffer sb = StringBuffer();
        for (var error in response.data['errors']) {
          sb.writeln(error['description']);
        }
        throw FailureDatasource(
          instance,
          sb.isNotEmpty
              ? sb.toString()
              : 'Algum parâmetro obrigatório não foi enviado ou é inválido.',
        );
      case HttpStatus.unauthorized:
        throw FailureDatasource(
            instance, 'Usuário não autenticado ou acesso inválido.');
      case HttpStatus.notFound:
        throw FailureDatasource(instance, 'Caminho solicitado não existe.');
      case HttpStatus.forbidden:
        throw FailureDatasource(instance, 'Requisição não autorizada.');
      case HttpStatus.tooManyRequests:
        throw FailureDatasource(
            instance, 'Muitos pedidos em um determinado período de tempo.');
        throw FailureDatasource(
            instance, 'Algo deu errado no servidor do Asaas.');
      default:
        throw FailureDatasource(instance, 'Status não tratado.');
    }
  }
}
