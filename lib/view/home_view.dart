import 'package:auth_ui/utils/utils.dart';
import 'package:auth_ui/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade400,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          40.ph,
          Center(child: Text(message, style: TextStyle(fontSize: 42, fontWeight: FontWeight.w200, color: Colors.grey.shade600),))]),
      drawer: Drawer(child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ListTile(
            onTap: (){
              userViewModel.removeUser(context);
            },
            title: Text('Logout', style: TextStyle(color: Colors.grey.shade500, fontSize: 18)),
            trailing: 
              Icon(Icons.logout_outlined, color: Colors.grey.shade500),
          )
        ],)),
    );
  }
}
