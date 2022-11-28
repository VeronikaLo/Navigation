import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String? _selectedUser;
  final List<String>_users = ['Michael', 'Rosie', 'Carolina', 'Holger', 'Christofer'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Navigator(
        pages: [
          MaterialPage(
            key: const ValueKey('UserListPage'),
            child: UserListPage(users:_users, onTapped: _handleUserTapped,),
          ),
          if (_selectedUser != null) MaterialPage(
        child: UserDetailPage(user: _selectedUser!),
        key: UserDetailPage.valueKey,) 
        ],

      onPopPage: (route, result) {

        final page = route.settings as MaterialPage;
        if(page.key == UserDetailPage.valueKey){
          _selectedUser = null;
        }
      
        return route.didPop(result);
      },

      ),
    );
  }

  void _handleUserTapped(user) {
    setState(() {
      _selectedUser = user;
    });
  }
}


class UserListPage extends StatelessWidget {

  final List<String> users;
  final ValueChanged<String> onTapped;
  
  const UserListPage({required this.users, required this.onTapped, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Users'), centerTitle: true,),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: ((context, index) {
            final user = users[index];
            return Card(
              elevation: 8,
              child: ListTile(
                title: Text(user),
                onTap: () => onTapped(user) ,),
            );
          })),
      ),
    );
  }
}


class UserDetailPage extends StatelessWidget {
  static const valueKey = ValueKey('UserDetailPage');  // valueKey for the page
  final String user;
  const UserDetailPage({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
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
