import 'package:meals_app/data/data_sources/quote_remote_data_source.dart';
import 'package:meals_app/domain/entities/quote.dart';
import 'package:meals_app/domain/repository/quote_repository.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  final QuoteRemoteDataSource remoteDataSource;

  QuoteRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Quote> getRandomQuote() async {
    final quoteModel = await remoteDataSource.getRandomQuote();
    return Quote(
      id: quoteModel.id,
      content: quoteModel.content,
      author: quoteModel.author,
    );
  }
}
