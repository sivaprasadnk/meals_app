import 'package:flutter/material.dart';

class LoadingCategories extends StatelessWidget {
  const LoadingCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      runSpacing: 5,
      crossAxisAlignment: WrapCrossAlignment.start,
      children: [
        1,
        1,
        1,
        1,
        5,
        1,
        1,
        1,
        1,
      ]
          .map(
            (e) => Container(
              width: 120,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(12),
              ),
                
            ),
          )
          .toList(),
    );
  }
}
