import 'package:flutter/material.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nouvelle demande'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Envoyer votre ordonnance',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: 28,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Vos données de santé sont sécurisées et strictement confidentielles.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 18,
                  color: Colors.green[800],
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              ElevatedButton.icon(
                onPressed: () {
                  // Action to take a photo
                },
                icon: const Icon(Icons.camera_alt, size: 48),
                label: const Text(
                  'Prendre en photo\nmon ordonnance',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              OutlinedButton.icon(
                onPressed: () {
                  // Action to upload file
                },
                icon: const Icon(Icons.upload_file, size: 32),
                label: const Text(
                  'Télécharger un fichier',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  ),
                  foregroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
