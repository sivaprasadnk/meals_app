import 'package:flutter/material.dart';
import 'package:meals_app/domain/entities/meal_category.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key, required this.categories});
  final List<MealCategory> categories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        spacing: 5,
        runSpacing: 5,
        children: categories
            .map((category) => HoverCategoryItem(category: category))
            .toList(),
      ),
    );
  }
}

class HoverCategoryItem extends StatefulWidget {
  final MealCategory category;

  const HoverCategoryItem({super.key, required this.category});

  @override
  State<HoverCategoryItem> createState() => _HoverCategoryItemState();
}

class _HoverCategoryItemState extends State<HoverCategoryItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      message: widget.category.strCategoryDescription,
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            _isHovered = true;
          });
        },
        onExit: (_) {
          setState(() {
            _isHovered = false;
          });
        },
        child: GestureDetector(
          onTap: () {
            
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 120,
            height: 30,
            decoration: BoxDecoration(
              color: _isHovered ? Colors.blue.shade100 : Colors.white,
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(widget.category.strCategory),
            ),
          ),
        ),
      ),
    );
  }
}
