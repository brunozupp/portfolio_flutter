import 'package:flutter/material.dart';

class InlineInformation extends StatelessWidget {

  final String title;
  final String information;

  const InlineInformation({
    Key key, 
    this.title = "", 
    @required this.information
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        title.isNotEmpty 
        ? Text(
          title, 
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        )
        : Container(),
        Text(
          information,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}