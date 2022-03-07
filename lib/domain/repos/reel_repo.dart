import 'package:dartz/dartz.dart';
import 'package:papr_clip_task/core/error/failures.dart';
import 'package:papr_clip_task/domain/entities/reel.dart';

abstract class ReelRepo {
  /// Fetches API JSON response from endpoint and converts it List[Reel]
  ///
  /// Returns a [ServerFailure] on exception
  Future<Either<Failure, List<Reel>>> getAllReelsFromApi();
}
