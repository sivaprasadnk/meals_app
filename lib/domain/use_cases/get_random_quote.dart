import 'package:meals_app/domain/entities/quote.dart';
import 'package:meals_app/domain/repository/quote_repository.dart';

class GetRandomQuote {
  final QuoteRepository repository;

  GetRandomQuote(this.repository);

  Future<Quote> execute() {
    return repository.getRandomQuote();
  }
}
