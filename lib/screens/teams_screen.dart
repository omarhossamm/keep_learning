import 'package:flutter/material.dart';
import 'package:keep_learning/components/text_field_component.dart';
import 'package:keep_learning/view_model/teams_view_model.dart';

class TeamsScreen extends StatefulWidget {
  final String strSport;
  final String countryName;
  const TeamsScreen(
      {required this.strSport, required this.countryName, super.key});

  @override
  State<TeamsScreen> createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> {
  late TeamsViewModel _teamsViewModel;

  @override
  void initState() {
    _teamsViewModel = TeamsViewModel();

    _teamsViewModel.getTeams(widget.strSport, widget.countryName).then((value) {
      setState(() {
        _teamsViewModel.isApiCalled = true;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teams'),
      ),
      body: SafeArea(
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: _teamsViewModel.isApiCalled
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
                                _teamsViewModel.getTeamsWithSearch(value);
                              });
                            }),
                      ),
                      Expanded(
                        child: ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int i) {
                              return ListTile(
                                title: Text(
                                    _teamsViewModel.teamsList[i].strTeam ?? ''),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const Divider(color: Colors.black54);
                            },
                            itemCount: _teamsViewModel.teamsList.length),
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
