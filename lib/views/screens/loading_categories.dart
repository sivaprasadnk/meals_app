import 'package:flutter/material.dart';

class LoadingCategories extends StatelessWidget {
  const LoadingCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 5.0),
                const Text('Loading..'),
              ],
            ),
          );
        },
      ),
    );
  }
}
