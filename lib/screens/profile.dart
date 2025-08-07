import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    
      body: Card(
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('images/doctor1.jpg'), // 👈 Add your asset
                  ),
                
                ],
              ),
              const SizedBox(height: 12),
              const Text(
                'Sarah Johnson',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Senior Chef',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 6),

              const Text('Support Team', style: TextStyle(color: Colors.grey)),
              const Divider(height: 30),
              const ProfileInfoRow(icon: Icons.phone, label2: '+234 812 345 6789',label: 'Phone'),
              const ProfileInfoRow(icon: Icons.email, label2: 'sarah@fixeroni.com',label: 'Email'),
              const ProfileInfoRow(icon: Icons.perm_identity, label2: 'Fixer-Sarah',label: 'Name'),
              const ProfileInfoRow(icon: Icons.location_on, label2: 'Lagos, Nigeria',label: 'Location'),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                icon: const Icon(Icons.remove_red_eye, color: Colors.white),
                label: const Text(
                  'Edit Profile',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileInfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
    final String label2;

  const ProfileInfoRow({
    super.key,
    required this.icon,
    required this.label, required this.label2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: Colors.black54),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(fontSize: 16)),
              Text(label2, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ],
      ),
    );
  }
}
