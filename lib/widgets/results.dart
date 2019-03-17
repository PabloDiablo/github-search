import 'package:flutter/material.dart';

import '../bloc/api.dart';

const TextStyle subTextStyle = TextStyle(
    fontFamily: "Montserrat", fontSize: 14.0, fontWeight: FontWeight.normal);

class Results extends StatelessWidget {
  final List<SearchResultItem> items;

  Results({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1,
      duration: Duration(milliseconds: 300),
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return InkWell(
            onTap: () => showItem(context, item),
            child: Container(
              alignment: FractionalOffset.center,
              margin: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(right: 16),
                      child: Hero(
                        tag: item.fullName,
                        child: ClipOval(
                          child: Image.network(
                            item.avatarUrl,
                            width: 56,
                            height: 56,
                          ),
                        ),
                      )),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 6, bottom: 4),
                          child: Text(
                            "${item.name}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            "${item.fullName}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: subTextStyle,
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 6, bottom: 4),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "Stars: ${item.stars}",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: subTextStyle,
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "Forks: ${item.forks}",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: subTextStyle,
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    item.language ?? "",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: subTextStyle,
                                  ),
                                )
                              ],
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void showItem(BuildContext context, SearchResultItem item) {
    Navigator.push(context,
        MaterialPageRoute<Null>(builder: (BuildContext context) {
      return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: GestureDetector(
          key: Key(item.avatarUrl),
          onTap: () => Navigator.pop(context),
          behavior: HitTestBehavior.opaque,
          child: SizedBox.expand(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        child: Hero(
                          tag: item.fullName,
                          child: Image.network(
                            item.avatarUrl,
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                      Container(
                          child: Text(item.name,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              )))
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Center(
                      child: Text(
                        item.description ?? "",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }));
  }
}
