import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:papr_clip_task/core/error/failures.dart';
import 'package:papr_clip_task/core/usecase/usecase.dart';
import 'package:papr_clip_task/domain/entities/reel.dart';
import 'package:papr_clip_task/domain/usecases/get_all_reels_from_api.dart';

part 'reel_event.dart';
part 'reel_state.dart';

class ReelBloc extends Bloc<ReelEvent, ReelState> {
  final GetAllReelsFromApi getAllReelsFromApi;
  ReelBloc({required this.getAllReelsFromApi}) : super(ReelInitial()) {
    on<ReelEvent>((event, emit) {
      emit(ReelInitial());
    });
    on<GetAllReelsFromApiEvent>((event, emit) async {
      emit(ReelLoading());
      final failureOrReels = await getAllReelsFromApi(NoParams());
      emit(eitherFailureOrReels(failureOrReels));
    });
  }

  /// Folds an [Either] object into [Failure] with its message or List[Reel]
  ReelState eitherFailureOrReels(Either<Failure, List<Reel>> failureOrReels) {
    return failureOrReels.fold(
        (failure) => ReelError(message: failure.toString()),
        (reels) => ReelLoaded(reels: reels));
  }
}
