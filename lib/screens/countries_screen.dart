import 'package:flutter/material.dart';
import 'package:keep_learning/components/text_field_component.dart';
import 'package:keep_learning/screens/leagues_screen.dart';
import 'package:keep_learning/view_model/countries_view_model.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({super.key});

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  late CountriesViewModel _countriesViewModel;

  @override
  void initState() {
    _countriesViewModel = CountriesViewModel();

    _countriesViewModel.getCountriesName().then((value) {
      setState(() {
        _countriesViewModel.isApiCalled = true;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countries'),
      ),
      body: SafeArea(
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: _countriesViewModel.isApiCalled
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
                                _countriesViewModel
                                    .getCountriesNameByValue(value);
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
                                            LeaguesScreen(
                                              countryName: _countriesViewModel
                                                      .countriesList[i]
                                                      .nameEn ??
                                                  '',
                                            )),
                                  );
                                },
                                title: Text(_countriesViewModel
                                        .countriesList[i].nameEn ??
                                    ''),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const Divider(color: Colors.black54);
                            },
                            itemCount:
                                _countriesViewModel.countriesList.length),
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
