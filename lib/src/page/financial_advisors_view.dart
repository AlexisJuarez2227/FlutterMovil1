import 'package:flutter/material.dart';

class FinancialAdvisorsView extends StatelessWidget {
  const FinancialAdvisorsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFBEBF8F),
        title: const Text(
          '¡Te damos la bienvenida!',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
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
            TextField(
              decoration: InputDecoration(
                hintText: 'Buscar asesor',
                hintStyle: const TextStyle(color: Colors.black),
                prefixIcon: const Icon(Icons.search, color: Colors.black),
                filled: true,
                fillColor: const Color(0xFFD4D4A3),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Resultados',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _advisorCard(
                    context,
                    'Laura Martínez',
                    'Especialista en planificación financiera personal y empresarial con más de 10 años de experiencia ayudando a clientes a alcanzar sus objetivos financieros.',
                    '10 años',
                    '150 por asesoría',
                    'lib/src/img/retrato-mujer-joven-sonriente-aislada-sobre-fondo-blanco 2 (1).png',
                  ),
                  _advisorCard(
                    context,
                    'Javier González',
                    'Consultor financiero con amplia experiencia en la creación de estrategias financieras para individuos y pequeñas empresas. Especialista en la optimización de recursos y la inversión del patrimonio.',
                    '12 años',
                    '200 por asesoría',
                    'lib/src/img/Image.png',
                  ),
                  _advisorCard(
                    context,
                    'Ana Rodríguez',
                    'Asesora en planificación financiera con un enfoque integral que incluye seguros, inversiones y jubilación. Ayuda a sus clientes a establecer y alcanzar metas financieras a largo plazo.',
                    '8 años',
                    '180 por asesoría',
                    'lib/src/img/retrato-mujer-joven-sonriente-aislada-sobre-fondo-blanco.png',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _advisorCard(
    BuildContext context,
    String name,
    String description,
    String experience,
    String fee,
    String imageUrl,
  ) {
    return Card(
      color: const Color(0xFFD4D4A3),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(imageUrl),
        ),
        title: Text(
          'Planificación Financiera\n$name',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Text(description),
            const SizedBox(height: 5),
            Text('Experiencia: $experience'),
            Text('Tarifa: $fee'),
          ],
        ),
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFBEBF8F),
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), // Make the button smaller
          ),
          onPressed: () {
            // Handle "Ver más detalles"
          },
          child: const Text('Ver más'),
        ),
      ),
    );
  }
}
