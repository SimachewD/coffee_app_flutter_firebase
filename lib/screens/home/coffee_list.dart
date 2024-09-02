import 'package:coffee_app_firebase/models/coffee.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoffeeList extends StatefulWidget {
  const CoffeeList({super.key});

  @override
  State<CoffeeList> createState() => _CoffeeListState();
}

class _CoffeeListState extends State<CoffeeList> {
  @override
  Widget build(BuildContext context) {
    final coffees = Provider.of<List<Coffee>?>(context);

    // Handle null case gracefully
    if (coffees == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      itemCount: coffees.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.brown[coffees[index].strength!],
            ),
            title: Text(coffees[index].name!),
            subtitle: Text('Takes ${coffees[index].sugar} sugar(s)'),
          ),
        );
      },
    );
  }
}
