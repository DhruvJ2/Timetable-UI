import 'package:calender_tsec/Models/Theme_model.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'custom_card.dart';
import 'providers/theme_provider.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: Consumer<ThemeModel>(
          builder: (context, ThemeModel themeNotifier, child) {
        return MaterialApp(
          title: 'Calender',
          theme: themeNotifier.isDark ? darkTheme : lightTheme,
          home: MyHome(),
        );
      }),
    );
  }
}

class MyHome extends StatelessWidget {
  MyHome({Key? key}) : super(key: key);

  var colorList = [Colors.red, Colors.teal, Colors.blue];
  var opacityList = const [
    Color.fromRGBO(255, 0, 0, 0.2),
    Color.fromARGB(51, 0, 255, 225),
    Color.fromARGB(51, 0, 153, 255),
  ];

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    var _theme = Theme.of(context);
    var _itemList = <String>['Notificaton', 'One', 'two', 'three', 'four'];
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        backgroundColor: _theme.backgroundColor,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: _size.height * 0.3,
                width: _size.width,
                decoration: BoxDecoration(
                    color: _theme.primaryColor,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(50.0),
                    )),
                child: Stack(
                  children: [
                    Positioned(
                      top: 20.0,
                      right: 20.0,
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: _theme.backgroundColor,
                        ),
                        child: IconButton(
                          color: Colors.blue,
                          onPressed: () {
                            themeNotifier.isDark
                                ? themeNotifier.isDark = false
                                : themeNotifier.isDark = true;
                          },
                          icon: Icon(
                            themeNotifier.isDark
                                ? Icons.dark_mode
                                : Icons.light_mode,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 20.0,
                      left: 20.0,
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: _theme.backgroundColor,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 60.0,
                      left: 20.0,
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 28.0,
                            backgroundImage: NetworkImage(
                                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.dailypioneer.com%2Fuploads%2F2020%2Fstory%2Fimages%2Fbig%2Felon-musk-hires-ai-that--reports-directly--to-him-24-7-2020-02-03.jpg&f=1&nofb=1'),
                          ),
                          Padding(padding: EdgeInsets.only(left: 15.0)),
                          Container(
                            height: 100.0,
                            width: 180.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Hi, John',
                                  style: _theme.textTheme.headline1,
                                ),
                                Text(
                                  'Here is a list of schedlue you need to check...',
                                  style: _theme.textTheme.subtitle1,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                        left: 30.0,
                        bottom: 20.0,
                        child: Container(
                          padding: const EdgeInsets.only(
                            top: 8.0,
                            bottom: 8.0,
                            left: 12.0,
                            right: 8.0,
                          ),
                          height: 33.0,
                          width: 180.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.blue[600],
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isExpanded: true,
                              alignment: AlignmentDirectional.center,
                              borderRadius: BorderRadius.circular(8.0),
                              dropdownColor: Colors.blue[600],
                              // value: _itemList[0],
                              hint: const Text(
                                'Notification',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 1.0,
                                ),
                              ),
                              items: _itemList.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: const Text(
                                    'Notification',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) => {},
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                // height: _size.height * 0.1,
                width: _size.width * 0.9,
                decoration: BoxDecoration(
                  color: _theme.primaryColor,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: DatePicker(
                  DateTime.now(),
                  monthTextStyle: TextStyle(
                    color: _theme.textTheme.headline1!.color,
                    letterSpacing: 1.0,
                  ),
                  dayTextStyle: TextStyle(
                    color: _theme.textTheme.headline1!.color,
                    letterSpacing: 1.0,
                  ),
                  dateTextStyle: TextStyle(
                    color: _theme.textTheme.headline1!.color,
                    letterSpacing: 1.0,
                  ),
                  initialSelectedDate: DateTime.now(),
                  selectionColor: _theme.backgroundColor,
                  selectedTextColor:
                      themeNotifier.isDark ? Colors.white : Colors.black,
                  daysCount: 7,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      right: _size.width * 0.05,
                    ),
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: _theme.primaryColor,
                    ),
                    child: IconButton(
                      color: Colors.blue,
                      onPressed: () {},
                      icon: const Icon(Icons.bar_chart_rounded),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      right: _size.width * 0.05,
                    ),
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: _theme.primaryColor,
                    ),
                    child: IconButton(
                      color: Colors.blue,
                      onPressed: () {},
                      icon: const Icon(Icons.info_outline),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 15.0,
                ),
                child: Container(
                  height: _size.height * 0.6,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, value) {
                        return CustomCard(
                          colorList[value],
                          opacityList[value],
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
