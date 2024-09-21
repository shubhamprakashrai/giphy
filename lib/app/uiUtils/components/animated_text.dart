import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:giphyapp/app/utils/app_constant/app_extension.dart';

class AnimatedTextWithPersistence extends StatefulWidget {
  final String displayName;
  final String username;

  const AnimatedTextWithPersistence({super.key, required this.displayName, required this.username});

  @override
  State<AnimatedTextWithPersistence> createState() => _AnimatedTextWithPersistenceState();
}

class _AnimatedTextWithPersistenceState extends State<AnimatedTextWithPersistence> {
  bool _showLastText = false;

  @override
  Widget build(BuildContext context) {
    if(_showLastText){
      return Text(widget.displayName, style: const TextStyle().white.s14.w7.ellipsis);
    }
    return AnimatedTextKit(
      onFinished: () {
        setState(() {
          _showLastText = true;
        });
      },
      animatedTexts: [
        RotateAnimatedText(
          widget.displayName,
          textStyle: const TextStyle().white.s14.w7.ellipsis
        ),
        RotateAnimatedText(
          widget.username,
          textStyle: const TextStyle().white.s14.w7.ellipsis
        ),
      ],
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_showLastText) {
      // Display the last text after animations complete
      Future.delayed(Duration.zero, () {
        setState(() {
          _showLastText = false; // Reset to false to enable animations again if needed
        });
      });
    }
  }
}
