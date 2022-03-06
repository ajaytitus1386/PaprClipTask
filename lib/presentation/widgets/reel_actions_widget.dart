import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:papr_clip_task/presentation/styling/text_styles.dart';

class ReelActionsWidget extends StatefulWidget {
  const ReelActionsWidget({Key? key}) : super(key: key);

  @override
  State<ReelActionsWidget> createState() => _ReelActionsWidgetState();
}

class _ReelActionsWidgetState extends State<ReelActionsWidget> {
  int likes = Random().nextInt(899) + 100;
  int comments = Random().nextInt(5999) + 1000;
  @override
  Widget build(BuildContext context) {
    const double iconSize = 30.0;
    return SizedBox(
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          buildSideIconButton(
              icon: const FaIcon(
            FontAwesomeIcons.heart,
            size: iconSize,
          )),
          Text(
            likes.toString() + 'k',
            style: buildDefaultStyle(),
          ),
          const SizedBox(
            height: 20,
          ),
          buildSideIconButton(
              icon: const FaIcon(
            FontAwesomeIcons.comment,
            size: iconSize,
          )),
          Text(
            comments.toString(),
            style: buildDefaultStyle(),
          ),
          const SizedBox(
            height: 20,
          ),
          buildSideIconButton(
              icon: const FaIcon(
            FontAwesomeIcons.paperPlane,
            size: iconSize,
          )),
          buildSideIconButton(
              icon: const Icon(
            Icons.more_vert,
            size: iconSize,
          ))
        ],
      ),
    );
  }

  IconButton buildSideIconButton(
      {required Widget icon, void Function()? onTap}) {
    return IconButton(
      onPressed: onTap ?? () {},
      icon: icon,
      color: Colors.white,
    );
  }
}
