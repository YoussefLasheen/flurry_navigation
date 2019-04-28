import 'package:flutter/material.dart';
import 'package:flurry_navigation/flurry_navigation.dart';

final Screen fifthscreen = new Screen(
    contentBuilder: (BuildContext context) {
      return new Center(
        child: new Container(
          height:100.0,
          child: new Padding(
            padding: const EdgeInsets.all(25.0),
            child: new Column(
              children: [
                new Expanded(
                    child: new Center(
                        child: new Text('If you wanna tweak anything in the app this is your place')
                    )
                )
              ],
            ),
          ),
        ),

      );
    }
);