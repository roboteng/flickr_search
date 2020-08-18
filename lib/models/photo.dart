class Photo {
  // copies the fields of the response, except its camelCase
  final String id;
  final String owner;
  final String secret;
  final String server;
  final String title;
  final int farm;
  final bool isPublic;
  final bool isFriend;
  final bool isFamily;
  final String width;
  final String height;
  final String tags;
  final String desc;
  final String urlO;

  Photo({
    this.id,
    this.farm,
    this.owner,
    this.secret,
    this.server,
    this.title,
    this.isPublic,
    this.isFriend,
    this.isFamily,
    this.width,
    this.height,
    this.tags,
    this.desc,
    this.urlO,
  });

  factory Photo.fromJSON(Map<String, dynamic> json) {
    //print(json['title']);
    //print(json);
    const String WIDTH = 'o_width';
    const String HEIGHT = 'o_height';
    print(json['path_alias']);
    return Photo(
      id: json['id'],
      farm: json['farm'],
      owner: json['owner'],
      secret: json['secret'],
      server: json['server'],
      title: json['title'],
      isPublic: json['ispublic'] == 1,
      isFriend: json['isfriend'] == 1,
      isFamily: json['isfamily'] == 1,
      width: json[WIDTH],
      height: json[HEIGHT],
      desc: json['description']['_content'] ?? '',
      tags: json['tags'],
      urlO: json['url_o'],
    );
  }

  bool get hasSize => (width == null) || (height == null);

  String url(String size) =>
      'https://farm$farm.staticflickr.com/$server/${id}_${secret}_$size.jpg';
}
