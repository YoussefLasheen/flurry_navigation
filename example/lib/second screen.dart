import 'package:flutter/material.dart';
import 'package:flurry_navigation/flurry_navigation.dart';

final secondscreen = new Screen(
    contentBuilder: (BuildContext context) {
      return new Center(
        child: new Container(
          height: 250,
          child: new Padding(
            padding: const EdgeInsets.all(25.0),
            child: new Column(
              children: [
                new Expanded(
                    child: new Center(
                        child: new Text('Statistics all the time sis')

                    )
                )
              ],
            ),
          ),
        ),

      );
    }
);