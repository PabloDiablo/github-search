import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
        opacity: 1,
        duration: Duration(milliseconds: 300),
        child: Container(
          alignment: FractionalOffset.center,
          child: CircularProgressIndicator(),
        ));
  }
}
