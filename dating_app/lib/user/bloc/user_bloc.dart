import 'package:dating_app/user/bloc/user_event.dart';
import 'package:dating_app/user/bloc/user_state.dart';
import 'package:dating_app/user/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository})
      : assert(userRepository != null),
        super(UserLoading());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is UserLoad) {
      yield UserLoading();
      try {
        final users = await userRepository.getUser();
        yield UserLoadSuccess(users);
      } catch (_) {
        yield UserOperationFailure();
      }
    }

    if (event is UserCreate) {
      try {
        await userRepository.createUser(event.user);
        final users = await userRepository.getUser();
        yield UserLoadSuccess(users);
      } catch (_) {
        yield UserOperationFailure();
      }
    }

    if (event is UserUpdate) {
      try {
        await userRepository.updateUser(event.user);
        final users = await userRepository.getUser();
        yield UserLoadSuccess(users);
      } catch (_) {
        yield UserOperationFailure();
      }
    }

    if (event is UserDelete) {
      try {
        await userRepository.deleteUser(event.user.id);
        final users = await userRepository.getUser();
        yield UserLoadSuccess(users);
      } catch (_) {
        yield UserOperationFailure();
      }
    }
  }
}
