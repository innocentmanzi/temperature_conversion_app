import 'package:flutter/material.dart';

void main() {
  runApp(const TemperatureConverterApp());
}

class TemperatureConverterApp extends StatelessWidget {
  const TemperatureConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature Conversion',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TemperatureConverter(),
    );
  }
}

class TemperatureConverter extends StatefulWidget {
  const TemperatureConverter({super.key});

  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  final TextEditingController _controller = TextEditingController();
  double? _convertedValue;
  final List<String> _history = [];
  String _unitFrom = 'Celsius';
  String _unitTo = 'Fahrenheit';

  void _convert() {
    final inputValue = double.tryParse(_controller.text);
    if (inputValue == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please enter a valid number'),
      ));
      return;
    }

    double convertedValue;
    String conversionString;

    if (_unitFrom == 'Celsius' && _unitTo == 'Fahrenheit') {
      convertedValue = (inputValue * 9 / 5) + 32;
      conversionString =
          'C to F: $inputValue => ${convertedValue.toStringAsFixed(2)}';
    } else if (_unitFrom == 'Fahrenheit' && _unitTo == 'Celsius') {
      convertedValue = (inputValue - 32) * 5 / 9;
      conversionString =
          'F to C: $inputValue => ${convertedValue.toStringAsFixed(2)}';
    } else {
      convertedValue = inputValue;
      conversionString =
          '$inputValue $_unitFrom is equal to ${convertedValue.toStringAsFixed(2)} $_unitTo';
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
        title: const Text('Temperature Conversion'),
      ),
      body: Container(
        color: const Color(0xFFD1D1D1),
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Enter temperature',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Units From',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: const Text('Celsius'),
                          leading: Radio<String>(
                            value: 'Celsius',
                            groupValue: _unitFrom,
                            onChanged: (value) {
                              setState(() {
                                _unitFrom = value!;
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: const Text('Fahrenheit'),
                          leading: Radio<String>(
                            value: 'Fahrenheit',
                            groupValue: _unitFrom,
                            onChanged: (value) {
                              setState(() {
                                _unitFrom = value!;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Units To',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: const Text('Celsius'),
                          leading: Radio<String>(
                            value: 'Celsius',
                            groupValue: _unitTo,
                            onChanged: (value) {
                              setState(() {
                                _unitTo = value!;
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: const Text('Fahrenheit'),
                          leading: Radio<String>(
                            value: 'Fahrenheit',
                            groupValue: _unitTo,
                            onChanged: (value) {
                              setState(() {
                                _unitTo = value!;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _convert,
                child: const Text('Convert'),
              ),
              const SizedBox(height: 16),
              if (_convertedValue != null)
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Converted Value: ${_convertedValue!.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _history.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_history[index]),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
