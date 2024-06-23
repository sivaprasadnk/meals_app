import 'package:meals_app/domain/entities/quote.dart';

abstract class QuoteRepository {
  Future<Quote> getRandomQuote();
}
