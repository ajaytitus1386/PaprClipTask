import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:papr_clip_task/core/error/exceptions.dart';
import 'package:papr_clip_task/data/models/reel_model.dart';

class ReelApi {
  final http.Client client;

  ReelApi({required this.client});

  Future<List<ReelModel>> fetchAllReels() async {
    const url = 'https://api.bottomstreet.com/socialMediaFeed?source=youtube';

    final response = await client
        .get(Uri.parse(url), headers: {"Content-Type": 'application/json'});

    if (response.statusCode == 200) {
      final responseJson = utf8.decode(response.bodyBytes);
      return reelsFromJson(responseJson);
    } else {
      throw ServerException();
    }
  }
}
