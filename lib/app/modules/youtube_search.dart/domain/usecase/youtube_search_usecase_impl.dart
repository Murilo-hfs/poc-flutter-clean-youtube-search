import 'dart:async';

import 'package:poc_clean_arch_mobx/app/modules/errors/failure_datasource.dart';
import 'package:poc_clean_arch_mobx/app/modules/errors/failure_repository.dart';
import 'package:poc_clean_arch_mobx/app/modules/errors/failure_usecase.dart';
import 'package:poc_clean_arch_mobx/app/modules/models/pagination_model.dart';
import 'package:poc_clean_arch_mobx/app/modules/youtube_search.dart/domain/entities/youtube_search_request_entity.dart';
import 'package:poc_clean_arch_mobx/app/modules/youtube_search.dart/domain/entities/youtube_search_response.dart';
import 'package:poc_clean_arch_mobx/app/modules/youtube_search.dart/domain/repositories/youtube_search_repository.dart';
import 'package:poc_clean_arch_mobx/app/modules/youtube_search.dart/presenter/usecase/youtube_search_usecase.dart';

class YoutubeSearchUsecaseImpl implements YoutubeSearchUsecase {
  YoutubeSearchRepository repository;
  YoutubeSearchUsecaseImpl(this.repository);

  @override
  FutureOr<YoutubeSearchResponseEntity> fetchYoutube(
      YoutubeSearchRequestEntity entity) async {
    try {
      return repository.fetchYoutube(entity);
    } catch (e) {}
    throw "Erro ao buscar vídeo";
  }

  @override
  FutureOr<PaginationModel<YoutubeSearchResponseEntity>> list(
      PaginationModel<YoutubeSearchResponseEntity> pagination) async {
    try {
      if (pagination.hasMore) {
        pagination.offset += pagination.limit;
      }
      var response = await repository.list(pagination);
      response.updateData(pagination);
      return response;
    } on FailureRepository {
      rethrow;
    } on FailureDatasource {
      rethrow;
    } catch (e) {
      throw FailureUseCase(
          this, 'Erro ao processar os dados da requisição do pagamento');
    }
  }
}
