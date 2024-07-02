import 'package:flutter/material.dart';

void main() {
  runApp(TemperatureConverterApp());
}

class TemperatureConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature Conversion',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TemperatureConverter(),
    );
  }
}

class TemperatureConverter extends StatefulWidget {
  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  String _conversionType = 'F to C';
  final TextEditingController _controller = TextEditingController();
  double? _convertedValue;
  List<String> _history = [];

  void _convert() {
    final inputValue = double.tryParse(_controller.text);
    if (inputValue == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please enter a valid number'),
      ));
      return;
    }

    double convertedValue;
    String conversionString;

    if (_conversionType == 'F to C') {
      convertedValue = ((inputValue - 32) * 5 / 9);
      conversionString =
          'F to C: $inputValue => ${convertedValue.toStringAsFixed(2)}';
    } else {
      convertedValue = ((inputValue * 9 / 5) + 32);
      conversionString =
          'C to F: $inputValue => ${convertedValue.toStringAsFixed(2)}';
    }

    setState(() {
      _convertedValue = convertedValue;
      _history.add(conversionString);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature Conversion'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: const Text('F to C'),
                    leading: Radio<String>(
                      value: 'F to C',
                      groupValue: _conversionType,
                      onChanged: (value) {
                        setState(() {
                          _conversionType = value!;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: const Text('C to F'),
                    leading: Radio<String>(
                      value: 'C to F',
                      groupValue: _conversionType,
                      onChanged: (value) {
                        setState(() {
                          _conversionType = value!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter temperature',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _convert,
              child: Text('Convert'),
            ),
            SizedBox(height: 16),
            if (_convertedValue != null)
              Text(
                'Converted Value: ${_convertedValue!.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20),
              ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _history.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_history[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
