import 'package:flutter/material.dart';
import 'package:flurry_navigation/flurry_navigation.dart';

final menuScreenKey = new GlobalKey(debugLabel: 'MenuScreen');

class EssentialMenu extends StatefulWidget {
  final Menu menu;
  final Function(String) onMenuItemSelected;
  final Color bgColor;
  EssentialMenu({
    this.menu,
    this.onMenuItemSelected,
    this.bgColor,
  }) : super(key: menuScreenKey);
  @override
  createState() {
    return new CustomRadioState();
  }
}

class CustomRadioState extends State<EssentialMenu> {
  List<RadioModel> sampleData = new List<RadioModel>();

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < widget.menu.items.length; ++i) {
      sampleData.add(new RadioModel(
        widget.menu.items[i].isSelected,
        widget.menu.items[i].icon,
        widget.menu.items[i].id,
        widget.menu.items[i].selectedBtnColor,
        widget.menu.items[i].disabledBtnColor,
        widget.menu.items[i].selectedShadowColor,
        widget.menu.items[i].disabledShadowColor,
        widget.menu.items[i].btnShape,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new FlurryNavigationMenuController(
        builder: (BuildContext context, MenuController menuController) {
      return new Scaffold(
        backgroundColor: widget.bgColor,
        body: FractionallySizedBox(
          heightFactor: 0.69,
          widthFactor: 0.3,
          child: ListView.builder(
            itemCount: sampleData.length,
            itemBuilder: (BuildContext context, int index) {
              return new InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  widget.onMenuItemSelected(sampleData[index].id);
                  setState(() {
                    sampleData.forEach((element) => element.isSelected = false);
                    sampleData[index].isSelected = true;
                  });
                  menuController.close();
                },
                child: new RadioItem(sampleData[index]),
              );
            },
          ),
        ),
      );
    });
  }
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;
  RadioItem(this._item);
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.all(15.0),
      child: new Center(
        child: new Container(
          alignment: Alignment.center,
          height: 60.0,
          width: 60.0,
          child: FractionallySizedBox(
            heightFactor: 0.7,
            widthFactor: 0.7,
            child: IconButton(
              icon: Image.asset(_item.icon),
            ),
          ),
          decoration: new BoxDecoration(
            color: _item.isSelected
                ? _item.selectedBtnColor
                : _item.disabledBtnColor,
            border: new Border.all(width: 1.0, color: Colors.transparent),
            shape: _item.btnShape,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: _item.isSelected
                      ? _item.selectedShadowColor
                      : _item.disabledShadowColor,
                  offset: Offset(0, 5.0),
                  blurRadius: 5.0,
                  spreadRadius: 1),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItem {
  final bool isSelected;
  final String icon;
  final String id;
  final Color selectedBtnColor;
  Color disabledBtnColor;
  Color selectedShadowColor;
  Color disabledShadowColor;
  BoxShape btnShape;

  MenuItem(
      {this.icon,
      this.id,
      this.isSelected,
      this.selectedBtnColor,
      this.disabledBtnColor = Colors.transparent,
      this.selectedShadowColor = Colors.blueGrey,
      this.disabledShadowColor = Colors.transparent,
      this.btnShape = BoxShape.circle});
}

class RadioModel {
  bool isSelected;
  final String icon;
  final String id;
  final Color selectedBtnColor;
  final Color disabledBtnColor;
  final Color selectedShadowColor;
  final Color disabledShadowColor;
  final BoxShape btnShape;
  RadioModel(
      this.isSelected,
      this.icon,
      this.id,
      this.selectedBtnColor,
      this.disabledBtnColor,
      this.selectedShadowColor,
      this.disabledShadowColor,
      this.btnShape);
}

class Menu {
  final List<MenuItem> items;

  Menu({
    this.items,
  });
}
