import 'package:flickr_search/constants/keys.dart';
import 'package:http/http.dart' as http;

Future<http.Response> fetchSearch(String query) async {
  String req = formatRequest(
    'https://www.flickr.com/services/rest/',
    {
      'method': 'flickr.photos.search',
      'format': 'json',
      'api_key': apiKey,
      'tags': query,
      'extras': 'o_dims, description, tags, path_alias, url_o',
    },
  );
  print(req);
  final response = await http.get(req);
  if (response.statusCode == 200) {
    return response;
  } else
    throw Exception('Failed to load with error code ${response.statusCode}');
}

String formatRequest(String url, Map<String, String> params) {
  String paramString =
      (params.entries).map((item) => '${item.key}=${item.value}').join('&');
  return url + '?' + paramString;
}

String trim(String text) {
  int first = text.indexOf('(');
  String retval = text.substring(first + 1, text.length - 1);
  print(retval.substring(0, 10));
  print(retval.substring(retval.length - 10, retval.length));
  return retval;
}
