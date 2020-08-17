import 'package:flickr_search/models/photo.dart';
import 'package:flickr_search/widgets/searchResults.dart';
import 'package:flickr_search/widgets/searchSuggestions.dart';
import 'package:flutter/material.dart';

class PhotoSearch extends SearchDelegate<Photo> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      FlatButton(
        onPressed: () => this.showResults(context),
        child: Text('Search'),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        semanticLabel: 'Navigate up',
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SearchResults(
      searchText: query,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SearchSuggestions(
      searchText: query,
    );
  }
}
