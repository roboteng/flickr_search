import 'package:cached_network_image/cached_network_image.dart';
import 'package:flickr_search/models/photo.dart';
import 'package:flickr_search/widgets/flickrAppBar.dart';
import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  final Photo photo;

  const ImagePage({Key key, this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: flickrAppBar(context, photo.title),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: photo.url('b'),
              placeholder: (_, __) => Hero(
                tag: photo.secret,
                child: CachedNetworkImage(
                  imageUrl: photo.url('s'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(photo.desc),
                  DataRow(
                    title: Text('URL'),
                    value: Text(
                      photo.url('o'),
                    ),
                  ),
                  photo.hasSize
                      ? DataRow(
                          title: Text('Size'),
                          value: Text('${photo.width} x ${photo.height}'),
                        )
                      : Container(),
                  DataRow(
                    title: Text('Tags'),
                    value: Text(photo.tags ?? 'None'),
                  ),
                  DataRow(
                    title: Text(''),
                    value: Text(''),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DataRow extends StatelessWidget {
  final Widget title;
  final Widget value;

  const DataRow({Key key, this.title, this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: title,
        ),
        Expanded(
          flex: 3,
          child: value,
        ),
      ],
    );
  }
}
