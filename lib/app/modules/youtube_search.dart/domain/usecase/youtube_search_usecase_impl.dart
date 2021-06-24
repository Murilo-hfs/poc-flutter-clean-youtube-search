import 'dart:async';

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
        } catch (e) {
        } throw "Erro ao buscar vídeo";
      }
}
