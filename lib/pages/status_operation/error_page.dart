import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                //color: Colors.white,
                shape: BoxShape.circle
              ),
              child: Icon(
                Icons.error_rounded,
                color: Colors.white,
                size: 250,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Algo inesperado ocorreu, sentimos muito.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white
              ),
            ),
          ],
        ),
      ),
    );
  }
}