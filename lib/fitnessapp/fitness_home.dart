import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uichallengesflutter/fitnessapp/excersice_start_detail.dart';

import 'model/excersie_hub.dart';

class FitnessHome extends StatefulWidget {
  const FitnessHome({Key? key}) : super(key: key);

  @override
  _FitnessHomeState createState() => _FitnessHomeState();
}

class _FitnessHomeState extends State<FitnessHome> {
  final String url =
      "https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json";
  ExerciseHub? excerciseHub;

  void getExcercises() async {
    var response = await http.get(Uri.parse(url));
    var decodedjson = jsonDecode(response.body);

    setState(() {
      excerciseHub = ExerciseHub.fromJson(decodedjson);
    });
  }

  @override
  void initState() {
    getExcercises();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff192A56),
        title: Text("fitness app"),
      ),
      body: Container(
        child: excerciseHub != null
            ? ListView(
                children: excerciseHub!.exercises.map((e) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExcerciseStartScreen(
                            excercise: e,
                          ),
                        ),
                      );
                    },
                    child: Hero(
                      tag: e.id,
                      child: Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16)),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: CachedNetworkImage(
                                imageUrl: e.thumbnail,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) => Center(
                                  child: CircularProgressIndicator(
                                      value: downloadProgress.progress),
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                                height: 250,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Container(
                                height: 250,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF000000),
                                      Color(0x00000000),
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.center,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.bottomLeft,
                              height: 250,
                              padding: EdgeInsets.only(left: 10, bottom: 10),
                              child: Text(
                                e.title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: LinearProgressIndicator()),
              ),
      ),
    );
  }
}
