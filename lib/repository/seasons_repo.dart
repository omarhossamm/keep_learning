import 'package:keep_learning/model/seasons.dart';
import 'package:keep_learning/service/api_service.dart';

class SeasonsRepository{
  final ApiService _apiService = ApiService();
  Future<List<Seasons>> getSeasons(String leagueId) async {
    try {
      Map<String, dynamic> response =
          await _apiService.fetchData('search_all_seasons.php?id=$leagueId');
      return SeasonsModel.fromJson(response).seasons ?? [];
    } catch (error) {
      throw 'Something wrong';
    }
  }
}