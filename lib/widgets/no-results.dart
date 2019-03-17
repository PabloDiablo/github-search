import 'package:flutter/material.dart';

class NoResults extends StatelessWidget {
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
                Icons.warning,
                color: Colors.orange,
                size: 80,
              ),
              Container(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  'No results found for your search.',
                  style: TextStyle(color: Colors.blueGrey),
                ),
              )
            ],
          ),
        ));
  }
}
