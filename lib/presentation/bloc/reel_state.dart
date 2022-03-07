part of 'reel_bloc.dart';

abstract class ReelState extends Equatable {
  const ReelState();

  @override
  List<Object> get props => [];
}

class ReelInitial extends ReelState {}

class ReelLoading extends ReelState {}

class ReelLoaded extends ReelState {
  final List<Reel> reels;

  const ReelLoaded({required this.reels});
}

class ReelError extends ReelState {
  final String message;

  const ReelError({required this.message});
}
