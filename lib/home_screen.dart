import 'package:flutter/material.dart';
import 'package:widget_testing2/user_model.dart';
import 'package:widget_testing2/user_repository.dart';




class MyHomePage extends StatefulWidget {
 


  final Future<List<User>> futureUsers;


  const MyHomePage({super.key, this.title = '', required this.futureUsers});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final UserRepository userRepository = UserRepository();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: FutureBuilder(
          future: widget.futureUsers,
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              final List<User> users = snapshot.data!;

              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context,index) {
                  final user = users[index];
                    return ListTile(
                      title: Text(user.name),
                      subtitle: Text(user.email),
                    );
              });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } return const CircularProgressIndicator();
          },
        ));
  }
}
