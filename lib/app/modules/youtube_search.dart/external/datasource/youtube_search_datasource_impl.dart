import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:poc_clean_arch_mobx/app/modules/errors/failure_datasource.dart';
import 'package:poc_clean_arch_mobx/app/modules/models/pagination_model.dart';
import 'package:poc_clean_arch_mobx/app/modules/utils/response_utils.dart';
import 'package:poc_clean_arch_mobx/app/modules/youtube_search.dart/domain/entities/youtube_search_response.dart';
import 'package:poc_clean_arch_mobx/app/modules/youtube_search.dart/infra/datasource/youtube_search_datasource.dart';

class YoutubeSearchDatasourceImpl implements YoutubeSearchDataSource {
  final Dio dio;
  YoutubeSearchDatasourceImpl({this.dio});

  @override
  FutureOr<Map<String, dynamic>> fetchYoutube(String body) async {
    try {
      var response =
          await dio.get('https://www.googleapis.com/youtube/v3/search');
      return ResponseUtils.validate(this, response);
    } catch (e) {
      throw 'Erro';
    }
  }

  @override
  FutureOr<Map<String, dynamic>> list(
      PaginationModel<YoutubeSearchResponseEntity> pagination) async {
    Response response;
    try {
      response = await dio.get('https://www.googleapis.com/youtube/v3/search');
    } on DioError catch (d) {
      response = d.response;
    } catch (e) {
      throw FailureDatasource(this, "Erro ao comunicar com o servidor");
    }
    // TODO MOCK DE RETORNO
    response.statusCode = HttpStatus.ok;
    response.data = {
      "kind": "youtube#searchListResponse",
      "etag": "UNxCC5nmirBHorjsCiY0YZwes70",
      "nextPageToken": "CAUQAA",
      "regionCode": "BR",
      "pageInfo": {"totalResults": 1000000, "resultsPerPage": 5},
      "items": [
        {
          "kind": "youtube#searchResult",
          "etag": "XVb-mUHmx-_KFzzoLss80dxHLVo",
          "id": {"kind": "youtube#video", "videoId": "foqDOoQrwaY"}
        },
        {
          "kind": "youtube#searchResult",
          "etag": "cW5gm3tGtZyF6UBSqhK8yjtUnd8",
          "id": {"kind": "youtube#video", "videoId": "YgYw-4uLnkk"}
        },
        {
          "kind": "youtube#searchResult",
          "etag": "CpK4C1RAL8BM2DmOJUBa87hxHjE",
          "id": {
            "kind": "youtube#playlist",
            "playlistId": "PLPj-KlbC18yEqBNKL3bC48kaSqZCH2i4L"
          }
        },
        {
          "kind": "youtube#searchResult",
          "etag": "WFaX3Fpa_4tf_Tcbo9EQJ0N2M1A",
          "id": {
            "kind": "youtube#channel",
            "channelId": "UCm_eI4FIrcXV0QUPVgvFEyw"
          }
        },
        {
          "kind": "youtube#searchResult",
          "etag": "6PO-XnU6wdEQHS2t-iUL_GYqC2o",
          "id": {
            "kind": "youtube#channel",
            "channelId": "UCWxlUwW9BgGISaakjGM37aw"
          }
        }
      ]
    };
    return ResponseUtils.validate(this, response);
  }
}
