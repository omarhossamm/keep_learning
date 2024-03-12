class SeasonsModel {
  List<Seasons>? seasons;

  SeasonsModel({this.seasons});

  SeasonsModel.fromJson(Map<String, dynamic> json) {
    if (json['seasons'] != null) {
      seasons = <Seasons>[];
      json['seasons'].forEach((v) {
        seasons!.add(Seasons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (seasons != null) {
      data['seasons'] = seasons!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Seasons {
  String? strSeason;

  Seasons({this.strSeason});

  Seasons.fromJson(Map<String, dynamic> json) {
    strSeason = json['strSeason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['strSeason'] = strSeason;
    return data;
  }
}
