import 'package:keep_learning/model/leagues.dart';
import 'package:keep_learning/service/api_service.dart';

class LeaguesRepository {
  final ApiService _apiService = ApiService();
  Future<List<Leagues>> getCountryLeagues(String country) async {
    try {
      Map<String, dynamic> response =
          await _apiService.fetchData('search_all_leagues.php?c=$country');
      return LeaguesModel.fromJson(response).countries ?? [];
    } catch (error) {
      throw 'Something wrong';
    }
  }
}