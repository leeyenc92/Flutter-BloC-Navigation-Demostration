import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:portfolio2/blocs/navigations/navigation.dart';

abstract class BottomNavigationEvent extends Equatable {
  BottomNavigationEvent([List props = const []]) : super();
}

class AppStarted extends BottomNavigationEvent {
  @override
  List<String> get props => ['check'];
}

class PageTapped extends BottomNavigationEvent {
  final int index;

  PageTapped({@required this.index}) : super([index]);

  @override
  List<String> get props => ['Check this! .$index'];
}
