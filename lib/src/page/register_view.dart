import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool? _isAdvisor;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, introduce tu nombre';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, introduce tu email';
    }
    final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegExp.hasMatch(value)) {
      return 'Introduce un email válido';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, introduce tu contraseña';
    }
    if (value.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }
    return null;
  }

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
        'POST',
        Uri.parse('http://3.225.81.121:3000/cliente/crear'),
      );
      request.body = json.encode({
        "id": 1, // Debes ajustar esto según tu lógica de negocio
        "nombre": _nameController.text,
        "email": _emailController.text,
        "password": _passwordController.text,
        "isAdvisor": _isAdvisor
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 201) {
        print(await response.stream.bytesToString());
        Navigator.pushNamed(context, '/dashboard'); // Redirigir a la vista DashboardView
      } else {
        print(response.reasonPhrase);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${response.reasonPhrase}')),
        );
      }
    }
  }

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
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                ),
                validator: _validateName,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                validator: _validateEmail,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  suffixIcon: Icon(Icons.visibility_off),
                ),
                obscureText: true,
                validator: _validatePassword,
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
                onPressed: _register,
                child: Text('Crear cuenta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}