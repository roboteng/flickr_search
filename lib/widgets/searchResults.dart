import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flickr_search/models/photo.dart';
import 'package:flickr_search/models/photoList.dart';
import 'package:flickr_search/pages/imagePage.dart';
import 'package:flickr_search/utils/fetchSearch.dart';
import 'package:flutter/material.dart';

class SearchResults extends StatefulWidget {
  final String searchText;

  const SearchResults({Key key, this.searchText}) : super(key: key);

  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchSearch(widget.searchText).then(
        (value) => PhotoList.fromJSON(
          jsonDecode(trim(value.body)),
        ),
      ),
      builder: (context, data) {
        if (data.hasData) {
          PhotoList pl = data.data;
          if (pl.photos.length == 0) {
            return Center(
              child: Text('No Results'),
            );
          }
          return ListView.builder(
              itemCount: pl.photos.length,
              itemBuilder: (context, i) {
                Photo photo = pl.photos[i];
                return ListTile(
                  leading: Hero(
                    tag: photo.secret,
                    child: CachedNetworkImage(
                      imageUrl: photo.url('s'),
                      placeholder: (_, __) => SizedBox(
                        width: 75,
                        height: 75,
                      ),
                      errorWidget: (_, message, __) => SizedBox(
                        width: 75,
                        height: 75,
                        child: Text(message),
                      ),
                    ),
                  ),
                  title: Text(photo.title),
                  subtitle: photo.hasSize
                      ? Text('${photo.width} x ${photo.height}')
                      : null,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImagePage(
                        photo: photo,
                      ),
                    ),
                  ),
                );
              });
        } else if (data.hasError) {
          return Center(
            child: Text('Error'),
          );
        } else {
          return Center(
            child: Text('Loading'),
          );
        }
      },
    );
  }
}
