import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'newsfeed_event.dart';
part 'newsfeed_state.dart';

class NewsfeedBloc extends Bloc<NewsfeedEvent, NewsfeedState> {
  NewsfeedBloc() : super(NewsfeedInitial()) {
    on<NewsfeedEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
