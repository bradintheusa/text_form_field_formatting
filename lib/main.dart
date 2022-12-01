import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter TextFormField'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  late TextEditingController controller;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  _validate(String? value) {
    if (value != null && value!.length == 3) {
      return 'Please enter some text: $value';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Enter some text:',
            ),
            Form(
                key: _formKey,
                child: Padding(
                    padding: EdgeInsets.all(15),
                    child: TextFormField(
                        autovalidateMode: AutovalidateMode.always,
                        validator: (value) => _validate(value),
                        controller: controller,
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 1),
                          ),
                          focusedErrorBorder:  OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.tealAccent, width: 1),
                          ),
                          errorBorder:  OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.orange, width: 1),
                          ),
                        )))),
            Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  'Value ${controller.text}',
                  style: Theme.of(context).textTheme.headline4,
                )),
          ],
        ),
      ),
    );
  }
}
