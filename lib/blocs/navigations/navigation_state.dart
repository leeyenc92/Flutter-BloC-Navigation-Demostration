import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class BottomNavigationState extends Equatable {
  BottomNavigationState([List props = const []]) : super();
}

class CurrentIndexChanged extends BottomNavigationState {
  final int currentIndex;

  CurrentIndexChanged({@required this.currentIndex}) : super([currentIndex]);

  @override
  List<String> get props => ['Page Loading!!'];
}

class PageLoading extends BottomNavigationState {
  @override
  List<String> get props => ['Page Loading!!'];
}

class HomepageLoaded extends BottomNavigationState {
  final String text;

  HomepageLoaded({@required this.text}) : super([text]);

  @override
  List<String> get props => ['HomePage Loaded!!'];
}

class AboutMeLoaded extends BottomNavigationState {
  final int number;

  AboutMeLoaded({@required this.number}) : super([number]);

  @override
  List<String> get props => ['Page Loaded!! . $number'];
}
