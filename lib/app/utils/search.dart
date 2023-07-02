// import 'dart:developer';
//
// import 'package:http/http.dart' as http;
// import 'package:html/parser.dart' as parser;
// import 'package:html/dom.dart' as dom;
// import 'dart:convert';
//
// Future<String> searchOnGoogle(String query) async {
//   final url = Uri.parse('https://www.google.com/search?q=kathmandu images');
//   final response = await http.get(url);
//   extractImageUrlsFromGoogleSearch("kathmandu");
//
//   log("Response:${response.body}");
//   var imageUrls= extractImageUrls(response.body);
//   imageUrls.forEach((element) {
//     log("ImageUrl: $element");
//   });
//
//   if (response.statusCode == 200) {
//     final document = parser.parse(response.body);
//     final citeElements = document.querySelectorAll('cite');
//
//     if (citeElements.isNotEmpty) {
//       final wikipediaURL = citeElements[0].text;
//       final wikipediaApiJSON =
//           'https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&exintro=&explaintext=&titles=kathmandu';
//
//       final wikipediaApiResponse = await http.get(Uri.parse(wikipediaApiJSON));
//       final jsonResponse =
//       jsonDecode(wikipediaApiResponse.body) as Map<String, dynamic>;
//       final pages = jsonResponse['query']['pages'] as Map<String, dynamic>;
//       final firstPage = pages.entries.first.value;
//       final extract = firstPage['extract'] as String;
//       log(extract);
//       return extract;
//     }
//   }
//
//   return '';
// }
//
//
//
// List<String> extractImageUrls(String htmlString) {
//   final document = parser.parse(htmlString);
//   final imgElements = document.getElementsByTagName('img');
//   final imageUrls = <String>[];
//
//   for (var imgElement in imgElements) {
//     final imageUrl = imgElement.attributes['src'];
//     if (imageUrl != null && imageUrl.isNotEmpty) {
//       imageUrls.add(imageUrl);
//     }
//   }
//
//   return imageUrls;
// }
//
//
//
//
// Future<List<String>> extractImageUrlsFromGoogleSearch(String searchTerm) async {
//   final apiKey = 'AIzaSyBA9r9WBsfKFV5mrHgvZ1mo4evg8g0DeU4';
//   final cx = '017576662512468239146:omuauf_lfve';
//   final encodedSearchTerm = Uri.encodeComponent(searchTerm);
//   final url =
//       'https://www.googleapis.com/customsearch/v1?key=$apiKey&cx=$cx&q=$encodedSearchTerm&searchType=image';
//
//   final response = await http.get(Uri.parse(url));
//   log("Response: ${response.body}");
//   if (response.statusCode == 200) {
//     final jsonData = jsonDecode(response.body);
//     final items = jsonData['items'];
//     final imageUrls = items.map<String>((item) => item['link']).toList();
//     print(imageUrls);
//     return imageUrls;
//   } else {
//     throw Exception('Failed to fetch image URLs from Google search.');
//   }
// }
//
//
//
//
//
