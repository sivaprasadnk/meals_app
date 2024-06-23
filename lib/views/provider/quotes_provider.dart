// Data source provider
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:meals_app/data/data_sources/quote_remote_data_source.dart';
import 'package:meals_app/data/repository/quote_repository_impl.dart';
import 'package:meals_app/domain/entities/quote.dart';
import 'package:meals_app/domain/repository/quote_repository.dart';
import 'package:meals_app/domain/use_cases/get_random_quote.dart';

final quoteRemoteDataSourceProvider = Provider<QuoteRemoteDataSource>((ref) {
  return QuoteRemoteDataSource(client: http.Client());
});

// Repository provider
final quoteRepositoryProvider = Provider<QuoteRepository>((ref) {
  return QuoteRepositoryImpl(
      remoteDataSource: ref.watch(quoteRemoteDataSourceProvider));
});

// Random quote provider
// final randomQuoteProvider = FutureProvider<Quote>((ref) async {
//   return ref.watch(quoteRepositoryProvider).getRandomQuote();
// });

final randomQuoteProvider = Provider<GetRandomQuote>((ref) {
  return GetRandomQuote(ref.watch(quoteRepositoryProvider));
});

final randomQuote = FutureProvider<Quote?>((ref) async {
  return ref.watch(randomQuoteProvider).execute();
});
