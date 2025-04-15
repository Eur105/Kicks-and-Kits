import 'package:flutter/material.dart';

class TrackOrderScreen extends StatefulWidget {
  final String orderId;
  final int currentStep;

  const TrackOrderScreen({
    Key? key,
    required this.orderId,
    required this.currentStep,
  }) : super(key: key);

  @override
  _TrackOrderScreenState createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text(
          'Track Order',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Order ID: ${widget.orderId}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Stepper(
              currentStep: widget.currentStep,
              controlsBuilder: (context, details) {
                return const SizedBox();
              },
              steps: [
                Step(
                  title: const Text("Order Placed"),
                  content: const Text(
                    "Your order has been placed successfully.",
                  ),
                  isActive: widget.currentStep >= 0,
                  state:
                      widget.currentStep > 0
                          ? StepState.complete
                          : StepState.indexed,
                ),
                Step(
                  title: const Text("Shipped"),
                  content: const Text("Your order has been shipped."),
                  isActive: widget.currentStep >= 1,
                  state:
                      widget.currentStep > 1
                          ? StepState.complete
                          : StepState.indexed,
                ),
                Step(
                  title: const Text("Out for Delivery"),
                  content: const Text("Your order is on its way."),
                  isActive: widget.currentStep >= 2,
                  state:
                      widget.currentStep > 2
                          ? StepState.complete
                          : StepState.indexed,
                ),
                Step(
                  title: const Text("Delivered"),
                  content: const Text("Your order has been delivered."),
                  isActive: widget.currentStep >= 3,
                  state:
                      widget.currentStep == 3
                          ? StepState.complete
                          : StepState.indexed,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
