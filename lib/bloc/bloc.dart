import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:github_search/bloc/api.dart';
import 'package:github_search/bloc/events.dart';
import 'package:github_search/bloc/state.dart';
import 'package:rxdart/rxdart.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GithubApi _api = GithubApi();

  @override
  SearchState get initialState => InitialState();

  @override
  Stream<SearchEvent> transform(Stream<SearchEvent> events) {
    final observableStream = events as Observable<SearchEvent>;

    return observableStream.debounce(Duration(milliseconds: 300));
  }

  @override
  Stream<SearchState> mapEventToState(SearchState currentState, SearchEvent event) async* {
    if (event is TextHasChanged) {
      if (event.text.isEmpty) {
        yield EmptyState();
      } else {
        yield LoadingState();

        try {
          final res = await _api.search(event.text);

          if (res.isEmpty) {
            yield EmptyState();
          } else {
            yield SuccessState(res.items);
          }
        } catch (err) {
          if (err is SearchError) {
            yield ErrorState(err.message);
          } else {
            yield ErrorState('There was an error');
          }
        }
      }
    }
  }

}