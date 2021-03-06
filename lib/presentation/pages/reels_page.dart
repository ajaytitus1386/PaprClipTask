import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papr_clip_task/presentation/bloc/reel_bloc.dart';
import 'package:papr_clip_task/presentation/global/event_dispatchers.dart';
import 'package:papr_clip_task/presentation/styling/color_palettes.dart';
import 'package:papr_clip_task/presentation/styling/text_styles.dart';
import 'package:papr_clip_task/presentation/widgets/reel_error_widget.dart';
import 'package:papr_clip_task/presentation/widgets/reel_widget.dart';

class ReelsPage extends StatelessWidget {
  const ReelsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Flix',
          style: buildPageHeadingStyle(),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: BlocBuilder<ReelBloc, ReelState>(
        builder: (context, state) {
          if (state is ReelInitial) {
            dispatchGetAllReels(context);
            return Center(
              child: CircularProgressIndicator(
                color: primary,
              ),
            );
          } else if (state is ReelLoaded) {
            return PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: state.reels.length,
              itemBuilder: (context, index) {
                return ReelWidget(reel: state.reels[index]);
              },
            );
          } else if (state is ReelError) {
            return Center(child: ReelErrorWidget(message: state.message));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
