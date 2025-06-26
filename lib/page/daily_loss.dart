import 'package:flutter/material.dart';
import 'package:game_calculator/page/page/daily_loss.dart';

import '../widgets/custom_button.dart';

// Reusable container widget that takes child content
class StyledContainer extends StatelessWidget {
  final Widget child;

  const StyledContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 100),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: child,
    );
  }
}

class ChooseOptionPage extends StatelessWidget {
  const ChooseOptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StyledContainer(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: double.infinity,
                  child: CustomActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const InputPage1()),
                      );
                    },
                    text: "Go to Input 1",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const InputPage2()),
                    );
                  },
                  text: "Go to Input 2",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const InputPage3()),
                    );
                  },
                  text: "Go to Input 3",
                ),
              ),
              const Text(
                '📄 Terms and Conditions',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Effective Date: June 26, 2025',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Page 2 with different content inside fixed container
class InputPage2 extends StatelessWidget {
  const InputPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Input Page 2')),
      body: const Center(
        child: StyledContainer(
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Input Page 2',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}

// Page 3 with different content inside fixed container
class InputPage3 extends StatelessWidget {
  const InputPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Input Page 3')),
      body: const Center(
        child: StyledContainer(
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Input Page 3',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}
