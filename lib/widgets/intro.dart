import 'package:flutter/material.dart';

class Intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.info,
              color: Colors.blue,
              size: 80,
            ),
            Container(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                'Enter some search terms to start.',
                style: TextStyle(color: Colors.blueGrey),
              ),
            )
          ],
        ),
      );
  }
}
