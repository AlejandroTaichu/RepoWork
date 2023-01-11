import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todaapplication/data/entitiy/users.dart';
import 'package:todaapplication/data/repo/usersdao_repository.dart';

class HomepageCubit extends Cubit<List<Users>> {
  HomepageCubit():super(<Users>[]);

  var krepo = UsersDaoRepository();

  Future<void> updateUsers() async {
    var list = await krepo.updateUsers();
    emit(list);
  }

  Future<void> ara(String searchUsers) async {
    var list = await krepo.ara(searchUsers);
    emit(list);
  }

  Future<void> delete(int kisi_id) async {
    await krepo.delete(kisi_id);
    await updateUsers();
  }
}