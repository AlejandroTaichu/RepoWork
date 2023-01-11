import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todaapplication/data/entitiy/users.dart';
import 'package:todaapplication/ui/cubit/homepage_cubit.dart';
import 'package:todaapplication/ui/screen/user_detail_homepage.dart';
import 'package:todaapplication/ui/screen/user_registration_homepage.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool doWeSearch = true;
  @override
  void initState() {
    super.initState();
    context.read<HomepageCubit>().updateUsers();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: doWeSearch ?
        TextField(decoration: const InputDecoration(hintText: "Search"),onChanged: (callResult){
          context.read<HomepageCubit>().ara(callResult);
        },) :
        const Text("Users"),
        actions: [
          doWeSearch ?
          IconButton(onPressed: (){
            setState(() {doWeSearch = false;});
            context.read<HomepageCubit>().updateUsers();
          }, icon: const Icon(Icons.clear)) :
          IconButton(onPressed: (){
            setState(() {doWeSearch = true;});
          }, icon: const Icon(Icons.search)),
        ],
      ),
      body: BlocBuilder<HomepageCubit,List<Users>>(
        builder: (context,userList){
          if(userList.isNotEmpty){
            return ListView.builder(
              itemCount: userList.length,//3
              itemBuilder: (context,indeks){//0,1,2
                var user = userList[indeks];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UserDetailPage(user: user)))
                        .then((value) { context.read<HomepageCubit>().updateUsers(); });
                  },
                  child: Card(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text("${user.user_name} - ${user.user_id}"),
                        ),
                        const Spacer(),
                        IconButton(onPressed: (){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("${user.user_name} delete user ??"),
                              action: SnackBarAction(
                                label: "Yes",
                                onPressed: (){
                                  context.read<HomepageCubit>().delete(user.user_id);
                                },
                              ),
                            ),
                          );
                        }, icon: const Icon(Icons.delete_outline,color: Colors.black54,)),
                      ],
                    ),
                  ),
                );
              },
            );
          }else{
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const UserRegistrationPage()))
              .then((value) { context.read<HomepageCubit>().updateUsers(); });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}