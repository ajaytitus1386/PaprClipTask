import 'package:equatable/equatable.dart';

class Reel extends Equatable {
  final String displayImage;
  final String link;
  final String published;
  final String sourcePage;
  final int timestamp;
  final String title;

  const Reel({
    required this.displayImage,
    required this.link,
    required this.published,
    required this.sourcePage,
    required this.timestamp,
    required this.title,
  });

  @override
  List<Object?> get props =>
      [displayImage, link, published, sourcePage, timestamp, title];
}
