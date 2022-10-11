// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:elokyetu/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  // final Function(Meal) onToggLeFavorite;
  // final bool Function(Meal) isFavorite;
  // const MealDetailScreen(this.onToggLeFavorite, this.isFavorite);

  Widget _createSelectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget _createSectionContainer(Widget child) {
    return Container(
      width: 280,
      height: 170,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _createSelectionTitle(context, 'Tipos mais comum de ${meal.title}'),
            // _createSectionContainer(
            // ListView.builder(
            //   itemCount: meal.tipos.length,
            //   itemBuilder: (ctx, index) {
            //     return Card(
            //       child: Text('meal.tipos.toString()'),
            //       // color: Theme.of(context).backgroundColor,
            //     );
            //   },
            // ),
            // ),
            _createSelectionTitle(context, 'Ingredientes'),
            _createSectionContainer(
              ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(meal.ingredients[index]),
                    ),
                    // ignore: deprecated_member_use
                    color: Theme.of(context).accentColor,
                  );
                },
              ),
            ),
            _createSelectionTitle(context, 'Modo de Preparo'),
            _createSectionContainer(ListView.builder(
                itemCount: meal.stps.length,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('${index + 1}'),
                        ),
                        title: Text(meal.stps[index]), // mostrando os passos
                      ),
                      Divider(),
                    ],
                  );
                }))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.star_border),
        onPressed: () {
          // onToggLeFavorite(meal);
        },
      ),
    );
  }
}
