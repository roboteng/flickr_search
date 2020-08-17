import 'package:flickr_search/models/photo.dart';

class PhotoList {
  List<Photo> photos;

  PhotoList(this.photos);

  factory PhotoList.fromJSON(Map<String, dynamic> json) {
    print('${json.keys.contains('photos')}');
    //print(json['photos']['photo']);
    PhotoList l = PhotoList(
      json['photos']['photo']
          .map<Photo>((json) => Photo.fromJSON(json))
          .toList(),
    );
    return l;
  }
}
