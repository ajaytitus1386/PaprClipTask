import 'dart:convert';

import 'package:papr_clip_task/domain/entities/reel.dart';

List<ReelModel> reelsFromJson(String str) {
  return List<ReelModel>.from(
      json.decode(str).map((reelJson) => ReelModel.fromJson(reelJson)));
}

String reelsToJson(List<ReelModel> reels) {
  return json.encode(List<dynamic>.from(reels.map((reel) => reel.toJson())));
}

class ReelModel extends Reel {
  const ReelModel({
    required String displayImage,
    required String link,
    required String published,
    required String sourcePage,
    required int timestamp,
    required String title,
  }) : super(
          displayImage: displayImage,
          link: link,
          published: published,
          sourcePage: sourcePage,
          timestamp: timestamp,
          title: title,
        );

  static ReelModel fromJson(Map<String, dynamic> map) {
    return ReelModel(
      displayImage: map["display_image"] as String,
      link: map["link"] as String,
      published: map["published"] as String,
      sourcePage: map["source_page"] as String,
      timestamp: map["timestamp"] ?? 0,
      title: map["title"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'displayImage': displayImage,
      'link': link,
      'published': published,
      'sourcePage': sourcePage,
      'timestamp': timestamp,
      'title': title,
    };
  }
}
