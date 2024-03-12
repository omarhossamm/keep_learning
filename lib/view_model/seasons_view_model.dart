import 'package:keep_learning/model/seasons.dart';
import 'package:keep_learning/repository/seasons_repo.dart';

class SeasonsViewModel {
  final SeasonsRepository _seasonRepository = SeasonsRepository();
  List<Seasons> seasonsList = [];
  List<Seasons> originalSeasonsList = [];
  bool isApiCalled = false;
  Future<dynamic> getSeasons(String leagueId) async {
    try {
      seasonsList = await _seasonRepository.getSeasons(leagueId);
      originalSeasonsList = seasonsList;
    } catch (error) {
      throw 'Something wrong';
    }
  }

  void getSeasonsByLeagueId(String value) {
    if (value.isNotEmpty) {
      seasonsList = originalSeasonsList
          .where((element) =>
              element.strSeason!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    } else {
      seasonsList = originalSeasonsList;
    }
  }
}
