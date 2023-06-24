import 'dart:math';

import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_quiz_app/controller/provider.dart';
import 'package:flutter_application_quiz_app/model/qstns_and_ans_list.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ConfettiController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ConfettiController(duration: const Duration(seconds: 5));
    _controller.play();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _showText = false;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double degToRad(double deg) => deg * (pi / 180.0);
  bool _showText = true;

  @override
  Widget build(BuildContext context) {
    final indexProvider = Provider.of<IndexNotifier>(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 28, 0, 153),
      body: Center(
        child: Stack(
          children: [
            ConfettiWidget(
              confettiController: _controller,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: true,
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple,
              ],
              numberOfParticles: 25,
            ),
            Center(
                child: Text(
              ' Total Score = ${indexProvider.totalScore}/ ${autoQstnsList.length}',
              style: GoogleFonts.roboto(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )
                    .animate(
                      delay: 3000
                          .ms, // this delay only happens once at the very start
                      onPlay: (controller) => controller.repeat(), // loop
                    )
                    .fadeIn(delay: 5.ms)),
            Center(
              child: Visibility(
                visible: _showText,
                child: AnimatedOpacity(
                  opacity: _showText ? 1.0 : 0.0,
                  duration: Duration(seconds: 1),
                  child: Text(
                    'Share Your Score With Friends',
                    style: GoogleFonts.roboto(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: ConfettiWidget(
                blastDirectionality: BlastDirectionality.explosive,
                confettiController: _controller,
                blastDirection: -pi / 2, // radial value - LEFT
                particleDrag: 0.05, // apply drag to the confetti
                emissionFrequency: 0.05, // how often it should emit
                numberOfParticles: 20, // number of particles to emit
                gravity: 0.05, // gravity - or fall speed
                shouldLoop: true,
                colors: const [
                  Color.fromARGB(255, 190, 189, 189),
                  Color.fromARGB(255, 169, 187, 1),
                  Color.fromARGB(255, 187, 0, 34),
                  Colors.green,
                  Colors.blue,
                  Colors.pink,
                  Colors.orange,
                  Colors.purple,
                ],

                strokeWidth: 0,
                strokeColor: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
