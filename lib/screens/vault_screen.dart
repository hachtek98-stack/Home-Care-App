import 'package:flutter/material.dart';

class VaultScreen extends StatefulWidget {
  const VaultScreen({super.key});

  @override
  State<VaultScreen> createState() => _VaultScreenState();
}

class _VaultScreenState extends State<VaultScreen> {
  bool _isUnlocked = false;
  final _pinController = TextEditingController();

  void _unlockVault() {
    if (_pinController.text.isNotEmpty) {
      setState(() {
        _isUnlocked = true;
      });
    }
  }

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffre-fort Médical'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: _isUnlocked ? _buildUnlockedView() : _buildLockedView(),
        ),
      ),
    );
  }

  Widget _buildLockedView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Icon(
          Icons.lock_outline,
          size: 80,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(height: 24),
        Text(
          'Entrez votre code PIN pour accéder à vos résultats.',
          style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 24),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 48),
        TextField(
          controller: _pinController,
          decoration: const InputDecoration(
            labelText: 'Code PIN (ex: 1234)',
            prefixIcon: Icon(Icons.dialpad),
          ),
          style: const TextStyle(fontSize: 24, letterSpacing: 8),
          keyboardType: TextInputType.number,
          obscureText: true,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        ElevatedButton(
          onPressed: _unlockVault,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 24),
          ),
          child: const Text('Déverrouiller'),
        ),
      ],
    );
  }

  Widget _buildUnlockedView() {
    final List<Map<String, String>> documents = [
      {'title': 'Résultats d\'analyse Sanguine', 'date': '12 Mai 2024'},
      {'title': 'Résultats d\'analyse Urinaire', 'date': '05 Mars 2024'},
      {'title': 'Bilan de santé annuel', 'date': '10 Déc 2023'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Vos Documents Sécurisés',
          style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 28),
        ),
        const SizedBox(height: 24),
        Expanded(
          child: ListView.separated(
            itemCount: documents.length,
            separatorBuilder: (context, index) => const Divider(thickness: 1.5),
            itemBuilder: (context, index) {
              final doc = documents[index];
              return ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
                leading: Icon(
                  Icons.picture_as_pdf,
                  color: Theme.of(context).colorScheme.primary,
                  size: 48,
                ),
                title: Text(
                  doc['title']!,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Date : ${doc['date']}',
                  style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.download_rounded, size: 36),
                  color: Theme.of(context).colorScheme.primary,
                  onPressed: () {
                    // Download action
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
