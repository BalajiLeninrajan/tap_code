import 'package:flutter/material.dart';
import 'package:tap_code/src/controllers/speech_to_text/stt_controller.dart';
import 'package:avatar_glow/avatar_glow.dart';

class RecordingButton extends StatefulWidget {
  const RecordingButton({
    super.key,
    required this.sttController,
  });

  final SttController sttController;

  @override
  State<RecordingButton> createState() => _RecordingButtonState();
}

class _RecordingButtonState extends State<RecordingButton> {
  @override
  Widget build(BuildContext context) {
    return AvatarGlow(
      animate: widget.sttController.isListening,
      duration: Durations.extralong1,
      repeat: true,
      glowColor: Theme.of(context).indicatorColor,
      glowShape: BoxShape.rectangle,
      glowBorderRadius: BorderRadius.circular(24),
      glowRadiusFactor: 0.4,
      child: FloatingActionButton(
        onPressed: () {
          widget.sttController.listen().then(
            (bool exitStatus) {
              setState(() {});
              if (exitStatus) {
                return;
              }
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Error Recording'),
                ),
              );
            },
          );
        },
        child:
            Icon(widget.sttController.isListening ? Icons.mic : Icons.mic_none),
      ),
    );
  }
}
