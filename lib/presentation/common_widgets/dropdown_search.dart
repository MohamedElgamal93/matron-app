import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../util/constants/colors.dart';

class DropDownSearch<T> extends StatelessWidget {
  String? hint;
 bool? showUnbderLine;
  List<T> items;

  DropDownSearch(
      {Key? key, required this.hint, required this.items,this.showUnbderLine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
     
          DropdownSearch<T>(
              mode: Mode.MENU,
           
              items: items,
              hint: hint,
              popupElevation:3,
              showSearchBox: true,
      dropdownSearchDecoration: const InputDecoration(
        hintStyle: TextStyle(fontSize: 11),
      
                border: OutlineInputBorder(
                  borderSide:BorderSide.none
                  ),
              ),
              onChanged: print,

             
            
          ),
          showUnbderLine==true ?
          const Divider(thickness:1.0,color:ConstColors.borderColors):const SizedBox()

        ],
      ),
    );
  }
}
