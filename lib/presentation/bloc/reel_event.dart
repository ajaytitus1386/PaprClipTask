part of 'reel_bloc.dart';

abstract class ReelEvent extends Equatable {
  const ReelEvent();

  @override
  List<Object> get props => [];
}

class GetAllReelsFromApiEvent extends ReelEvent {}
