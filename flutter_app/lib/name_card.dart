import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(primaryColor: Colors.blue[10]),
        home: DefaultTabController(
          length: allPalette.length,
          child: Scaffold(
              appBar: AppBar(
                title: Text('Select'),
                bottom: TabBar(
                    isScrollable: true,
                    tabs: allPalette
                        .map((Palette palette) => Tab(
                              text: palette.name,
                            ))
                        .toList()),
              ),
              body: TabBarView(
                  children: allPalette
                      .map((Palette palette) => PaletteTabView(
                            colors: palette,
                          ))
                      .toList())),
        ),
      ),
    );

class PaletteTabView extends StatelessWidget {
  final Palette colors;

  PaletteTabView({Key key, @required this.colors}) : super(key: key);

  static final List<int> primaryKeys = [
    50,
    100,
    200,
    300,
    400,
    500,
    600,
    700,
    800,
    900
  ];
  static final List<int> accentKeys = [100, 200, 400, 700];

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme=Theme.of(context).textTheme;
    final TextStyle themeWhite=textTheme.body1.copyWith(color: Colors.white);
    final TextStyle themeBlack=textTheme.body1.copyWith(color: Colors.black);SafeArea
    Stack(alignment:const Alignment(x, y) ,)
    return ListView(
        itemExtent: 40,
        children: <Widget>[
          ...primaryKeys.map((int i) => DefaultTextStyle(
                style: i>colors.threshold?themeWhite:themeBlack,
                child:Container(child: Text('$i'),decoration: BoxDecoration(color: colors.primary[i]),),
              )),
          if (colors.accent != null)
            ...accentKeys.map((int i) => DefaultTextStyle(
              style: i>colors.threshold?themeWhite:themeBlack,
              child:Container(child: Text('A$i'),decoration: BoxDecoration(color: colors.accent[i]),),
                )).toList()
        ],
    );
  }
}

class Palette {
  Palette({this.name, this.primary, this.accent, this.threshold = 100});

  final String name;
  final MaterialColor primary;
  final MaterialAccentColor accent;
  final int threshold;

  bool get isValid => name != null;
}



final List<Palette> allPalette = [
  Palette(
      name: 'RED',
      primary: Colors.red,
      accent: Colors.redAccent,
      threshold: 300),
  Palette(
      name: 'PINK',
      primary: Colors.pink,
      accent: Colors.pinkAccent,
      threshold: 200),
  Palette(
      name: 'PURPLE',
      primary: Colors.purple,
      accent: Colors.purpleAccent,
      threshold: 200),
  Palette(
      name: 'DEEP PURPLE',
      primary: Colors.deepPurple,
      accent: Colors.deepPurpleAccent,
      threshold: 200),
  Palette(
      name: 'INDIGO',
      primary: Colors.indigo,
      accent: Colors.indigoAccent,
      threshold: 200),
  Palette(
      name: 'BLUE',
      primary: Colors.blue,
      accent: Colors.blueAccent,
      threshold: 400),
  Palette(
      name: 'LIGHT BLUE',
      primary: Colors.lightBlue,
      accent: Colors.lightBlueAccent,
      threshold: 500),
  Palette(
      name: 'CYAN',
      primary: Colors.cyan,
      accent: Colors.cyanAccent,
      threshold: 600),
  Palette(
      name: 'TEAL',
      primary: Colors.teal,
      accent: Colors.tealAccent,
      threshold: 400),
  Palette(
      name: 'GREEN',
      primary: Colors.green,
      accent: Colors.greenAccent,
      threshold: 500),
  Palette(
      name: 'LIGHT GREEN',
      primary: Colors.lightGreen,
      accent: Colors.lightGreenAccent,
      threshold: 600),
  Palette(
      name: 'LIME',
      primary: Colors.lime,
      accent: Colors.limeAccent,
      threshold: 800),
  Palette(name: 'YELLOW', primary: Colors.yellow, accent: Colors.yellowAccent),
  Palette(name: 'AMBER', primary: Colors.amber, accent: Colors.amberAccent),
  Palette(
      name: 'ORANGE',
      primary: Colors.orange,
      accent: Colors.orangeAccent,
      threshold: 700),
  Palette(
      name: 'DEEP ORANGE',
      primary: Colors.deepOrange,
      accent: Colors.deepOrangeAccent,
      threshold: 400),
  Palette(name: 'BROWN', primary: Colors.brown, threshold: 200),
  Palette(name: 'GREY', primary: Colors.grey, threshold: 500),
  Palette(name: 'BLUE GREY', primary: Colors.blueGrey, threshold: 500),
];
