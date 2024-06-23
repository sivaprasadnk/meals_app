import 'package:meals_app/domain/entities/quote.dart';

class QuoteModel extends Quote {
  QuoteModel({
    required super.id,
    required super.content,
    required super.author,
  });

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      id: json['_id'],
      content: json['content'],
      author: json['author'],
    );
  }
}
