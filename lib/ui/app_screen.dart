import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:portfolio2/blocs/navigations/navigation.dart';
import 'package:portfolio2/ui/pages/about-me.dart';
import 'package:portfolio2/ui/pages/pages.dart';

class AppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BottomNavigationBloc bottomNavigationBloc =
        BlocProvider.of<BottomNavigationBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation with BLoC'),
      ),
      body: BlocBuilder(
        bloc: bottomNavigationBloc,
        builder: (BuildContext context, BottomNavigationState state) {
          if (state is PageLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is HomepageLoaded) {
            return FirstPage(text: state.text);
          }
          if (state is AboutMeLoaded) {
            return SecondPage(number: state.number);
          }
          return Container();
        },
      ),
      bottomNavigationBar: BlocBuilder(
          bloc: bottomNavigationBloc,
          builder: (BuildContext context, BottomNavigationState state) {
            return BottomNavigationBar(
              currentIndex: bottomNavigationBloc.currentIndex,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.black),
                  title: Text('First'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.all_inclusive, color: Colors.black),
                  title: Text('Second'),
                ),
              ],
              onTap: (index) =>
                  bottomNavigationBloc.add(PageTapped(index: index)),
            );
          }),
    );
  }
}
