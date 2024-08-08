import 'package:flutter/material.dart';

class LLMResultCard extends StatelessWidget {
  const LLMResultCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.secondary,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: true
            ? SingleChildScrollView(
                child: Text(
                  'Card 2',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontSize: 24,
                  ),
                ),
              )
            // ignore: dead_code
            : Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.onSecondary,
                  strokeWidth: 2,
                ),
              ),
      ),
    );
  }
}
