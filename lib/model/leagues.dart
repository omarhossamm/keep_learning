class LeaguesModel {
  List<Leagues>? countries;

  LeaguesModel({this.countries});

  LeaguesModel.fromJson(Map<String, dynamic> json) {
    if (json['countries'] != null) {
      countries = <Leagues>[];
      json['countries'].forEach((v) {
        countries!.add(Leagues.fromJson(v));
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

class Leagues {
  String? idLeague;
  String? idSoccerXML;
  String? idAPIfootball;
  String? strSport;
  String? strLeague;
  String? strLeagueAlternate;
  String? intDivision;
  String? idCup;
  String? strCurrentSeason;
  String? intFormedYear;
  String? dateFirstEvent;
  String? strGender;
  String? strCountry;
  String? strWebsite;
  String? strFacebook;
  String? strInstagram;
  String? strTwitter;
  String? strYoutube;
  String? strRSS;
  String? strDescriptionEN;
  String? strDescriptionDE;
  String? strDescriptionFR;
  String? strDescriptionIT;
  String? strDescriptionCN;
  String? strDescriptionJP;
  String? strDescriptionRU;
  String? strDescriptionES;
  String? strDescriptionPT;
  String? strDescriptionSE;
  String? strDescriptionNL;
  String? strDescriptionHU;
  String? strDescriptionNO;
  String? strDescriptionPL;
  String? strDescriptionIL;
  String? strTvRights;
  String? strFanart1;
  String? strFanart2;
  String? strFanart3;
  String? strFanart4;
  String? strBanner;
  String? strBadge;
  String? strLogo;
  String? strPoster;
  String? strTrophy;
  String? strNaming;
  String? strComplete;
  String? strLocked;

  Leagues(
      {this.idLeague,
      this.idSoccerXML,
      this.idAPIfootball,
      this.strSport,
      this.strLeague,
      this.strLeagueAlternate,
      this.intDivision,
      this.idCup,
      this.strCurrentSeason,
      this.intFormedYear,
      this.dateFirstEvent,
      this.strGender,
      this.strCountry,
      this.strWebsite,
      this.strFacebook,
      this.strInstagram,
      this.strTwitter,
      this.strYoutube,
      this.strRSS,
      this.strDescriptionEN,
      this.strDescriptionDE,
      this.strDescriptionFR,
      this.strDescriptionIT,
      this.strDescriptionCN,
      this.strDescriptionJP,
      this.strDescriptionRU,
      this.strDescriptionES,
      this.strDescriptionPT,
      this.strDescriptionSE,
      this.strDescriptionNL,
      this.strDescriptionHU,
      this.strDescriptionNO,
      this.strDescriptionPL,
      this.strDescriptionIL,
      this.strTvRights,
      this.strFanart1,
      this.strFanart2,
      this.strFanart3,
      this.strFanart4,
      this.strBanner,
      this.strBadge,
      this.strLogo,
      this.strPoster,
      this.strTrophy,
      this.strNaming,
      this.strComplete,
      this.strLocked});

  Leagues.fromJson(Map<String, dynamic> json) {
    idLeague = json['idLeague'];
    idSoccerXML = json['idSoccerXML'];
    idAPIfootball = json['idAPIfootball'];
    strSport = json['strSport'];
    strLeague = json['strLeague'];
    strLeagueAlternate = json['strLeagueAlternate'];
    intDivision = json['intDivision'];
    idCup = json['idCup'];
    strCurrentSeason = json['strCurrentSeason'];
    intFormedYear = json['intFormedYear'];
    dateFirstEvent = json['dateFirstEvent'];
    strGender = json['strGender'];
    strCountry = json['strCountry'];
    strWebsite = json['strWebsite'];
    strFacebook = json['strFacebook'];
    strInstagram = json['strInstagram'];
    strTwitter = json['strTwitter'];
    strYoutube = json['strYoutube'];
    strRSS = json['strRSS'];
    strDescriptionEN = json['strDescriptionEN'];
    strDescriptionDE = json['strDescriptionDE'];
    strDescriptionFR = json['strDescriptionFR'];
    strDescriptionIT = json['strDescriptionIT'];
    strDescriptionCN = json['strDescriptionCN'];
    strDescriptionJP = json['strDescriptionJP'];
    strDescriptionRU = json['strDescriptionRU'];
    strDescriptionES = json['strDescriptionES'];
    strDescriptionPT = json['strDescriptionPT'];
    strDescriptionSE = json['strDescriptionSE'];
    strDescriptionNL = json['strDescriptionNL'];
    strDescriptionHU = json['strDescriptionHU'];
    strDescriptionNO = json['strDescriptionNO'];
    strDescriptionPL = json['strDescriptionPL'];
    strDescriptionIL = json['strDescriptionIL'];
    strTvRights = json['strTvRights'];
    strFanart1 = json['strFanart1'];
    strFanart2 = json['strFanart2'];
    strFanart3 = json['strFanart3'];
    strFanart4 = json['strFanart4'];
    strBanner = json['strBanner'];
    strBadge = json['strBadge'];
    strLogo = json['strLogo'];
    strPoster = json['strPoster'];
    strTrophy = json['strTrophy'];
    strNaming = json['strNaming'];
    strComplete = json['strComplete'];
    strLocked = json['strLocked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idLeague'] = idLeague;
    data['idSoccerXML'] = idSoccerXML;
    data['idAPIfootball'] = idAPIfootball;
    data['strSport'] = strSport;
    data['strLeague'] = strLeague;
    data['strLeagueAlternate'] = strLeagueAlternate;
    data['intDivision'] = intDivision;
    data['idCup'] = idCup;
    data['strCurrentSeason'] = strCurrentSeason;
    data['intFormedYear'] = intFormedYear;
    data['dateFirstEvent'] = dateFirstEvent;
    data['strGender'] = strGender;
    data['strCountry'] = strCountry;
    data['strWebsite'] = strWebsite;
    data['strFacebook'] = strFacebook;
    data['strInstagram'] = strInstagram;
    data['strTwitter'] = strTwitter;
    data['strYoutube'] = strYoutube;
    data['strRSS'] = strRSS;
    data['strDescriptionEN'] = strDescriptionEN;
    data['strDescriptionDE'] = strDescriptionDE;
    data['strDescriptionFR'] = strDescriptionFR;
    data['strDescriptionIT'] = strDescriptionIT;
    data['strDescriptionCN'] = strDescriptionCN;
    data['strDescriptionJP'] = strDescriptionJP;
    data['strDescriptionRU'] = strDescriptionRU;
    data['strDescriptionES'] = strDescriptionES;
    data['strDescriptionPT'] = strDescriptionPT;
    data['strDescriptionSE'] = strDescriptionSE;
    data['strDescriptionNL'] = strDescriptionNL;
    data['strDescriptionHU'] = strDescriptionHU;
    data['strDescriptionNO'] = strDescriptionNO;
    data['strDescriptionPL'] = strDescriptionPL;
    data['strDescriptionIL'] = strDescriptionIL;
    data['strTvRights'] = strTvRights;
    data['strFanart1'] = strFanart1;
    data['strFanart2'] = strFanart2;
    data['strFanart3'] = strFanart3;
    data['strFanart4'] = strFanart4;
    data['strBanner'] = strBanner;
    data['strBadge'] = strBadge;
    data['strLogo'] = strLogo;
    data['strPoster'] = strPoster;
    data['strTrophy'] = strTrophy;
    data['strNaming'] = strNaming;
    data['strComplete'] = strComplete;
    data['strLocked'] = strLocked;
    return data;
  }
}
