import 'package:flutter/material.dart';
import 'package:flurry_navigation/flurry_navigation.dart';

final menuScreenKey = new GlobalKey(debugLabel: 'MenuScreen');


class FlurryMenu extends StatefulWidget {
  final SideMenu? menu;
  final Function(String?)? onMenuItemSelected;
  final Color? bgColor;
  final Widget? bottomSection;
  FlurryMenu({
    this.menu,
    this.onMenuItemSelected,
    this.bgColor,
    this.bottomSection
  }) : super(key: menuScreenKey);
  @override
  createState() {
    return new FlurryMenuState();
  }
}

class FlurryMenuState extends State<FlurryMenu> {
  List<RadioModel> sampleData = [];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < widget.menu!.items!.length; ++i) {
      sampleData.add(new RadioModel(
        widget.menu!.items![i].isSelected,
        widget.menu!.items![i].icon,
        widget.menu!.items![i].id,
        widget.menu!.items![i].selectedBtnColor,
        widget.menu!.items![i].disabledBtnColor,
        widget.menu!.items![i].selectedShadowColor,
        widget.menu!.items![i].disabledShadowColor,
        widget.menu!.items![i].btnShape,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: widget.bgColor,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 14,
            child: FlurryNavigationMenuController(
              builder: (BuildContext context, MenuController? menuController) {
                return Row(
                  children: <Widget>[
                    Expanded(
                      flex: 6,
                      child: ListView.builder(
                        padding: EdgeInsets.only(top: 50),
                        itemCount: sampleData.length,
                        itemBuilder: (BuildContext context, int index) {
                          return RadioItem(
                            item: sampleData[index],
                            onSelected: () {
                              widget
                                  .onMenuItemSelected!(sampleData[index].id);
                              setState(() {
                                sampleData.forEach(
                                    (element) => element.isSelected = false);
                                sampleData[index].isSelected = true;
                              });
                              menuController!.close();
                            },
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: Container(),
                      flex: 14,
                    )
                  ],
                );
              },
            ),
          ),
          Expanded(
            child: widget.bottomSection!,
            flex: 6,
          ),
        ],
      ),
    );
  }
}


class RadioItem extends StatelessWidget {
  final RadioModel item;
  final void Function()? onSelected;
  RadioItem({required this.item, required this.onSelected});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(),
        ),
        Expanded(
          flex: 3,
          child: new Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.width * 0.3 * (3 / 5),
            child: FractionallySizedBox(
              heightFactor: 0.6,
              widthFactor: 0.6,
              child: IconButton(
                icon: Image.asset(item.icon!),
                padding: EdgeInsets.all(0),
                onPressed: onSelected,
              ),
            ),
            decoration: new BoxDecoration(
              color: item.isSelected!
                  ? item.selectedBtnColor
                  : item.disabledBtnColor,
              border: new Border.all(width: 1.0, color: Colors.transparent),
              shape: item.btnShape,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: item.isSelected!
                        ? item.selectedShadowColor
                        : item.disabledShadowColor,
                    offset: Offset(0, 5.0),
                    blurRadius: 5.0,
                    spreadRadius: 1),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(),
          flex: 1,
        )
      ],
    );
  }
}

class SideMenuItem {
  final bool? isSelected;
  final String? icon;
  final String? id;
  final Color? selectedBtnColor;
  Color disabledBtnColor;
  Color selectedShadowColor;
  Color disabledShadowColor;
  BoxShape btnShape;

  SideMenuItem(
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
  bool? isSelected;
  final String? icon;
  final String? id;
  final Color? selectedBtnColor;
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

class SideMenu {
  final List<SideMenuItem>? items;

  SideMenu({
    this.items,
  });
}
