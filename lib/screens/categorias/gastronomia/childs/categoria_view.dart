import 'package:flutter/material.dart';
import 'package:elokyetu/components/meal_item.dart';
import 'package:elokyetu/models/category.dart';
import 'package:elokyetu/models/meal.dart';

class Categorias extends StatelessWidget {
  final List<Meal> meals;

  const Categorias(this.meals);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;
    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Panificação',
          style: TextStyle(
            fontFamily: 'Times New Roman',
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(categoryMeals[index]);
        },
      ),
    );
  }
}
