import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:uichallengesflutter/fitnessapp/exercise_screen.dart';
import 'package:uichallengesflutter/fitnessapp/model/excersie_hub.dart';

class ExcerciseStartScreen extends StatefulWidget {
  ExcerciseStartScreen({Key? key, required this.excercise}) : super(key: key);
  final Exercise excercise;

  @override
  _ExcerciseStartScreenState createState() => _ExcerciseStartScreenState();
}

class _ExcerciseStartScreenState extends State<ExcerciseStartScreen> {
  String showTimer(double value) {
    final roundedValue = value.ceil().toInt().toString();
    return '$roundedValue S';
  }

  int second = 10;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Hero(
        tag: widget.excercise.id,
        child: Stack(
          children: [
            CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: widget.excercise.thumbnail,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress)),
              errorWidget: (context, url, error) => Icon(Icons.error),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Color(0xFF000000),
                  Color(0x00000000),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.center,
              )),
            ),
            //       final viewModel01 = ExampleViewModel(
            //   appearance: appearance01,
            //   min: 0,
            //   max: 100,
            //   value: 60,
            //       pageColors: [Colors.white, HexColor('#E1C3FF')]);
            // final example01 = ExamplePage(
            //   viewModel: viewModel01,
            // );
            Positioned(
              left: 0,
              right: 0,
              bottom: 40,
              child: Container(
                height: 200,
                width: 200,
                child: SleekCircularSlider(
                  initialValue: 13,
                  max: 60,
                  min: 10,
                  appearance: CircularSliderAppearance(),
                  onChange: (double value) {
                    second = value.toInt();
                    print(value);
                  },
                  innerWidget: (v) {
                    return Center(
                      //alignment: Alignment.center,
                      child: Text(
                        '${showTimer(v)}',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.indigo[400],
                  onPrimary: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ExerciseScreen(
                              exercise: widget.excercise,
                              seconds: second,
                            )),
                  );
                },
                child: Text("Start Exercise"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
