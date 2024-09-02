import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app_firebase/models/coffee.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  final db = FirebaseFirestore.instance;

  Future<void> updateUserData(String sugar, String name, int strength) async {
    final coffeePref = {'sugar': sugar, 'name': name, 'strength': strength};

    try {
      return await db.collection("user coffee").doc(uid).set(coffeePref);
    } catch (e) {
      print('Failed to update user data: $e');
    }
  }

  List<Coffee> _coffeeList(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
    final data = doc.data() as Map<String, dynamic>;

    return Coffee(
      name: data['name'] ?? '',
      sugar: data['sugar'] ?? '0',
      strength: data['strength'] ?? 0,
    );
  }).toList();
}

  Stream<List<Coffee>> get userCoffee {
    return db.collection('user coffee').snapshots().map(_coffeeList);
  }
}
