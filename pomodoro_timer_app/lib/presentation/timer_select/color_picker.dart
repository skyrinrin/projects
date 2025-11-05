// import 'dart:nativewrappers/_internal/vm/lib/ffi_patch.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pomodoro_timer_app/provider/provider.dart';

class ColorPicker extends ConsumerWidget {
  Widget colorPicker(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.only(bottom: 32),
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 360,
      child: Column(
        children: [
          SizedBox(height: 48),

          Container(
            child: Wrap(
              children: [
                colorBox(Color(0xFFB7E9FF), ref),
                colorBox(Color.fromARGB(255, 159, 241, 203), ref),
                colorBox(Color.fromARGB(255, 255, 171, 145), ref),
                colorBox(Color(0xFFB7E9FF), ref),
                colorBox(Color(0xFFB7E9FF), ref),
                colorBox(Color(0xFFB7E9FF), ref),
                colorBox(Color(0xFFB7E9FF), ref),
                colorBox(Color(0xFFB7E9FF), ref),
              ],
            ),
          ),
          // Row(children: [colorBox()]),
          SizedBox(height: 60),
          selectButton(context),
        ],
      ),
    );
  }

  Widget selectButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },

      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFF7B7B7B),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            '選択',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget colorBox(Color color, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(mainColorPickerValueProvider.notifier).selectColor(color);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 8, right: 8),
        width: 80,
        height: 80,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _color = ref.watch(mainColorPickerValueProvider);
    return Container(
      // padding: EdgeInsets.all(0),
      // height: 85,
      // width: 60,
      height: 82,
      child: Column(
        children: [
          Text('カラー', style: TextStyle(fontSize: 20)),
          SizedBox(height: 8),
          GestureDetector(
            onTap: () async {
              await showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.white,
                builder: (context) => colorPicker(context, ref),
              );
            },
            child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(shape: BoxShape.circle, color: _color),
            ),
          ),
        ],
      ),
    );
  }
}
