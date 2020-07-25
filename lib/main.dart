import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:portfolio2/repositories/app_repository.dart';
import 'package:portfolio2/blocs/navigations/navigation.dart';
import 'package:portfolio2/ui/app_screen.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocProvider<BottomNavigationBloc>(
      create: (context) => BottomNavigationBloc(
        homepageRepository: HomepageRepository(),
        aboutMeRepository: AboutMeRepository(),
      )..add(AppStarted()),
      child: AppScreen(),
    ));
  }
}
