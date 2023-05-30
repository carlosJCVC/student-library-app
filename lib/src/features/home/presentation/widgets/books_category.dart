import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_library_app/src/features/books/domain/entities/entities.dart';
import 'package:student_library_app/src/features/books/presentation/providers/providers.dart';

class BooksCategory extends ConsumerWidget {
  final List<Category> categories;

  const BooksCategory({super.key, required this.categories});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 35,
      margin: const EdgeInsets.only(bottom: 10),
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          final Category category = categories[index];

          return _BookCategoryItem(
            category: category,
            onPressed: () {
              ref.read(categoryProvider.notifier).selectedCategory(category.id);
              if (category.id == -1) {
                ref.read(bookProvider.notifier).loadBooks();
              } else {
                ref.read(bookProvider.notifier).loadByCategory(category.name);
              }
            },
          );
        },
      ),
    );
  }
}

class _BookCategoryItem extends ConsumerStatefulWidget {
  final Category category;
  final VoidCallback? onPressed;

  const _BookCategoryItem({
    required this.category,
    this.onPressed,
  });

  @override
  BookCategoryState createState() => BookCategoryState();
}

class BookCategoryState extends ConsumerState<_BookCategoryItem> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    Color buttonColor = widget.category.selected
        ? const Color.fromARGB(255, 151, 148, 235)
        : const Color.fromRGBO(225, 224, 249, 1.00);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: FilledButton.tonal(
        onPressed: widget.onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(buttonColor),
        ),
        child: Text(
          widget.category.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color:
                widget.category.selected ? colorScheme.surface : Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
