import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:github_search/bloc/bloc.dart';
import 'package:github_search/bloc/events.dart';
import 'package:github_search/bloc/state.dart';

import './intro.dart';
import './loading.dart';
import './no-results.dart';
import './error.dart';
import './results.dart';

class SearchScreen extends StatelessWidget {
  final SearchBloc _searchBloc = SearchBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Github Search')),
      body: Stack(
        children: <Widget>[
          Flex(
            direction: Axis.vertical,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 4.0),
                child: TextField(
                  onChanged: (text) {
                    _searchBloc.dispatch(TextHasChanged(text: text));
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search Github...',
                  ),
                  style: TextStyle(
                    fontSize: 36.0,
                    fontFamily: "Hind",
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              Expanded(
                  child: BlocBuilder<SearchEvent, SearchState>(
                bloc: _searchBloc,
                builder: (BuildContext context, SearchState state) {
                  if (state is InitialState) {
                    return Intro();
                  }

                  if (state is LoadingState) {
                    return Loading();
                  }

                  if (state is EmptyState) {
                    return NoResults();
                  }

                  if (state is ErrorState) {
                    return Error(
                      message: state.message,
                    );
                  }

                  if (state is SuccessState) {
                    return Results(
                      items: state.items,
                    );
                  }
                },
              ))
            ],
          )
        ],
      ),
    );
  }
}
