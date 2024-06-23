import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meals_app/data/models/quote_model.dart';
import 'package:meals_app/utils/string_constants.dart';

class QuoteRemoteDataSource {
  final http.Client client;

  QuoteRemoteDataSource({required this.client});

  Future<QuoteModel> getRandomQuote() async {
    var url = '$quotesApiBaseUrl/quotes/random';
    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body);
      return QuoteModel.fromJson(json.first);
    } else {
      throw Exception('Failed to load quote');
    }
  }
}
