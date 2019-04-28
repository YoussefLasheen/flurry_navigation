import 'package:flutter/material.dart';
import 'package:example/fifth screen.dart';
import 'package:example/fourth screen.dart';
import 'package:example/third screen.dart';
import 'package:example/second screen.dart';
import 'package:example/first screen.dart';
import 'package:flurry_navigation/flurry_navigation.dart';
import 'package:flurry_navigation/flurry_menu.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  //Decalre active screen var with the the default screen somewhere accesible to the contentScreen attributes
  var activeScreen = firstscreen;
  Widget build(BuildContext context) {
    return new FlurryNavigation(
      // The Icon data of the icon the BottomLeft
      expandIcon: Image.asset("assets/expan1.png"),
      // The size of the icon on the BottomLeft
      iconSize: 50.0,
      // The content of the screen
      contentScreen: activeScreen,
      menuScreen: new MenuScreen(
        bgColor: Color.fromRGBO(121, 134, 203, 1),
        menu: new Menu(
          items: [
            new MenuItem(
                id:'hom', //You can set this to whatever you want but dont duplicate it
                icon:'assets/hom.png', //Set this to the data for the icon of the button
                isSelected: true,
                selectedBtnColor: Color.fromRGBO(38, 198, 218, 1),
                btnShape: BoxShape.rectangle),
            new MenuItem(
                id: 'sta',
                icon: 'assets/sta.png',
                isSelected: false,
                selectedBtnColor: Color.fromRGBO(38, 198, 218, 1),
                btnShape: BoxShape.rectangle),
            new MenuItem(
              id: 'doc',
              icon: 'assets/doc.png',
              isSelected: false,
              selectedBtnColor: Color.fromRGBO(38, 198, 218, 1),
            ),
            new MenuItem(
              id: 'set',
              icon: 'assets/set.png',
              isSelected: false,
              selectedBtnColor: Color.fromRGBO(38, 198, 218, 1),
            ),
          ],
        ),
        onMenuItemSelected: (String itemId) {
          if (itemId == 'hom') {
            setState(() => activeScreen = firstscreen);
          } else if (itemId == 'sta') {
            setState(() => activeScreen = secondscreen);
          } else if (itemId == 'doc') {
            setState(() => activeScreen = thirdscreen);
          } else if (itemId == 'loc') {
            setState(() => activeScreen = fourthscreen);
          } else if (itemId == 'set') {
            setState(() => activeScreen = fifthscreen);
          }
        },
      ),
    );
  }
}
