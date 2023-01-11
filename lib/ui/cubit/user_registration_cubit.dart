import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todaapplication/data/repo/usersdao_repository.dart';

class UserRegistrationCubit extends Cubit<void> {
  UserRegistrationCubit():super(0);

  var krepo = UsersDaoRepository();

  Future<void> save(String user_name, int user_id) async {
    await krepo.save(user_name, user_id);
  }

}