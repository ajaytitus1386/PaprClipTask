import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:papr_clip_task/presentation/styling/color_palettes.dart';
import 'package:papr_clip_task/presentation/styling/text_styles.dart';

class ReelActionsWidget extends StatefulWidget {
  late bool isLiked;
  ReelActionsWidget({Key? key, required this.isLiked}) : super(key: key);

  @override
  State<ReelActionsWidget> createState() => _ReelActionsWidgetState();
}

class _ReelActionsWidgetState extends State<ReelActionsWidget> {
  //? Randomly Generated Like and Comment counts
  int likes = Random().nextInt(899) + 100; // Likes in the scale of thousands
  int comments = Random().nextInt(5999) + 1000;
  //?
  @override
  Widget build(BuildContext context) {
    const double iconSize = 30.0;

    void toggleLike() {
      setState(() {
        widget.isLiked = !widget.isLiked;
      });
    }

    Widget likeIconOutlinedOrSolid = widget.isLiked
        // If is liked, use solid icon
        ? FaIcon(
            FontAwesomeIcons.solidHeart,
            size: iconSize,
            color: likeRed,
          )
        // Else use outlined icon
        : FaIcon(
            FontAwesomeIcons.heart,
            size: iconSize,
            color: primary,
          );

    return SizedBox(
      //? height of action bar
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          buildSideIconButton(
            icon: likeIconOutlinedOrSolid,
            onTap: toggleLike,
          ),
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
      color: primary,
    );
  }
}
