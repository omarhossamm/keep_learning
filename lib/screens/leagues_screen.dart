import 'package:flutter/material.dart';
import 'package:keep_learning/components/text_field_component.dart';
import 'package:keep_learning/screens/seasons_screen.dart';
import 'package:keep_learning/view_model/leagues_view_model.dart';

class LeaguesScreen extends StatefulWidget {
  final String countryName;
  const LeaguesScreen({required this.countryName, super.key});

  @override
  State<LeaguesScreen> createState() => _LeaguesScreenState();
}

class _LeaguesScreenState extends State<LeaguesScreen> {
  late LeaguesViewModel _leaguesViewModel;

  @override
  void initState() {
    _leaguesViewModel = LeaguesViewModel();

    _leaguesViewModel.getLeaguesName(widget.countryName).then((value) {
      setState(() {
        _leaguesViewModel.isApiCalled = true;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leagues'),
      ),
      body: SafeArea(
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: _leaguesViewModel.isApiCalled
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
                                _leaguesViewModel.getLeaguesNameByValue(value);
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
                                            SeasonsScreen(
                                              leagueId: _leaguesViewModel
                                                      .leaguesList[i]
                                                      .idLeague ??
                                                  '',
                                              strSport: _leaguesViewModel
                                                      .leaguesList[i]
                                                      .strSport ??
                                                  '',
                                              countryName: widget.countryName,
                                            )),
                                  );
                                },
                                title: Text(_leaguesViewModel
                                        .leaguesList[i].strLeague ??
                                    ''),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const Divider(color: Colors.black54);
                            },
                            itemCount: _leaguesViewModel.leaguesList.length),
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
