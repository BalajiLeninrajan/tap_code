import 'package:flutter/material.dart';

class BottomControls extends StatelessWidget {
  const BottomControls({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.play_arrow),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.restart_alt),
          )
        ],
      ),
    );
  }
}
