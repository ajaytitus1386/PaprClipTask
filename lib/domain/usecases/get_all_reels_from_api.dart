import 'package:papr_clip_task/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:papr_clip_task/core/usecase/usecase.dart';
import 'package:papr_clip_task/domain/entities/reel.dart';
import 'package:papr_clip_task/domain/repos/reel_repo.dart';

class GetAllReelsFromApi extends UseCase<List<Reel>, NoParams> {
  final ReelRepo reelRepo;

  GetAllReelsFromApi(this.reelRepo);

  @override
  Future<Either<Failure, List<Reel>>> call(NoParams params) async {
    return await reelRepo.getAllReelsFromApi();
  }
}
