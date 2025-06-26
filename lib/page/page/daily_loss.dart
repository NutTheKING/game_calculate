import 'package:flutter/material.dart';
import 'package:game_calculator/page/daily_loss.dart';
import 'package:game_calculator/widgets/custom_button.dart';
// import '../widgets/styled_container.dart'; // Ensure you have this

class InputPage1 extends StatefulWidget {
  const InputPage1({super.key});

  @override
  State<InputPage1> createState() => _InputPage1State();
}

class _InputPage1State extends State<InputPage1> {
  final TextEditingController lossController = TextEditingController();
  final TextEditingController teController = TextEditingController();
  final TextEditingController eventController = TextEditingController();
  final TextEditingController depositController = TextEditingController();

  String result = "";

  final List<int> thresholds = [0, 20, 300, 1000, 5000, 10000, 30000, 100000];
  final List<double> rates = [0.0, 0.5, 1, 2, 3, 5, 8, 10];

  double lookupRate(double loss) {
    double rate = 0;
    for (int i = 0; i < thresholds.length; i++) {
      if (loss >= thresholds[i]) {
        rate = rates[i];
      } else {
        break;
      }
    }
    return rate;
  }

  double roundDown2(double value) {
    return (value * 100).floorToDouble() / 100;
  }

  void updateTotalTE() {
    final double event = double.tryParse(eventController.text) ?? 0;
    final double deposit = double.tryParse(depositController.text) ?? 0;
    final double total = event + deposit;

    teController.text = total.toStringAsFixed(2);

    // Optional: update bonus automatically when TE updates
    calculateBonus();
  }

  void calculateBonus() {
    final double loss = double.tryParse(lossController.text) ?? 0;
    final double te = double.tryParse(teController.text) ?? 0;

    if (loss == 0) {
      setState(() {
        result = "0.00";
      });
      return;
    }

    final double net = loss - te;
    final double rate = lookupRate(loss);
    final double rawBonus = (net / 100) * rate;
    final double finalBonus = roundDown2(rawBonus);

    setState(() {
      result = finalBonus.toStringAsFixed(2);
    });
  }

  @override
  void dispose() {
    lossController.dispose();
    teController.dispose();
    eventController.dispose();
    depositController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Input Page 1')),
      body: Center(
        child: StyledContainer(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: lossController,
                decoration: const InputDecoration(
                  labelText: 'Loss Yesterday',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (_) => calculateBonus(),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: teController,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'T.E receive yesterday (auto)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: eventController,
                decoration: const InputDecoration(
                  labelText: 'Event Received',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (_) => updateTotalTE(),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: depositController,
                decoration: const InputDecoration(
                  labelText: 'Deposit Promotion',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (_) => updateTotalTE(),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: CustomActionButton(
                  onPressed: calculateBonus,
                  text: "Calculate",
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "🎯 Bonus: \$ $result",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
