import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_quiz_app/provider.dart';
import 'package:flutter_application_quiz_app/qstns_and_ans_list.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quiver/async.dart';
import 'show_result.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:page_transition/page_transition.dart';

class Qstn_ans_container extends StatefulWidget {
  const Qstn_ans_container({super.key});

  @override
  State<Qstn_ans_container> createState() => _Qstn_ans_containerState();
}

class _Qstn_ans_containerState extends State<Qstn_ans_container> {
  late int seconds;

  double progressValue = 1.0;
  @override
  void initState() {
    super.initState();

    seconds = 10;

    startTimer();
  }

  void startTimer() {
    CountdownTimer(Duration(seconds: seconds), Duration(seconds: 1))
        .listen((data) {})
      ..onData((data) {
        setState(() {
          seconds--;
          progressValue = seconds / 10;
        });
      })
      ..onDone(() {
        setState(() {
          seconds = 0;
          progressValue = 0;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    final indexProvider = Provider.of<IndexNotifier>(context);

    @override
    resetQuiz() {
      indexProvider.totalScore = 0;
      indexProvider.endQuiz = false;
      indexProvider.currentIndex = 0;
    }

    void answerClicked(bool userScore) {
      setState(() {
        indexProvider.ansSelectChangeColor = true;

        if (userScore) {
          indexProvider.totalScore++;
        }
        if (indexProvider.currentIndex + 1 == autoQstnsList.length) {
          indexProvider.endQuiz = true;
        }
      });
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(30),
          // ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert_outlined,
                  size: 40,
                )),
          ],
          leading: Padding(
            padding: const EdgeInsets.all(4.0),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.person,
                  size: 40,
                )),
          ),
          toolbarHeight: 70,
          backgroundColor: Color.fromARGB(255, 36, 0, 137),
          centerTitle: true,
          title: Text(
            'Quiz ON',
            style: GoogleFonts.montserrat(
                fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        body: Stack(
          children: [
            StreamBuilder<CountdownTimer>(
              stream: CountdownTimer(
                  Duration(seconds: seconds), Duration(seconds: 1)),
              builder: (context, snapshot) {
                return LinearProgressIndicator(
                  value: progressValue,
                  backgroundColor: Color.fromARGB(255, 255, 0, 0),
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Color.fromARGB(255, 0, 255, 4)),
                );
              },
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (indexProvider.endQuiz == false)
                        ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              elevation: MaterialStateProperty.all(0),
                            ),
                            onPressed: () {
                              if (indexProvider.currentIndex <= 0) {
                                return;
                              }
                              indexProvider.currentIndex =
                                  (indexProvider.currentIndex - 1) %
                                      autoQstnsList.length;
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.arrow_back_ios_outlined,
                                  size: 45,
                                  color: Colors.black,
                                ),
                                Text(
                                  'Back',
                                  style: GoogleFonts.oswald(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            ))
                      else
                        SizedBox(
                          width: 125,
                        ),
                      SizedBox(
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            '${indexProvider.currentIndex + 1}/${autoQstnsList.length}',
                            style: GoogleFonts.robotoMono(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        )),
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            elevation: MaterialStateProperty.all(0),
                          ),
                          onPressed: indexProvider.ansSelectChangeColor ==
                                      true ||
                                  seconds == 0
                              ? () {
                                  seconds = 10;
                                  startTimer();

                                  indexProvider.currentIndex++;
                                  //indexProvider.changeColorblue();
                                  indexProvider.ansSelectChangeColor = false;
                                  if (indexProvider.currentIndex >=
                                      autoQstnsList.length) {
                                    resetQuiz();
                                  }
                                }
                              : null,
                          child: Row(
                            children: [
                              Text(
                                indexProvider.endQuiz ? 'Restart' : 'Next',
                                style: GoogleFonts.oswald(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 45,
                                color: Colors.black,
                              )
                            ],
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 4, right: 4, top: 20, bottom: 20),
                  child: Container(
                    width: 365,
                    height: 240,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      color: Color.fromARGB(255, 42, 42, 93),
                      border: Border.all(
                        color: Color.fromARGB(255, 196, 196, 196),
                        width: 4,
                      ),
                    ),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 28, right: 18),
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 20.0, top: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.timer_outlined,
                                  size: 35,
                                  color:
                                      seconds != 0 ? Colors.white : Colors.red,
                                ),
                                Text(
                                  seconds != 0 ? '$seconds' : ' Time Out',
                                  style: GoogleFonts.aBeeZee(
                                      fontWeight: FontWeight.bold,
                                      fontSize: seconds != 0 ? 30 : 22,
                                      color: seconds != 0
                                          ? Colors.white
                                          : Colors.red),
                                )
                              ],
                            ),
                          ),
                          Text(
                            autoQstnsList[indexProvider.currentIndex]
                                ['question'],
                            style: GoogleFonts.roboto(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: seconds != 0
                                    ? Colors.white
                                    : Color.fromARGB(255, 255, 255, 255)),
                          ).animate().fadeIn(delay: 600.ms, duration: 500.ms),
                        ],
                      ),
                    )),
                  ),
                ),
                ...(autoQstnsList[indexProvider.currentIndex]['answersList']
                        as List<Map<String, dynamic>>)
                    .map(
                  (answer) => _AnswerContainers(
                      text: answer['answesString'],
                      color: indexProvider.ansSelectChangeColor
                          ? answer['score']
                              ? const LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 1, 128, 16),
                                    Colors.green,
                                    Color.fromARGB(255, 52, 226, 99),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                )
                              : const LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 120, 0, 0),
                                    Colors.red,
                                    Color.fromARGB(255, 239, 100, 100),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                )
                          : seconds != 0
                              ? const LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 0, 101, 163),
                                    Colors.blue,
                                    Color.fromARGB(255, 92, 162, 243),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                )
                              : const LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 120, 0, 0),
                                    Colors.red,
                                    Color.fromARGB(255, 239, 100, 100),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                      tapped: () {
                        if (indexProvider.ansSelectChangeColor ||
                            seconds == 0) {
                          return;
                        }

                        answerClicked(answer['score']);
                      }),
                ),
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: MyHomePage(),
                      isIos: true,
                      duration: Duration(milliseconds: 600),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.amber, Colors.amber.shade700],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 83, 83, 83)
                                .withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      height: 70,
                      width: double.infinity,
                      child: Center(
                          child: Text(
                        indexProvider.endQuiz
                            ? 'Click Here'
                            : ' Total Score = ${indexProvider.totalScore}/ ${autoQstnsList.length}',
                        style: GoogleFonts.roboto(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ).animate().fadeIn(delay: 300.ms, duration: 500.ms)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AnswerContainers extends StatelessWidget {
  final String text;
  final Gradient color;
  final VoidCallback tapped;

  const _AnswerContainers(
      {required this.text, required this.color, required this.tapped});

  @override
  @override
  Widget build(BuildContext context) {
    final indexProvider = Provider.of<IndexNotifier>(context);
    return InkWell(
      onTap: tapped,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
        child: Container(
          height: 55,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromARGB(255, 210, 210, 210),
              width: 2,
            ),
            gradient: color,
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  ' $text',
                  style: GoogleFonts.roboto(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ).animate().fadeIn(delay: 300.ms, duration: 500.ms),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
