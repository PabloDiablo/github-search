import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  final String message;

  const Error({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
        opacity: 1,
        duration: Duration(milliseconds: 300),
        child: Container(
          alignment: FractionalOffset.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.error,
                color: Colors.red,
                size: 80,
              ),
              Container(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  "$message",
                  style: TextStyle(color: Colors.blueGrey),
                ),
              )
            ],
          ),
        ));
  }
}
