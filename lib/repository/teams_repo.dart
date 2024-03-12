import 'package:keep_learning/model/teams.dart';
import 'package:keep_learning/service/api_service.dart';

class TeamsRepository{
  final ApiService _apiService = ApiService();
  Future<List<Teams>> getTeams(String strSport, String country) async {
    try {
      Map<String, dynamic> response =
          await _apiService.fetchData('search_all_teams.php?s=$strSport&c=$country');
      return TeamsModel.fromJson(response).teams ?? [];
    } catch (error) {
      throw 'Something wrong';
    }
  }
}