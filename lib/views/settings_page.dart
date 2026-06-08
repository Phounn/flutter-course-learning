import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notifications = true;
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: const Text('ການຕັ້ງຄ່າ'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ກ່ອງໂປຣໄຟລ໌ (Container ທີ່ມີການແຕ່ງສີ + ມົນ)
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF3A85B7), Color(0xFF6FB1DC)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: const [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 34, color: Color(0xFF3A85B7)),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Himmel',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'ນັກຮຽນ Flutter',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          SwitchListTile(
            title: const Text('ການແຈ້ງເຕືອນ'),
            subtitle: const Text('ຮັບການແຈ້ງເຕືອນຄອສຮຽນໃໝ່'),
            value: _notifications,
            onChanged: (v) => setState(() => _notifications = v),
          ),
          SwitchListTile(
            title: const Text('ໂໝດມືດ'),
            subtitle: const Text('ສະຫຼັບໂໝດສະແດງຜົນ'),
            value: _darkMode,
            onChanged: (v) => setState(() => _darkMode = v),
          ),
        ],
      ),
    );
  }
}
