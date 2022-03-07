import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papr_clip_task/presentation/bloc/reel_bloc.dart';

/// When called, notifies BlocBuilder that state has changed and triggers the [GetAllReelsFromApiEvent]
void dispatchGetAllReels(BuildContext context) {
  BlocProvider.of<ReelBloc>(context).add(GetAllReelsFromApiEvent());
}
