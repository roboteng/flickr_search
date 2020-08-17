import 'package:flickr_search/utils/photoSearch.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget flickrAppBar(BuildContext context, String title) => AppBar(
      centerTitle: true,
      title: Text(title),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            showSearch(context: context, delegate: PhotoSearch());
          },
        ),
      ],
    );
