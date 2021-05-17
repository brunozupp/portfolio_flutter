import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255,215,219,219),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
              width: 60,
              child: CircularProgressIndicator(
                strokeWidth: 5,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Carregando...",
              style: TextStyle(
                fontSize: 16
              ),
            ),
          ],
        ),
      ),
    );
  }
}