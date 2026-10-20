
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter State',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6578F5),
        ),
      ),
      home: const CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6FF),
      body: Stack(
        children: [
          Positioned(
            top: -80,
            right: -60,
            child: _circle(230, const Color(0xFFDCE5FF)),
          ),
          Positioned(
            bottom: -90,
            left: -60,
            child: _circle(250, const Color(0xFFE9DEFF)),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(22),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 650),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF6578F5)
                              .withValues(alpha: 0.15),
                          blurRadius: 35,
                          offset: const Offset(0, 14),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Header
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 32,
                          ),
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF4597FF),
                                Color(0xFF8962F5),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: const Column(
                            children: [
                              Icon(
                                Icons.auto_graph_rounded,
                                color: Colors.white,
                                size: 48,
                              ),
                              SizedBox(height: 12),
                              Text(
                                'Flutter State',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Belajar mengelola state dengan '
                                'cara yang mudah dan menyenangkan.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Konten counter
                        Padding(
                          padding: const EdgeInsets.all(28),
                          child: Column(
                            children: [
                              const Text(
                                'COUNTER',
                                style: TextStyle(
                                  color: Color(0xFF8994B0),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                                ),
                              ),
                              const SizedBox(height: 18),

                              // Tampilan angka
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                width: 190,
                                height: 190,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: _counter > 0
                                        ? const [
                                            Color(0xFF4D94FF),
                                            Color(0xFF8C64F5),
                                          ]
                                        : const [
                                            Color(0xFF91B7FF),
                                            Color(0xFFB3A0FF),
                                          ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(35),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFF796CF0)
                                          .withValues(alpha: 0.25),
                                      blurRadius: 25,
                                      offset: const Offset(0, 10),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: AnimatedSwitcher(
                                    duration: const Duration(
                                      milliseconds: 250,
                                    ),
                                    transitionBuilder: (child, animation) {
                                      return ScaleTransition(
                                        scale: animation,
                                        child: child,
                                      );
                                    },
                                    child: Text(
                                      '$_counter',
                                      key: ValueKey<int>(_counter),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 65,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 18),
                              Text(
                                _counter == 0
                                    ? 'Ayo mulai menghitung!'
                                    : 'Kamu sudah menghitung $_counter kali.',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Color(0xFF667391),
                                  fontSize: 15,
                                ),
                              ),

                              const SizedBox(height: 28),

                              // Tombol tambah dan kurang
                              Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 56,
                                      child: OutlinedButton.icon(
                                        onPressed: _decrementCounter,
                                        icon: const Icon(
                                          Icons.remove_rounded,
                                        ),
                                        label: const Text('Kurang'),
                                        style: OutlinedButton.styleFrom(
                                          foregroundColor:
                                              const Color(0xFF6578E8),
                                          side: const BorderSide(
                                            color: Color(0xFFD8DFFF),
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: SizedBox(
                                      height: 56,
                                      child: ElevatedButton.icon(
                                        onPressed: _incrementCounter,
                                        icon: const Icon(
                                          Icons.add_rounded,
                                        ),
                                        label: const Text('Tambah'),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFF6D78ED),
                                          foregroundColor: Colors.white,
                                          elevation: 3,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 14),

                              // Tombol reset
                              SizedBox(
                                width: double.infinity,
                                height: 52,
                                child: TextButton.icon(
                                  onPressed: _resetCounter,
                                  icon: const Icon(
                                    Icons.refresh_rounded,
                                  ),
                                  label: const Text('Reset Angka'),
                                  style: TextButton.styleFrom(
                                    foregroundColor:
                                        const Color(0xFF8791AA),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 18),

                              // Informasi state
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(18),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF1F4FF),
                                  borderRadius: BorderRadius.circular(18),
                                  border: Border.all(
                                    color: const Color(0xFFE3E8FF),
                                  ),
                                ),
                                child: const Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.lightbulb_outline_rounded,
                                      color: Color(0xFF7776E9),
                                      size: 28,
                                    ),
                                    SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Cara Kerja State',
                                            style: TextStyle(
                                              color: Color(0xFF5F62C9),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(height: 7),
                                          Text(
                                            'Nilai counter disimpan dalam '
                                            'variabel state. Saat tombol '
                                            'ditekan, setState() memperbarui '
                                            'nilai dan tampilan secara '
                                            'otomatis.',
                                            style: TextStyle(
                                              color: Color(0xFF697795),
                                              fontSize: 14,
                                              height: 1.6,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 20),
                              const Text(
                                'Flutter • State dan Interaksi Pengguna',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFFA1A9BD),
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _circle(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.7),
        shape: BoxShape.circle,
      ),
    );
  }
}
