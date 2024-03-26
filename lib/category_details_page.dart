import 'package:flutter/material.dart';
import 'models/list.dart';

class CategoryDetailsPage extends StatelessWidget {
  final CategoryM category;

  const CategoryDetailsPage({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(category.iconPath), // Display category icon
            const SizedBox(height: 20),
            Text(
              'Details for ${category.name}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'You can display more details about ${category.name} here.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
