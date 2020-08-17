import 'package:flutter/material.dart';

class SearchSuggestions extends StatelessWidget {
  final String searchText;

  const SearchSuggestions({Key key, this.searchText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(searchText);
  }
}
