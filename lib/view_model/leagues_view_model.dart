import 'package:keep_learning/model/leagues.dart';
import 'package:keep_learning/repository/leagues_repo.dart';

class LeaguesViewModel {
  final LeaguesRepository _leaguesRepository = LeaguesRepository();
  List<Leagues> leaguesList = [];
  List<Leagues> originalLeaguesList = [];
  bool isApiCalled = false;
  Future<dynamic> getLeaguesName(String country) async {
    try {
      leaguesList = await _leaguesRepository.getCountryLeagues(country);
      originalLeaguesList = leaguesList;
    } catch (error) {
      throw 'Something wrong';
    }
  }

  void getLeaguesNameByValue(String value) {
    if (value.isNotEmpty) {
      leaguesList = originalLeaguesList
          .where((element) =>
              element.strLeague!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    } else {
      leaguesList = originalLeaguesList;
    }
  }
}
