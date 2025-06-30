import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // here we used color and alpha to make the image look faded
        // you can also use Opacity widget to achieve the same effect
        // but using color with alpha is more performant
        // because it doesn't require an additional widget in the widget tree
        Center(
          child: Image.asset(
            "assets/images/quiz-logo.png",
            height: 350,
            color: const Color.fromARGB(150, 206, 206, 206),
          ),
        ),
        SizedBox(height: 80),
        Text(
          "learn flutter the fun way!",
          style: TextStyle(
            fontSize: 25,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
        ),

        SizedBox(height: 40),
        ElevatedButton.icon(
          onPressed: startQuiz,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          ),

          label: Text("start Quiz", style: TextStyle(color: Colors.white)),
          icon: Icon(Icons.arrow_circle_right_outlined, color: Colors.white),
        ),
      ],
    );
  }
}
