import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_testing2/home_screen.dart';
import 'package:widget_testing2/user_model.dart';

void main() {
  testWidgets("Displays list of users", (tester) async {
    final users = [
      User(id: 1, name: "Akshay", email: "akshay@gmail.com"),
    ];

    Future<List<User>> mockfetchUsers() async {


      return Future.delayed(const Duration(seconds: 1) , () => users);
    }

    await tester.pumpWidget(
      MaterialApp(
        home: MyHomePage(
          futureUsers: mockfetchUsers(),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

  await tester.pumpAndSettle();

  expect(find.byType(ListView), findsOneWidget);

expect(find.byType(ListTile), findsNWidgets(users.length));

  for(final user in users) {
    expect(find.text(user.name), findsOneWidget);
    expect(find.text(user.email), findsOneWidget);
  }

  });
}