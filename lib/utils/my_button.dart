import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.txt, this.width = .2});

  final String txt;
  final double width;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    return Center(
      child: Container(
        width: w * width,
        height: w * .2,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.grey.shade800,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: Colors.grey.shade700,
            borderRadius: BorderRadius.circular(15),
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade500, width: 1.5),
            ),
          ),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    colors: [
                      Colors.grey.shade900,
                      Colors.grey.shade700,
                    ], // Dark to light gradient
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [.1, 1]),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    offset: const Offset(2, 2),
                  ),
                ],
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade600, width: 1.5),
                ) // Light blue border
                ),
            child: Text(
              txt,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: Colors.black38,
                    blurRadius: 4,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
