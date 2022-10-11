// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
 
import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  // const CategoryItem({ Key? key }) : super(key: key);

  final Category category;

  const CategoryItem(this.category);

  void _selectCategory(BuildContext context) {
    // Navigator.of(context).pushNamed(
    //   AppRoutes.CATEGORIES_MEALS,
    //   arguments: category,
    // );
    // Get.to(DetailScreen(category));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          "category.title",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          // style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          // image: DecorationImage(image: NetworkImage(category.url)),
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.5),
              category.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}
