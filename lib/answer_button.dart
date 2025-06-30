import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String answerText;
  final Function onTap;

  const AnswerButton({super.key, required this.answerText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () => onTap(answerText),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        
        ),
        child: Text(answerText, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
