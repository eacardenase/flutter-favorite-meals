import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category'),
        centerTitle: true,
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // how many columns
          childAspectRatio: 3 / 2, // size of each grid element
          crossAxisSpacing: 20, // spacing between the columns
          mainAxisSpacing: 20, // spacing between the rows
        ),
        children: [
          for (final index in List.generate(8, (index) => ++index))
            Center(
              child: Text(
                index.toString(),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            )
        ],
      ),
    );
  }
}
