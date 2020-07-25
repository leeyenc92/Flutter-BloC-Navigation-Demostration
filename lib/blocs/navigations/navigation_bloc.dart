import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:portfolio2/blocs/navigations/navigation_state.dart';

import 'navigation_event.dart';
import 'navigation_state.dart';
import 'package:portfolio2/repositories/homepage_repo.dart';
import 'package:portfolio2/repositories/about-me_repo.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  final HomepageRepository homepageRepository;
  final AboutMeRepository aboutMeRepository;
  int currentIndex = 0;

  BottomNavigationBloc({this.homepageRepository, this.aboutMeRepository})
      : assert(homepageRepository != null),
        assert(aboutMeRepository != null);

  @override
  BottomNavigationState get initialState => PageLoading();

  @override
  Stream<BottomNavigationState> mapEventToState(
      BottomNavigationEvent event) async* {
    if (event is AppStarted) {
      this.add(PageTapped(index: this.currentIndex));
    }
    if (event is PageTapped) {
      this.currentIndex = event.index;
      yield CurrentIndexChanged(currentIndex: this.currentIndex);
      yield PageLoading();

      if (this.currentIndex == 0) {
        String data = await _getHomepageData();
        yield HomepageLoaded(text: data);
      }
      if (this.currentIndex == 1) {
        int data = await _getAboutMeData();
        yield AboutMeLoaded(number: data);
      }
    }
  }

  Future<String> _getHomepageData() async {
    String data = homepageRepository.data;
    if (data == null) {
      await homepageRepository.fetchData();
      data = homepageRepository.data;
    }
    return data;
  }

  Future<int> _getAboutMeData() async {
    int data = aboutMeRepository.data;
    if (data == null) {
      await aboutMeRepository.fetchData();
      data = aboutMeRepository.data;
    }
    return data;
  }
}
