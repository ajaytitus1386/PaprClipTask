import 'package:papr_clip_task/core/error/exceptions.dart';
import 'package:papr_clip_task/core/network/network_info.dart';
import 'package:papr_clip_task/data/api/reel_api.dart';
import 'package:papr_clip_task/domain/entities/reel.dart';
import 'package:papr_clip_task/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:papr_clip_task/domain/repos/reel_repo.dart';

class ReelRepoImpl implements ReelRepo {
  final ReelApi reelApi;
  final NetworkInfo networkInfo;

  ReelRepoImpl({required this.reelApi, required this.networkInfo});
  @override
  Future<Either<Failure, List<Reel>>> getAllReelsFromApi() async {
    if (await networkInfo.isConnected) {
      try {
        final reels = await reelApi.fetchAllReels();
        return Right(reels);
      } on ServerException {
        return Left(
            ServerFailure(message: 'Failed to fetch reel data from API'));
      }
    } else {
      return Left(ServerFailure(message: 'Internet Connection not Detected'));
    }
  }
}
