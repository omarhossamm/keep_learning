import 'package:keep_learning/model/teams.dart';
import 'package:keep_learning/repository/teams_repo.dart';

class TeamsViewModel {
  final TeamsRepository _teamsRepository = TeamsRepository();
  List<Teams> teamsList = [];
  List<Teams> originalTeamsList = [];
  bool isApiCalled = false;
  Future<dynamic> getTeams(String strSport, String country) async {
    try {
      teamsList = await _teamsRepository.getTeams(strSport, country);
      originalTeamsList = teamsList;
    } catch (error) {
      throw 'Something wrong';
    }
  }

  void getTeamsWithSearch(String value) {
    if (value.isNotEmpty) {
      teamsList = originalTeamsList
          .where((element) =>
              element.strTeam!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    } else {
      teamsList = originalTeamsList;
    }
  }
}
