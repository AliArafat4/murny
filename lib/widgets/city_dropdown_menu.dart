import 'package:flutter/material.dart';

class CityDropDownMenu extends StatefulWidget {
  const CityDropDownMenu({super.key});

  @override
  State<CityDropDownMenu> createState() => _CityDropDownMenuState();
}

String dropdownvalue = "الرياض";
var items = ["الرياض", "جدة", "الدمام", "الخبر", "رابغ", "جيزان"];

class _CityDropDownMenuState extends State<CityDropDownMenu> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 42),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xff252C63),
        ),
        width: MediaQuery.of(context).size.width / 3,
        height: MediaQuery.of(context).size.height / 16,
        child: DropdownButton(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 400,
              right: MediaQuery.of(context).size.width / 32),
          dropdownColor: const Color(0xff252C63),
          style: const TextStyle(color: Colors.white),
          iconEnabledColor: Colors.white,
          borderRadius: BorderRadius.circular(8),
          value: dropdownvalue,
          icon: const Icon(Icons.keyboard_arrow_down),
          items: items.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(
              () {
                dropdownvalue = newValue!;
              },
            );
          },
        ),
      ),
    );
  }
}
