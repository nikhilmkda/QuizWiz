import 'package:flutter/material.dart';
import 'package:flutter_application_quiz_app/view/qstn_ans_screen_container.dart';
import 'package:page_transition/page_transition.dart';

class IndexNotifier extends ChangeNotifier {
  bool ansSelectChangeColor = false;
  bool endQuiz = false;
  int _currentIndex = 0;
  int totalScore = 0;
  bool updateContainer1 = true;
  Color _color = Colors.blue;
  int get currentIndex => _currentIndex;
  @override
  set currentIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }

  Color get color => _color;
  void changeColorgreen() {
    _color = (_color == Colors.green) ? Colors.blue : Colors.green;
    notifyListeners();
  }

  void changeColorred() {
    _color = (_color == Colors.red) ? Colors.blue : Colors.red;
    notifyListeners();
  }

  void changeColorblue() {
    _color = (_color == Colors.green) ? Colors.blue : Colors.blue;
    _color = (_color == Colors.red) ? Colors.blue : Colors.blue;
    notifyListeners();
  }
  

  void navigateToqstnAnsPage(BuildContext context) {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.rightToLeft,
        child: Qstn_ans_container(),
        isIos: true,
        duration: Duration(milliseconds: 600),
      ),
    );
  }
}
