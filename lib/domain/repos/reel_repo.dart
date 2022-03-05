import 'package:dartz/dartz.dart';
import 'package:papr_clip_task/core/error/failures.dart';
import 'package:papr_clip_task/domain/entities/reel.dart';

abstract class ReelRepo {
  Future<Either<Failure, List<Reel>>> getAllReelsFromApi();
}
