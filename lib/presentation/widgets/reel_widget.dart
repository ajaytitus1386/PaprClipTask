import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:papr_clip_task/domain/entities/reel.dart';
import 'package:papr_clip_task/presentation/animations/like_animation_widget.dart';
import 'package:papr_clip_task/presentation/animations/mute_animation_widget.dart';
import 'package:papr_clip_task/presentation/widgets/reel_actions_widget.dart';
import 'package:papr_clip_task/presentation/widgets/reel_info_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ReelWidget extends StatefulWidget {
  final Reel reel;
  const ReelWidget({Key? key, required this.reel}) : super(key: key);

  @override
  State<ReelWidget> createState() => _ReelWidgetState();
}

class _ReelWidgetState extends State<ReelWidget> {
  late YoutubePlayerController _youtubePlayerController;
  bool isUiHidden = false;
  bool isMute = false;
  bool isLiked = false;
  bool isMuteIconAnimating = false;
  bool isLikeIconAnimating = false;
  @override
  void initState() {
    super.initState();
    _youtubePlayerController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.reel.link) ?? '',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        loop: true,
        hideControls: true,
        hideThumbnail: true,
      ),
    );
  }

  @override
  void dispose() {
    _youtubePlayerController.dispose();
    super.dispose();
  }

  //
  // User Interaction Functionality
  //
  void toggleMute() {
    if (isMute) {
      _youtubePlayerController.unMute();
      setState(() {
        isMute = false;
        isMuteIconAnimating = true;
      });
    } else {
      _youtubePlayerController.mute();
      setState(() {
        isMute = true;
        isMuteIconAnimating = true;
      });
    }
  }

  void pauseReel(LongPressStartDetails longPressStartDetails) {
    if (_youtubePlayerController.value.isPlaying) {
      _youtubePlayerController.pause();
      setState(() {
        isUiHidden = true;
      });
    }
  }

  void playReel(LongPressEndDetails longPressEndDetails) {
    if (!_youtubePlayerController.value.isPlaying) {
      _youtubePlayerController.play();
      setState(() {
        isUiHidden = false;
      });
    }
  }

  void toggleLikeReel() {
    setState(() {
      isLiked = !isLiked;
      if (isLiked) isLikeIconAnimating = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: toggleMute,
        onLongPressStart: pauseReel,
        onLongPressEnd: playReel,
        onDoubleTap: toggleLikeReel,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Center(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: YoutubePlayer(
                    controlsTimeOut: const Duration(milliseconds: 0),
                    aspectRatio: 3 / 4,
                    width: MediaQuery.of(context).size.width,
                    controller: _youtubePlayerController,
                    showVideoProgressIndicator: false,
                  ),
                ),
              ),
            ),
            //
            // Bottom up Gradient
            //
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.65), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.center,
              )),
            ),
            //
            // Reel Controls
            //
            Opacity(
              opacity: isUiHidden ? 0 : 1,
              child: Column(
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
                      Flexible(
                          flex: 2,
                          child: ReelActionsWidget(
                            isLiked: isLiked,
                          ))
                    ],
                  )
                ],
              ),
            ),
            Opacity(
              opacity: isLikeIconAnimating ? 1 : 0,
              child: Center(
                child: LikeAnimationWidget(
                  child: FaIcon(
                    FontAwesomeIcons.solidHeart,
                    size: 120,
                    color: Colors.red.shade400,
                  ),
                  isAnimating: isLikeIconAnimating,
                  duration: const Duration(milliseconds: 500),
                  onEnd: () => setState(() {
                    isLikeIconAnimating = false;
                  }),
                ),
              ),
            ),
            Opacity(
              opacity: isMuteIconAnimating ? 1 : 0,
              child: Center(
                child: MuteAnimationWidget(
                  child: FaIcon(
                    isMute
                        ? FontAwesomeIcons.volumeMute
                        : FontAwesomeIcons.volumeUp,
                    size: 40,
                    color: Colors.white,
                  ),
                  duration: const Duration(milliseconds: 500),
                  isAnimating: isMuteIconAnimating,
                  onEnd: () => setState(() {
                    isMuteIconAnimating = false;
                  }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
