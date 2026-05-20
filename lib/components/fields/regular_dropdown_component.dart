import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:varindo_estate_management/components/texts/main_text_component.dart';
import 'package:varindo_estate_management/utils/utils.dart';

typedef MenuEntry = DropdownMenuEntry<String>;

class RegularDropdownComponent extends StatelessWidget {

  const RegularDropdownComponent({ super.key, required this.label, required this.hint, required this.controller,
  required this.valueList });

  final TextEditingController controller;
  final List<String> valueList;
  final String label;
  final String hint;
  

  @override
  Widget build(BuildContext context) {

    final List<MenuEntry> menuEntries = UnmodifiableListView<MenuEntry>(
      valueList.map<MenuEntry>((String name) => MenuEntry(
        value: name, 
        label: name,
      )),
    );
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTextComponent(text: label, fontSize: 12, fontWeight: FontWeight.w500),
        const SizedBox(height: 6,),
        DropdownMenu<String>(
          leadingIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 6,
                height: 48,
                decoration: BoxDecoration(
                  color: HexColor.fromHex(kPrimaryColor),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8)
                  )
                ),
              ),
            ],
          ),
          width: constantScreenWidth,
          hintText: hint,
          controller: controller,
          inputDecorationTheme: InputDecorationTheme(
            prefixIconConstraints: const BoxConstraints(
              minWidth: 12,
              minHeight: 0,
            ),
            contentPadding: const EdgeInsets.all(8),
            filled: true,
            fillColor: Colors.transparent,
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                width: 0.5
              )
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                width: 0.5
              )
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                width: 0.5
              )
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            errorStyle: const TextStyle(
              fontSize: 14,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: HexColor.fromHex(kPrimaryColor))
            ),
          ),
          dropdownMenuEntries: menuEntries,
          initialSelection: null,
          menuStyle: MenuStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.white),
            
          ),
          onSelected: (String? value) {
            if(value!.isNotEmpty) {
              controller.text = value;
            }
          },
        ),
      ],
    );
  }
}