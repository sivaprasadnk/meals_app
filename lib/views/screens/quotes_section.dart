import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/views/provider/quotes_provider.dart';

class QuotesSection extends ConsumerWidget {
  const QuotesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final randomQuoteAsyncValue = ref.watch(randomQuote);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          randomQuoteAsyncValue.when(
            data: (data) {
              var quot = '" ${data!.content} "';
              var auth = "- ${data.author}";
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    quot,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(auth),
                ],
              );
            },
            loading: () {
              return const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(''),
                  SizedBox(height: 15),
                  Text(''),
                ],
              );
            },
            error: (error, __) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(''),
                  const SizedBox(height: 15),
                  Text('$error'),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
