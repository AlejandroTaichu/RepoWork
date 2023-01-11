import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todaapplication/data/repo/usersdao_repository.dart';

class UserDetailCubit extends Cubit<void> {
  UserDetailCubit():super(0);

  var krepo = UsersDaoRepository();

  Future<void> update(int user_id,String user_name) async {
    await krepo.update(user_id, user_name);
  }
}