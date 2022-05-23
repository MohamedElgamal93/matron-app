import 'package:environment/util/constants/colors.dart';
import 'package:environment/util/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum DayMonthPickerType { day, month }
enum _FilterPosition { top, bottom }

class DayMonthPicker extends StatefulWidget {
  final DayMonthPickerType type;
  final Function(String) onChange;

  const DayMonthPicker({Key? key, required this.type, required this.onChange})
      : super(key: key);

  @override
  State<DayMonthPicker> createState() => _DayMonthPickerState();
}

class _DayMonthPickerState extends State<DayMonthPicker> {
  final days = List.generate(31, (index) => "${index + 1}");
  final months = List.generate(12, (index) => "${index + 1}");
  List _pickerList = [];
  late final  FixedExtentScrollController _controller;
  int _index=1;
  @override
  void initState() {
    _controller=FixedExtentScrollController(initialItem: _index);
    _initList();

    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _initList() {
    switch (widget.type) {
      case DayMonthPickerType.day:
        _pickerList = days;
        widget.onChange(_pickerList[1]);
        break;
      case DayMonthPickerType.month:
        _pickerList = months;
        widget.onChange(_pickerList[1]);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.height(context: context, pixels: 80);
    return Stack(
      children: [
        CupertinoPicker(
          // backgroundColor: Colors.red,
          itemExtent: height,
          useMagnifier: true,
          selectionOverlay: const SizedBox(),
          scrollController: _controller,
          children: _pickerList
              .map(
                (item) => Container(
                  color: Colors.transparent,
                  width: double.infinity,
                  height: height,
                  alignment: Alignment.center,
                  child: Text(
                    "$item",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              )
              .toList(),
          onSelectedItemChanged: (selectedIndex) {
            _index=selectedIndex;
            widget.onChange(_pickerList[selectedIndex].toString());
          },
        ),
        Align(
          alignment: Alignment.topCenter,
          child: InkWell(
            onTap: () {
              if(_index>0) {
                _controller.jumpToItem(--_index);
              }
            },
            child: _filterWidget(
              height: height,
              filterPosition: _FilterPosition.top,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: InkWell(
            onTap: (){
              if(_index<_pickerList.length) {
                _controller.jumpToItem(++_index);
              }
            },
            child: _filterWidget(
              height: height,
              filterPosition: _FilterPosition.bottom,
            ),
          ),
        ),
      ],
    );
  }

  Widget _filterWidget(
      {required double height, required _FilterPosition filterPosition}) {
    const FractionalOffset topOffset = FractionalOffset(1.0, 0.0);
    const FractionalOffset bottomOffset = FractionalOffset(1.0, 1.0);
    bool _isTop = filterPosition == _FilterPosition.top;
    return Container(
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ConstColors.whiteColor,
            ConstColors.whiteColor,
            ConstColors.whiteColor.withOpacity(.6),
          ],
          begin: _isTop ? topOffset : bottomOffset,
          end: _isTop ? bottomOffset : topOffset,
          tileMode: TileMode.clamp,
        ),
      ),
    );
  }
}
