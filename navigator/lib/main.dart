import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      routes: {
        '/': (context) => UserListPage(),
        '/detail':(context) => const UserDetailPage(),
      },
    );
  }
}



class UserListPage extends StatelessWidget {
  final List<String>_users = ['Michael', 'Rosie', 'Carolina', 'Holger', 'Christofer'];
  UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Users'), centerTitle: true,),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
        child: ListView.builder(
          itemCount: _users.length,
          itemBuilder: ((context, index) {
            final user = _users[index];
            return Card(
              elevation: 8,
              child: ListTile(
                title: Text(user),
                onTap: (){
                  Navigator.of(context).pushNamed('/detail', arguments: user);
                  } ,),
            );
          })),
      ),
    );
  }
}


class UserDetailPage extends StatelessWidget {
  
  const UserDetailPage({ super.key});

  @override
  Widget build(BuildContext context) {
    var user = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text('User $user'), centerTitle: true,),
      body: Center(child: ElevatedButton(
          child: const Text('Back'),
          onPressed: () {
            Navigator.pop(context);
          },)),
    );
  }
}


