import 'dart:math';

class AboutMeRepository {
  int _data;

  Future<void> fetchData() async {
    await Future.delayed(Duration(milliseconds: 600));
    _data = Random().nextInt(1000);
  }

  int get data => _data;
}
