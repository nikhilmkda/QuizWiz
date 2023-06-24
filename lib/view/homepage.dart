import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_quiz_app/controller/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
     final indexProvider = Provider.of<IndexNotifier>(context);
     return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
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
            ).animate().fadeIn(delay: 300.ms, duration: 500.ms),
          ),
          body: Stack(children: [
            Container(
              height: 800,
              color: Color.fromARGB(255, 58, 3, 208),
            ),
            Center(
              child: Container(
                height: 650,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: NetworkImage(
                            'https://img.freepik.com/free-vector/question-mark-template-help-support-page_1017-27386.jpg'))),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 8, top: 250),
                child: Text(
                  'Research has shown that practicing retrieval through quizzes and testing can improve'
                  'long-term memory retention compared to passive study methods like rereading or highlighting.',
                  style: GoogleFonts.oswald(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ).animate().fadeIn(delay: 1000.ms, duration: 500.ms),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Color.fromARGB(255, 0, 6, 32),
                    Colors.transparent.withOpacity(0.0),
                  ],
                ),
              ),
              // other properties
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 8, top: 100),
                child: Text(
                  'Did You Know',
                  style: GoogleFonts.oswald(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ).animate().fadeIn(delay: 500.ms, duration: 500.ms),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () => indexProvider.navigateToqstnAnsPage(context),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  // ignore: sort_child_properties_last
                  child: Center(
                    child: Text(
                      'START',
                      style: GoogleFonts.montserrat(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ).animate().fadeIn(delay: 1000.ms, duration: 500.ms),
                  ),
                  height: 70,
                  width: double.infinity,
                ),
              ),
            ),
          ]),
        );
      }),
    );
  }
}