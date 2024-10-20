import 'dart:ui'; // Required for BackdropFilter
import 'package:flutter/material.dart';

class CurCovMaterialPage extends StatefulWidget {
  const CurCovMaterialPage({super.key});

  @override
  State<CurCovMaterialPage> createState() => _CurCovMaterialPageState();
}

class _CurCovMaterialPageState extends State<CurCovMaterialPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  void convert() {
    if (textEditingController.text.isNotEmpty) {
      result = double.parse(textEditingController.text) * 81; // Example conversion rate
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 109, 185, 202), Color.fromARGB(255, 113, 195, 181)], // Teal to Light Blue gradient
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: const Text(
          'Currency Converter',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.white),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('About this App'),
                  content: const Text(
                    'This app converts USD to INR. Input the amount in USD and hit Convert.',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Close'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE2F1F8), Color(0xFFD5E8F5)], // Soft background gradient
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0), // Blur effect
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5), // Increased opacity for visibility
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(color: Colors.grey.withOpacity(0.16), width: 2), // Thicker and lighter border
                  ),
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Display for the result
                      Text(
                        'INR ${result != 0 ? result.toStringAsFixed(3) : result.toStringAsFixed(0)}',
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Glassmorphism effect for the text field
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3), // Increased opacity for the text field
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(color: Colors.grey.withOpacity(0.16), width: 1.5), // Thicker and lighter border
                            ),
                            child: TextField(
                              controller: textEditingController,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                              decoration: const InputDecoration(
                                hintText: 'Enter Amount in USD',
                                hintStyle: TextStyle(
                                  color: Colors.black54,
                                ),
                                prefixIcon: Icon(
                                  Icons.monetization_on_outlined,
                                  color: Colors.black54,
                                ),
                                filled: false,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                              ),
                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Button with updated styling
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color.fromARGB(255, 109, 185, 202), Color.fromARGB(255, 113, 195, 181)], // Button gradient
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 15.0,
                                offset: Offset(0, 6),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: convert,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              foregroundColor: Colors.white,
                              minimumSize: const Size(double.infinity, 55),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              elevation: 0,
                              shadowColor: Colors.transparent,
                            ),
                            child: const Text(
                              'Convert',
                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
