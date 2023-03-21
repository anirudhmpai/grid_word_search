import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final Function(String) gridItemTextChanged;
  final TextEditingController gridItemController;
  final bool shouldGlow;
  const GridItem({
    super.key,
    this.shouldGlow = false,
    required this.gridItemController,
    required this.gridItemTextChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: shouldGlow ? Colors.blueAccent : Colors.blueGrey,
          width: shouldGlow ? 2 : 1,
        ),
      ),
      child: TextField(
        controller: gridItemController,
        onChanged: gridItemTextChanged,
        maxLength: 1,
        keyboardType: TextInputType.text,
        textAlign: TextAlign.center,
        decoration: const InputDecoration(
          border: InputBorder.none,
          counterText: '',
          contentPadding: EdgeInsets.all(5),
          isCollapsed: true,
          isDense: true,
        ),
      ),
    );
  }
}
