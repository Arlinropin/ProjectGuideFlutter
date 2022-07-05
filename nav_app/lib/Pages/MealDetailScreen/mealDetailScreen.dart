import 'package:flutter/material.dart';
import 'package:nav_app/DataBase/dummy_data.dart';
import 'package:nav_app/Models/Meal.dart';
import 'package:nav_app/Pages/AppBar/appBar.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  final Function(String) toggleFavorite;
  final Function(String) isFavorite;
  MealDetailScreen(this.toggleFavorite, this.isFavorite);
  Widget buildSectionTitle(BuildContext context, String title) {
    return Container(
        margin: EdgeInsets.all(20),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ));
  }

  Widget buildContainer({required double height, required Widget child}) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: height,
        width: 300,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final Meal meal = DUMMY_MEALS.firstWhere((element) => element.id == mealId);
    return Scaffold(
      appBar: Bars.appBar(meal.title),
      body: LayoutBuilder(builder: (context, constraints) {
        return Column(children: [
          Container(
            height: 150,
            width: double.infinity,
            child: Image.network(
              meal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: constraints.maxHeight - 150,
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    buildSectionTitle(context, 'Ingredients'),
                    buildContainer(
                      height: 200,
                      child: ListView.builder(
                        itemBuilder: ((context, index) {
                          return Card(
                            color: Colors.grey.shade100,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Text(meal.ingredients[index]),
                            ),
                          );
                        }),
                        itemCount: meal.ingredients.length,
                      ),
                    ),
                    buildSectionTitle(context, 'Steps'),
                    buildContainer(
                        height: 400,
                        child: ListView.builder(
                          itemBuilder: ((context, index) => Column(
                                children: [
                                  ListTile(
                                    leading: CircleAvatar(
                                        child: Text('#${index + 1}')),
                                    title: Text(meal.steps[index]),
                                  ),
                                  const Divider()
                                ],
                              )),
                          itemCount: meal.steps.length,
                        ))
                  ]),
            ),
          )
        ]);
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          (isFavorite(meal.id) ? Icons.star : Icons.star_border),
        ),
        onPressed: () {
          toggleFavorite(meal.id);
        },
      ),
    );
  }
}
