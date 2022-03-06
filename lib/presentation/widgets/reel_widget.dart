import 'package:flutter/material.dart';
import 'package:papr_clip_task/domain/entities/reel.dart';
import 'package:papr_clip_task/presentation/widgets/reel_actions_widget.dart';
import 'package:papr_clip_task/presentation/widgets/reel_info_widget.dart';

class ReelWidget extends StatefulWidget {
  final Reel reel;
  const ReelWidget({Key? key, required this.reel}) : super(key: key);

  @override
  State<ReelWidget> createState() => _ReelWidgetState();
}

class _ReelWidgetState extends State<ReelWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.black.withOpacity(0.45), Colors.transparent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Reel Info
                  Flexible(
                      flex: 14,
                      child: ReelInfoWidget(
                        reel: widget.reel,
                      )),
                  // Reel Actions
                  const Flexible(flex: 2, child: ReelActionsWidget())
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
