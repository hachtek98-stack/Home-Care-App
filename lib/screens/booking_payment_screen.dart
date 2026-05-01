import 'package:flutter/material.dart';

class BookingPaymentScreen extends StatefulWidget {
  const BookingPaymentScreen({super.key});

  @override
  State<BookingPaymentScreen> createState() => _BookingPaymentScreenState();
}

class _BookingPaymentScreenState extends State<BookingPaymentScreen> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 60)),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _pickTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 8, minute: 0),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rendez-vous et Paiement'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '1. Choisissez la date et l\'heure',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 24),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _pickDate,
                      icon: const Icon(Icons.calendar_today, size: 28),
                      label: Text(
                        _selectedDate == null
                            ? 'Choisir une date'
                            : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                        style: const TextStyle(fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        backgroundColor: Colors.white,
                        foregroundColor: Theme.of(context).colorScheme.primary,
                        side: BorderSide(color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _pickTime,
                      icon: const Icon(Icons.access_time, size: 28),
                      label: Text(
                        _selectedTime == null
                            ? 'Choisir l\'heure'
                            : '${_selectedTime!.hour.toString().padLeft(2, '0')}:${_selectedTime!.minute.toString().padLeft(2, '0')}',
                        style: const TextStyle(fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        backgroundColor: Colors.white,
                        foregroundColor: Theme.of(context).colorScheme.primary,
                        side: BorderSide(color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 48),
              const Divider(thickness: 2),
              const SizedBox(height: 24),
              Text(
                '2. Paiement Mobile',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 24),
              ),
              const SizedBox(height: 16),
              Text(
                'Envoyez le paiement via l\'un de ces services, puis entrez le numéro de confirmation ci-dessous.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 18),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildWalletBadge('D-money', Colors.orange),
                  _buildWalletBadge('Waafi', Colors.red),
                  _buildWalletBadge('CaCpay', Colors.blue),
                ],
              ),
              const SizedBox(height: 32),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Numéro de transaction (ex: 12345678)',
                  prefixIcon: Icon(Icons.receipt_long),
                ),
                style: const TextStyle(fontSize: 18),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 48),
              ElevatedButton(
                onPressed: () {
                  // Finaliser
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                ),
                child: const Text('Confirmer le rendez-vous'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWalletBadge(String name, MaterialColor color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: color.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.shade300, width: 2),
      ),
      child: Text(
        name,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: color.shade800,
        ),
      ),
    );
  }
}
