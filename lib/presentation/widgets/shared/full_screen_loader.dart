import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  Stream<String> getLoadingMessages() {
    const List<String> messages = [
      'Cargando peliculas',
      'Haciendo palomitas',
      'Cargando populares',
      'Llama a tu mejor amigo',
      'hey! esto esta tardando mucho :(',
    ];

    return Stream.periodic(const Duration(milliseconds: 1200), (step) {
      return messages[step];
    }).take(messages.length);
  }

  const FullScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Espere porfavor'),
        const SizedBox(
          height: 20,
        ),
        const CircularProgressIndicator(),
        const SizedBox(
          height: 20,
        ),
        StreamBuilder(
          stream: getLoadingMessages(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Cargando');
            return Text(snapshot.data!);
          },
        )
      ],
    ));
  }
}
