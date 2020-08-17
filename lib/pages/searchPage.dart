import 'package:flickr_search/widgets/flickrAppBar.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: flickrAppBar(context, 'Flickr Search'),
      body: Container(),
    );
  }
}
