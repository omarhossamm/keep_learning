import 'package:keep_learning/model/country.dart';
import 'package:keep_learning/service/api_service.dart';

class CountriesRepository {
  final ApiService _apiService = ApiService();
  Future<List<Countries>> getCountriesName() async {
    try {
      Map<String, dynamic> response =
          await _apiService.fetchData('all_countries.php');
      return CountryModel.fromJson(response).countries ?? [];
    } catch (error) {
      throw 'Something wrong';
    }
  }
}
