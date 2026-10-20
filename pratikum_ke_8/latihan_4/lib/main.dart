
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
      title: 'Animation Example',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6578F5),
        ),
      ),
      home: const AnimationPage(),
    );
  }
}

class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  bool _isAnimated = false;

  void _changeAnimation() {
    setState(() {
      _isAnimated = !_isAnimated;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double boxSize = _isAnimated ? 190 : 145;
    final double boxRadius = _isAnimated ? 95 : 28;

    return Scaffold(
      backgroundColor: const Color(0xFFF2F6FF),
      body: Stack(
        children: [
          // Dekorasi latar belakang
          Positioned(
            top: -90,
            left: -80,
            child: _decorationCircle(
              260,
              const Color(0xFFDCE6FF),
            ),
          ),
          Positioned(
            bottom: -100,
            right: -70,
            child: _decorationCircle(
              300,
              const Color(0xFFE6DEFF),
            ),
          ),
          Positioned(
            top: 100,
            right: 45,
            child: _smallDot(),
          ),
          Positioned(
            bottom: 100,
            left: 45,
            child: _smallDot(),
          ),

          // Konten utama
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(22),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 700,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF6784DF)
                              .withValues(alpha: 0.16),
                          blurRadius: 35,
                          offset: const Offset(0, 15),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Header gradasi
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 30,
                          ),
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF4398FF),
                                Color(0xFF8B5CF6),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: const Column(
                            children: [
                              Icon(
                                Icons.auto_awesome_rounded,
                                size: 38,
                                color: Colors.white,
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Animation Example',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 12),
                              Text(
                                'Tekan tombol di bawah untuk melihat animasi '
                                'yang mengubah ukuran, warna, dan bentuk!',
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

                        // Area animasi
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            24, 35, 24, 28,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 215,
                                child: Center(
                                  child: AnimatedContainer(
                                    duration: const Duration(
                                      milliseconds: 700,
                                    ),
                                    curve: Curves.easeInOut,
                                    width: boxSize,
                                    height: boxSize,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: _isAnimated
                                            ? const [
                                                Color(0xFFFF73B3),
                                                Color(0xFFFF9478),
                                              ]
                                            : const [
                                                Color(0xFF4398FF),
                                                Color(0xFF9857F5),
                                              ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        boxRadius,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: (_isAnimated
                                                  ? const Color(0xFFFF73B3)
                                                  : const Color(0xFF8067EF))
                                              .withValues(alpha: 0.3),
                                          blurRadius: 25,
                                          offset: const Offset(0, 12),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: AnimatedRotation(
                                        turns: _isAnimated ? 0.125 : 0,
                                        duration: const Duration(
                                          milliseconds: 700,
                                        ),
                                        child: const Icon(
                                          Icons.flutter_dash,
                                          color: Colors.white,
                                          size: 65,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 20),

                              // Tombol pemicu animasi
                              SizedBox(
                                width: 330,
                                height: 58,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF4A91FF),
                                        Color(0xFF9657F5),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(40),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0xFF8067EF)
                                            .withValues(alpha: 0.25),
                                        blurRadius: 15,
                                        offset: const Offset(0, 7),
                                      ),
                                    ],
                                  ),
                                  child: ElevatedButton.icon(
                                    onPressed: _changeAnimation,
                                    icon: const Icon(
                                      Icons.auto_fix_high_rounded,
                                      color: Colors.white,
                                    ),
                                    label: Text(
                                      _isAnimated
                                          ? 'Ulangi Animasi'
                                          : 'Jalankan Animasi',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      shadowColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          40,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 30),

                              // Panel informasi
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF0F3FF),
                                  borderRadius: BorderRadius.circular(18),
                                  border: Border.all(
                                    color: const Color(0xFFE4E8FF),
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 48,
                                      height: 48,
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xFF9D75FF),
                                            Color(0xFF6D8BFF),
                                          ],
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16),
                                      ),
                                      child: const Icon(
                                        Icons.lightbulb_outline_rounded,
                                        color: Colors.white,
                                        size: 27,
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    const Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Cara Kerja',
                                            style: TextStyle(
                                              color: Color(0xFF7658E8),
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            'AnimatedContainer mengubah '
                                            'ukuran, warna, dan sudut kotak '
                                            'secara halus ketika tombol '
                                            'ditekan. Durasi animasi adalah '
                                            '700 milidetik.',
                                            style: TextStyle(
                                              color: Color(0xFF5E6C8D),
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

                              Text(
                                _isAnimated
                                    ? 'Animasi sedang dalam keadaan aktif ✨'
                                    : 'Tekan tombol untuk memulai animasi',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Color(0xFF8A96B0),
                                  fontSize: 13,
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

  Widget _decorationCircle(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.65),
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _smallDot() {
    return Container(
      width: 18,
      height: 18,
      decoration: const BoxDecoration(
        color: Color(0xFFB4C8FF),
        shape: BoxShape.circle,
      ),
    );
  }
}
