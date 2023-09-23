import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppClassForState();
}

class _MyAppClassForState extends State<MyApp> {
  double result = 0;
  final TextEditingController userInput = TextEditingController();
  void converterFunc() {
    setState(() {
      result = double.parse(userInput.text) * 287;
    });
  }

  @override
  void dispose() {
    userInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(appBarTheme: const AppBarTheme()),
      home: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text('Currency converter',
                style: TextStyle(
                    color: Color(0xfffbfbfb),
                    fontWeight: FontWeight.bold,
                    fontSize: 24)),
            centerTitle: true,
          ),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: RichText(
                    text: TextSpan(children: [
                      const TextSpan(
                          text: 'Rs.',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent)),
                      TextSpan(
                          text: result.toString(),
                          style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent))
                    ]),
                  )),
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: userInput,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                      hintText: 'Rs.1 = 287',
                      contentPadding: EdgeInsets.symmetric(horizontal: 24),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40)))),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8, bottom: 24),
                child: Text(
                    'Enter the USD amount above to convert it into Rupees',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xc8313131),
                        fontStyle: FontStyle.italic)),
              ),
              TextButton(
                  // style: ButtonStyle(
                  //     foregroundColor: MaterialStatePropertyAll(Colors.yellow)),
                  onPressed: converterFunc,
                  style: const ButtonStyle(
                      foregroundColor: MaterialStatePropertyAll(Colors.white),
                      minimumSize: MaterialStatePropertyAll(Size(150, 50)),
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.blueAccent)),
                  child: const Text(
                    'Convert to PKR',
                  )),
            ],
          ))),
    );
  }
}
