abstract class SearchEvent {}

class TextHasChanged extends SearchEvent {
  final String text;

  TextHasChanged({this.text});
}