import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:papr_clip_task/domain/entities/reel.dart';
import 'package:papr_clip_task/presentation/styling/text_styles.dart';

class ReelInfoWidget extends StatelessWidget {
  final Reel reel;
  const ReelInfoWidget({Key? key, required this.reel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            title: Text(
              reel.sourcePage,
              style: buildBoldNormalStyle(),
            ),
            leading: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(reel.displayImage),
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
