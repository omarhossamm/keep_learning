import 'package:flutter/material.dart';
import 'package:keep_learning/components/text_field_component.dart';
import 'package:keep_learning/screens/teams_screen.dart';
import 'package:keep_learning/view_model/seasons_view_model.dart';

class SeasonsScreen extends StatefulWidget {
  final String leagueId;
  final String countryName;
  final String strSport;
  const SeasonsScreen(
      {required this.leagueId,
      required this.countryName,
      required this.strSport,
      super.key});

  @override
  State<SeasonsScreen> createState() => _SeasonsScreenState();
}

class _SeasonsScreenState extends State<SeasonsScreen> {
  late SeasonsViewModel _seasonViewModel;

  @override
  void initState() {
    _seasonViewModel = SeasonsViewModel();

    _seasonViewModel.getSeasons(widget.leagueId).then((value) {
      setState(() {
        _seasonViewModel.isApiCalled = true;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seasons'),
      ),
      body: SafeArea(
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: _seasonViewModel.isApiCalled
                ? Column(
                    children: [
                      const SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5.0),
                        child: TextFieldComponent(
                            hint: 'Search',
                            onChanged: (String value) {
                              setState(() {
                                _seasonViewModel.getSeasonsByLeagueId(value);
                              });
                            }),
                      ),
                      Expanded(
                        child: ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int i) {
                              return ListTile(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                        pageBuilder: (_, __, ___) =>
                                            TeamsScreen(
                                              strSport: widget.strSport,
                                              countryName: widget.countryName,
                                            )),
                                  );
                                },
                                title: Text(
                                    _seasonViewModel.seasonsList[i].strSeason ??
                                        ''),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const Divider(color: Colors.black54);
                            },
                            itemCount: _seasonViewModel.seasonsList.length),
                      )
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  )),
      ),
    );
  }
}
