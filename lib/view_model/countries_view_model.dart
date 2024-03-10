import 'package:keep_learning/model/country.dart';
import 'package:keep_learning/repository/countries_repo.dart';

class CountriesViewModel {
  final CountriesRepository _countriesRepository = CountriesRepository();
  List<Countries> countriesList = [];
  bool isApiCalled = false;
  Future<dynamic> getCountriesName() async {
    try {
      countriesList = await _countriesRepository.getCountriesName();
      isApiCalled = true;
    } catch (error) {
      throw 'Something wrong';
    }
  }
}
