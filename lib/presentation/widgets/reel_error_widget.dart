import 'package:flutter/material.dart';
import 'package:papr_clip_task/presentation/global/event_dispatchers.dart';
import 'package:papr_clip_task/presentation/styling/color_palettes.dart';
import 'package:papr_clip_task/presentation/styling/text_styles.dart';

class ReelErrorWidget extends StatelessWidget {
  final String message;
  const ReelErrorWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.25),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.withOpacity(0.65))),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Uh oh, we found an Error',
              textAlign: TextAlign.center,
              style: buildErrorHeadingStyle(),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              message,
              textAlign: TextAlign.center,
              style: buildDefaultStyle(),
            ),
            const SizedBox(
              height: 10,
            ),
            // Refresh State Button
            IconButton(
                onPressed: () {
                  dispatchGetAllReels(context);
                },
                icon: Icon(
                  Icons.restart_alt,
                  color: primary,
                  size: 20,
                ))
          ],
        ),
      ),
    );
  }
}
