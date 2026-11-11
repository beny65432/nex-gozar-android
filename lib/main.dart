
import 'package:flutter/material.dart';

void main() {
  runApp(const NexGozarApp());
}

class NexGozarApp extends StatelessWidget {
  const NexGozarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NEX GOZAR',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF080D18),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF168BFF),
          secondary: Color(0xFF00C8FF),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool connected = false;
  int selectedServer = 0;

  final List<Map<String, String>> servers = [
    {'name': 'Germany', 'flag': '🇩🇪', 'ping': 'Auto'},
    {'name': 'United States', 'flag': '🇺🇸', 'ping': 'Auto'},
    {'name': 'Netherlands', 'flag': '🇳🇱', 'ping': 'Auto'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 25),

            const Text(
              'NEX GOZAR',
              style: TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.bold,
                letterSpacing: 3,
                color: Color(0xFF35A7FF),
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'SECURE CONNECTION',
              style: TextStyle(
                fontSize: 11,
                color: Colors.white54,
                letterSpacing: 2,
              ),
            ),

            const Spacer(),

            Icon(
              Icons.shield_rounded,
              size: 95,
              color: connected
                  ? Colors.greenAccent
                  : const Color(0xFF168BFF),
            ),

            const SizedBox(height: 20),

            Text(
              connected ? 'Connected' : 'Disconnected',
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              connected
                  ? 'Demo interface only'
                  : 'Select a server to continue',
              style: const TextStyle(
                color: Colors.white54,
                fontSize: 13,
              ),
            ),

            const SizedBox(height: 35),

            GestureDetector(
              onTap: () {
                setState(() {
                  connected = !connected;
                });
              },
              child: Container(
                width: 145,
                height: 145,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF101D32),
                  border: Border.all(
                    color: connected
                        ? Colors.greenAccent
                        : const Color(0xFF168BFF),
                    width: 4,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF168BFF)
                          .withValues(alpha: 0.2),
                      blurRadius: 30,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.power_settings_new,
                  size: 65,
                  color: connected
                      ? Colors.greenAccent
                      : const Color(0xFF35A7FF),
                ),
              ),
            ),

            const SizedBox(height: 18),

            const Text(
              'DEMO BUTTON',
              style: TextStyle(
                color: Colors.white38,
                fontSize: 10,
                letterSpacing: 2,
              ),
            ),

            const Spacer(),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'SELECT SERVER',
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            ...List.generate(servers.length, (index) {
              final server = servers[index];
              final selected = selectedServer == index;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedServer = index;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: const Color(0xFF111C2D),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: selected
                          ? const Color(0xFF168BFF)
                          : Colors.white10,
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        server['flag']!,
                        style: const TextStyle(fontSize: 25),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Text(
                          server['name']!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        server['ping']!,
                        style: const TextStyle(
                          color: Colors.white54,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        selected
                            ? Icons.radio_button_checked
                            : Icons.radio_button_off,
                        color: const Color(0xFF168BFF),
                      ),
                    ],
                  ),
                ),
              );
            }),

            const SizedBox(height: 20),

            const Text(
              'NEX GOZAR  •  VERSION 1.0.0',
              style: TextStyle(
                color: Colors.white30,
                fontSize: 10,
                letterSpacing: 1,
              ),
            ),

            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
