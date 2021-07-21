import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:uichallengesflutter/fitnessapp/model/excersie_hub.dart';

class ExerciseScreen extends StatefulWidget {
  ExerciseScreen({Key? key, required this.exercise, required this.seconds})
      : super(key: key);
  final Exercise exercise;
  final int seconds;
  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  bool _isCompleted = false;
  int _elapsedSeconds = 0;
  late Timer timer;
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();

  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      if (t.tick == widget.seconds) {
        t.cancel();
        setState(() {
          _isCompleted = true;
        });
        playAudio();
      }
      setState(() {
        _elapsedSeconds = t.tick;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void playAudio() {
    audioCache.play("fitness/cheering.wav");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: widget.exercise.gif,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress)),
              errorWidget: (context, url, error) => Icon(Icons.error),
              //height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          _isCompleted != true
              ? SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "${_elapsedSeconds.toInt()} / ${widget.seconds.toInt()} S",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                )
              : Container(),
          SafeArea(
              child: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              _elapsedSeconds = 0;
              Navigator.pop(context);
            },
          )),
        ],
      ),
    );
  }
}
