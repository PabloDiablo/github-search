import 'package:github_search/bloc/api.dart';

abstract class SearchState {}

class InitialState extends SearchState {}

class LoadingState extends SearchState {}

class EmptyState extends SearchState {}

class SuccessState extends SearchState {
  final List<SearchResultItem> items;

  SuccessState(this.items);
}

class ErrorState extends SearchState {
  final String message;

  ErrorState(this.message);
}