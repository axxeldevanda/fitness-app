import 'package:fitness_app/screens/exercise_hub.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String apiURL =
      "https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json";

  ExerciseHub exerciseHub;

  @override
  void initState() {
    super.initState();
    getExercises();
  }

  void getExercises() async {
    var response = await http.get(apiURL);
    var body = response.body;

    var decodedJson = jsonDecode(body);

    exerciseHub = ExerciseHub.fromJson(decodedJson);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Test"),
        ),
      ),
      body: Container(
          child: exerciseHub != null
              ? ListView(
                  children: exerciseHub.exercises.map((e) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(16)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: FadeInImage(
                        image: NetworkImage(e.thumbnail),
                        placeholder: AssetImage("assets/placeholder.jpg"),
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }).toList())
              : LinearProgressIndicator()),
    );
  }
}
