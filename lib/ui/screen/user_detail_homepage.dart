import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todaapplication/data/entitiy/users.dart';
import 'package:todaapplication/ui/cubit/user_detail_cubit.dart';

class UserDetailPage extends StatefulWidget {
  Users user;
  UserDetailPage({required this.user});

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  var tfUserName = TextEditingController();
  var tfUserId = TextEditingController();
  @override
  void initState() {
    super.initState();
    var user = widget.user;
    tfUserName.text = user.user_name;
    tfUserId.text = user.user_id.toString();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Details"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfUserName,decoration: const InputDecoration(hintText: "User name"),),
              TextField(controller: tfUserId,decoration: const InputDecoration(hintText: "User Id"),),
              ElevatedButton(onPressed: (){
                context.read<UserDetailCubit>().update(tfUserId.hashCode, tfUserName.text);
              }, child: const Text("Updated")),
            ],
          ),
        ),
      ),
    );
  }
}