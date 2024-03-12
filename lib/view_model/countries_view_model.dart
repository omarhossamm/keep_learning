import 'package:keep_learning/model/country.dart';
import 'package:keep_learning/repository/countries_repo.dart';

class CountriesViewModel {
  final CountriesRepository _countriesRepository = CountriesRepository();
  List<Countries> countriesList = [];
  List<Countries> originalCountriesList = [];
  bool isApiCalled = false;
  Future<dynamic> getCountriesName() async {
    try {
      countriesList = await _countriesRepository.getCountriesName();
      originalCountriesList = countriesList;
    } catch (error) {
      throw 'Something wrong';
    }
  }

  void getCountriesNameByValue(String value) {
    if (value.isNotEmpty) {
      countriesList = originalCountriesList
          .where((element) =>
              element.nameEn!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    } else {
      countriesList = originalCountriesList;
    }
  }
}
