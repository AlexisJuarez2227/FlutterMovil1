import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool? _isAdvisor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('EcoFinance'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Nombre',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Contraseña',
                suffixIcon: Icon(Icons.visibility_off),
              ),
              obscureText: true,
            ),
            Row(
              children: <Widget>[
                Text('¿Eres un asesor?'),
                Spacer(),
                Radio<bool>(
                  value: true,
                  groupValue: _isAdvisor,
                  onChanged: (bool? value) {
                    setState(() {
                      _isAdvisor = value;
                    });
                  },
                ),
                Text('Sí'),
                Radio<bool>(
                  value: false,
                  groupValue: _isAdvisor,
                  onChanged: (bool? value) {
                    setState(() {
                      _isAdvisor = value;
                    });
                  },
                ),
                Text('No'),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                // Handle registration logic
              },
              child: Text('Crear cuenta'),
            ),
          ],
        ),
      ),
    );
  }
}
