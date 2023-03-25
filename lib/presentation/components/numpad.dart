import 'package:file_ground_front/presentation/atomic/buttons.dart';
import 'package:file_ground_front/presentation/atomic/texts.dart';
import 'package:flutter/material.dart';

import 'numpadViewer.dart';

class Numpad extends StatefulWidget {
  const Numpad({Key? key}) : super(key: key);

  @override
  State<Numpad> createState() => _NumpadState();
}

class _NumpadState extends State<Numpad> {
  String currentNums = '123';
  bool isError = false;
  void handleNumInput(String num) {
    if (currentNums.length == 6) {
      setState(() {
        isError = true;
      });
      return;
    }
    setState(() {
      currentNums = currentNums + num;
      isError = false;
    });
  }

  void handleRemove() {
    setState(() {
      currentNums = currentNums.substring(0, currentNums.length - 1);
      isError = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          NumpadViewer(
            currentNums: currentNums,
            isError: isError,
          ),
          const Spacer(),
          SizedBox(
            width: 300,
            height: 700,
            child: GridView.count(
              crossAxisCount: 3,
              children: [
                for (int num = 1; num < 10; num += 1)
                  NumpadButton(
                    num: num.toString(),
                    onPressed: () {
                      handleNumInput(num.toString());
                    },
                  ),
                const SizedBox(),
                NumpadButton(
                  num: '0',
                  onPressed: () {
                    handleNumInput('0');
                  },
                ),
                NumpadRemoveButton(
                  onPressed: () {
                    handleRemove();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
