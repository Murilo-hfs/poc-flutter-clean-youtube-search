import 'dart:async';

abstract class YoutubeSearchDataSource{
  FutureOr<Map<String, dynamic>> fetchYoutube(String body);
}