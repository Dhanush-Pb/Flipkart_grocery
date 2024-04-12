import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'wish_bloc_event.dart';
part 'wish_bloc_state.dart';

class WishBlocBloc extends Bloc<WishBlocEvent, WishBlocState> {
  WishBlocBloc() : super(WishBlocInitial()) {
    on<WishBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
