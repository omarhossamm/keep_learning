class CountryModel {
  List<Countries>? countries;

  CountryModel({this.countries});

  CountryModel.fromJson(Map<String, dynamic> json) {
    if (json['countries'] != null) {
      countries = <Countries>[];
      json['countries'].forEach((v) {
        countries!.add(Countries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (countries != null) {
      data['countries'] = countries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Countries {
  String? nameEn;

  Countries({this.nameEn});

  Countries.fromJson(Map<String, dynamic> json) {
    nameEn = json['name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name_en'] = nameEn;
    return data;
  }
}