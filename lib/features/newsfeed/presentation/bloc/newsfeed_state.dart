part of 'newsfeed_bloc.dart';

abstract class NewsfeedState extends Equatable {
  const NewsfeedState();  

  @override
  List<Object> get props => [];
}
class NewsfeedInitial extends NewsfeedState {}
