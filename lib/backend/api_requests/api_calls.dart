import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetChannelVideosCall {
  static Future<ApiCallResponse> call({
    String? videoid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetChannelVideos',
      apiUrl: 'https://www.googleapis.com/youtube/v3/videos?part=statistics',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'id': videoid,
        'key': "AIzaSyATfN1FXQSmLX5gmEk1GGMZMSYx9CNXlkg",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic title(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.title''',
      );
  static List? items(dynamic response) => getJsonField(
        response,
        r'''$.items''',
        true,
      ) as List?;
  static String? views(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.items[:].statistics.viewCount''',
      ));
  static String? like(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.items[:].statistics.likeCount''',
      ));
  static String? comment(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.items[:].statistics.commentCount''',
      ));
}

class GetChannelVideosCopyCall {
  static Future<ApiCallResponse> call({
    String? videoid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetChannelVideos Copy',
      apiUrl: 'https://www.googleapis.com/youtube/v3/videos?part=snippet',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'id': videoid,
        'key': "AIzaSyATfN1FXQSmLX5gmEk1GGMZMSYx9CNXlkg",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? tittle(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.items[:].snippet.title''',
      ));
  static String? desc(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.items[:].snippet.description''',
      ));
}

class GetChannelVideoscommentlistCall {
  static Future<ApiCallResponse> call({
    String? videoid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetChannelVideoscommentlist',
      apiUrl:
          'https://www.googleapis.com/youtube/v3/commentThreads?part=snippet',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'id': videoid,
        'key': "AIzaSyATfN1FXQSmLX5gmEk1GGMZMSYx9CNXlkg",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? tittle(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.items[:].snippet.title''',
      ));
  static String? desc(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.items[:].snippet.description''',
      ));
}

class TestApiYoutubeCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'test api youtube',
      apiUrl:
          'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=UUcEyW5lpznicoLwrx2qD_Cg&maxResults=20&key=AIzaSyDJ-ahw0ItLETnPVIFd4V-u7Kuu7E08uqE',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static Future<ApiCallResponse> callWithPageToken({String? pageToken}) async {
    String url = 'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=UUcEyW5lpznicoLwrx2qD_Cg&maxResults=20&key=AIzaSyDJ-ahw0ItLETnPVIFd4V-u7Kuu7E08uqE';
    if (pageToken != null && pageToken.isNotEmpty) {
      url += '&pageToken=$pageToken';
    }
    
    return ApiManager.instance.makeApiCall(
      callName: 'test api youtube with page token',
      apiUrl: url,
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? items(dynamic response) => getJsonField(
        response,
        r'''$.items''',
        true,
      ) as List?;
  static List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? image(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.thumbnails.medium.url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.videoId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? ressourceid(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.resourceId''',
        true,
      ) as List?;
  static List<String>? vIdeoID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.videoId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
          
  static String? nextPageToken(dynamic response) => getJsonField(
        response,
        r'''$.nextPageToken''',
      );
}

class PlaylistTittleCall {
  static Future<ApiCallResponse> call({
    String? id = 'PLPQ9PFp4Gfzwe34gXaT-GxvIW8HIuiYyx',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Playlist tittle',
      apiUrl: 'https://www.googleapis.com/youtube/v3/playlists?part=snippet&',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'id': id,
        'key': "AIzaSyDJ-ahw0ItLETnPVIFd4V-u7Kuu7E08uqE",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? palylistID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static dynamic? items(dynamic response) => getJsonField(
        response,
        r'''$.items''',
      );
  static String? tittle(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.items[:].snippet.localized.title''',
      ));
}

class PlaylistitemsCall {
  static Future<ApiCallResponse> call({
    String? playlistId = '',
    String? pageToken = '',
  }) async {
    Map<String, dynamic> params = {
      'playlistId': playlistId,
      'maxResults': "50",
      'key': "AIzaSyDJ-ahw0ItLETnPVIFd4V-u7Kuu7E08uqE",
    };
    
    if (pageToken != null && pageToken.isNotEmpty) {
      params['pageToken'] = pageToken;
    }
    
    return ApiManager.instance.makeApiCall(
      callName: 'playlistitems',
      apiUrl:
          'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&',
      callType: ApiCallType.GET,
      headers: {},
      params: params,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
  
  // Method to get all items from playlist with pagination
  static Future<List<dynamic>> getAllItems({
    required String playlistId,
  }) async {
    List<dynamic> allItems = [];
    String? nextPageToken;
    
    do {
      final response = await call(
        playlistId: playlistId,
        pageToken: nextPageToken,
      );
      
      if (response.succeeded) {
        final items = getJsonField(response.jsonBody, r'''$.items''', true) as List?;
        if (items != null) {
          allItems.addAll(items);
        }
        
        nextPageToken = castToType<String>(getJsonField(
          response.jsonBody,
          r'''$.nextPageToken''',
        ));
      } else {
        break;
      }
    } while (nextPageToken != null && nextPageToken.isNotEmpty);
    
    return allItems;
  }

  static List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? tittle(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? items(dynamic response) => getJsonField(
        response,
        r'''$.items''',
        true,
      ) as List?;
  static List<String>? image(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.thumbnails.medium.url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.videoId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  
  static String? nextPageToken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.nextPageToken''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
