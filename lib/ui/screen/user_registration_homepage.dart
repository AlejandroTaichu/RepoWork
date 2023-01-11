import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todaapplication/ui/cubit/user_registration_cubit.dart';

class UserRegistrationPage extends StatefulWidget {
  const UserRegistrationPage({Key? key}) : super(key: key);

  @override
  State<UserRegistrationPage> createState() => _UserRegistrationPageState();
}

class _UserRegistrationPageState extends State<UserRegistrationPage> {
  var tfuserName = TextEditingController();
  var tfuserId = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Registration"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50,right: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfuserName,decoration: const InputDecoration(hintText: "User name"),),
              TextField(controller: tfuserId,decoration: const InputDecoration(hintText: "User Id"),),
              ElevatedButton(onPressed: (){
                context.read<UserRegistrationCubit>().save(tfuserName.text, tfuserId.hashCode);
              }, child: const Text("Save")),
            ],
          ),
        ),
      ),
    );
  }
}