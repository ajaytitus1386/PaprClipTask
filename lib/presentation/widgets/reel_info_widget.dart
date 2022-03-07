import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:papr_clip_task/domain/entities/reel.dart';
import 'package:papr_clip_task/presentation/global/event_dispatchers.dart';
import 'package:papr_clip_task/presentation/styling/text_styles.dart';

class ReelInfoWidget extends StatelessWidget {
  final Reel reel;
  const ReelInfoWidget({Key? key, required this.reel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(reel.timestamp * 1000);
    String formattedDate = date.day.toString() +
        '-' +
        date.month.toString() +
        '-' +
        date.year.toString();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  child: Text(
                    reel.sourcePage,
                    style: buildBoldNormalStyle(),
                  ),
                ),
              ],
            ),
            subtitle: Text(
              formattedDate,
              style: buildDefaultStyle(),
            ),
            leading: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(reel.displayImage),
              onBackgroundImageError:
                  (Object exception, StackTrace? stacktrace) {
                dispatchGetAllReels(context);
              },
            ),
          ),
          ExpandableText(
            reel.title,
            expandText: '',
            expandOnTextTap: true,
            collapseOnTextTap: true,
            maxLines: 1,
            style: buildDefaultStyle(),
            linkColor: Colors.white,
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
