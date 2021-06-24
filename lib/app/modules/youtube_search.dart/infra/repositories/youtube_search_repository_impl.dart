import 'package:poc_clean_arch_mobx/app/modules/youtube_search.dart/domain/entities/youtube_search_response.dart';
import 'package:poc_clean_arch_mobx/app/modules/youtube_search.dart/domain/entities/youtube_search_request_entity.dart';
import 'dart:async';

import 'package:poc_clean_arch_mobx/app/modules/youtube_search.dart/domain/repositories/youtube_search_repository.dart';
import 'package:poc_clean_arch_mobx/app/modules/youtube_search.dart/infra/datasource/youtube_search_datasource.dart';
import 'package:poc_clean_arch_mobx/app/modules/youtube_search.dart/infra/models/youtube_search_model.dart';

class YoutubeSearchRepositoryImpl extends YoutubeSearchRepository {
  final YoutubeSearchDataSource dataSource;

  YoutubeSearchRepositoryImpl(this.dataSource);

  @override
  FutureOr<YoutubeSearchResponseEntity> fetchYoutube(
      YoutubeSearchRequestEntity entity) async{
        try {
          var response = await dataSource.fetchYoutube(entity.toJson());
          return YoutubeSearchModel.fromMap(response);
        } catch (e) {
        }
      }
}
