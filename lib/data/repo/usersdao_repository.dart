import 'package:todaapplication/data/entitiy/users.dart';

class UsersDaoRepository {
  Future<void> save(String user_name,int user_id) async {
    print("Kişi Kaydet : $user_name - $user_id");
  }

  Future<void> update(int kisi_id,String kisi_ad,) async {
    print("Kişi Güncelle : $kisi_id - $kisi_ad - ");
  }

  Future<List<Users>> updateUsers() async {
    var userLists = <Users>[];
    var k1 = Users(user_id: 1, user_name: "Alihan");
    var k2 = Users(user_id: 2, user_name: "Ali");
    userLists.add(k1);
    userLists.add(k2);
    return userLists;
  }

  Future<List<Users>> ara(String aramaKelimesi) async {
    var usersList = <Users>[];
    var k1 = Users(user_id: 1, user_name: "Alejandro");
    usersList.add(k1);
    return usersList;
  }

  Future<void> delete(int user_id) async {
    print("Delete users : $user_id");
  }
}