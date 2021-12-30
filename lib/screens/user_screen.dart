import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:real_time_chat/models/user.dart';
import 'dart:async';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  final List<User> users = [
    User(online: true, email: 'email@gmail.com', name: 'Miguel', uid: '1'),
    User(online: false, email: 'email@gmail.com', name: 'Jorge', uid: '2'),
    User(online: false, email: 'email@gmail.com', name: 'Chato', uid: '3'),
    User(online: true, email: 'email@gmail.com', name: 'Izamar', uid: '4')
  ];
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Username'),
        ),
        body: SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          onRefresh: _loadUsers,
          header: const WaterDropHeader(
            complete: Icon(Icons.check, color: Colors.blue),
            waterDropColor: Colors.blue,
          ),
          child: _ListViewUsers(users: users),
        )
    );
  }

  void _loadUsers() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }
}

class _ListViewUsers extends StatelessWidget {
  const _ListViewUsers({
    Key? key,
    required this.users,
  }) : super(key: key);

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, index) => UserListTile(users: users[index]),
        separatorBuilder: (_, index) => const Divider(),
        itemCount: users.length
    );
  }
}

class UserListTile extends StatelessWidget {
  const UserListTile({
    Key? key,
    required this.users,
  }) : super(key: key);

  final User users;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(users.name),
      subtitle: Text(users.email),
      onTap: () {
        Navigator.pushNamed(context, 'chat');
      },
      leading: CircleAvatar(
        child: Text(users.name.substring(0, 2).toUpperCase()),
        backgroundColor: Colors.blue[100],
      ),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(99),
            color: users.online ? Colors.green[300] : Colors.red
        ),
      ),
    );
  }
}
