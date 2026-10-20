import 'package:flutter/material.dart';

void main() {
  runApp(const InteraksiLabApp());
}

const Color primaryColor = Color(0xFF5267E8);
const Color secondaryColor = Color(0xFF8457D9);
const Color pageColor = Color(0xFFF5F6FC);
const Color textColor = Color(0xFF202447);

class InteraksiLabApp extends StatelessWidget {
  const InteraksiLabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interaksi Lab',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: pageColor,
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        appBarTheme: const AppBarTheme(
          backgroundColor: pageColor,
          foregroundColor: textColor,
          elevation: 0,
          centerTitle: false,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xFFE5E7F0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: primaryColor, width: 1.5),
          ),
        ),
      ),
      home: const MainNavigation(),
    );
  }
}

// ============================================================
// NAVIGASI UTAMA
// ============================================================

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int selectedIndex = 0;

  final List<String> titles = const [
    'Beranda',
    'State & Counter',
    'Proses Input',
    'Callback',
    'Animasi',
    'Daftar Dinamis',
  ];

  void _openPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomePage(onNavigate: _openPage),
      const CounterPage(),
      const InputPage(),
      const CallbackPage(),
      const AnimationPage(),
      const DynamicListPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titles[selectedIndex],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 21,
              ),
            ),
            const Text(
              'INTERAKSI LAB • FLUTTER',
              style: TextStyle(
                fontSize: 10,
                letterSpacing: 1.4,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: _openPage,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.exposure_plus_1_outlined),
            selectedIcon: Icon(Icons.exposure_plus_1),
            label: 'State',
          ),
          NavigationDestination(
            icon: Icon(Icons.edit_note_outlined),
            selectedIcon: Icon(Icons.edit_note),
            label: 'Input',
          ),
          NavigationDestination(
            icon: Icon(Icons.chat_bubble_outline),
            selectedIcon: Icon(Icons.chat_bubble),
            label: 'Callback',
          ),
          NavigationDestination(
            icon: Icon(Icons.widgets_outlined),
            selectedIcon: Icon(Icons.widgets),
            label: 'Animasi',
          ),
          NavigationDestination(
            icon: Icon(Icons.list_alt_outlined),
            selectedIcon: Icon(Icons.list_alt),
            label: 'Daftar',
          ),
        ],
      ),
    );
  }
}

// ============================================================
// WIDGET BANTUAN
// ============================================================

class PagePadding extends StatelessWidget {
  final Widget child;

  const PagePadding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
      child: child,
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const SectionTitle({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.black54, height: 1.5),
          ),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  const InfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.color = primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE9EAF3)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: color, size: 25),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(color: Colors.black54, height: 1.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// 1. BERANDA
// ============================================================

class HomePage extends StatelessWidget {
  final ValueChanged<int> onNavigate;

  const HomePage({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return PagePadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [primaryColor, secondaryColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: primaryColor.withOpacity(0.22),
                  blurRadius: 22,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.auto_awesome, color: Colors.white, size: 36),
                SizedBox(height: 18),
                Text(
                  'Selamat Datang!',
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Belajar Flutter jadi lebih mudah dengan praktik langsung.',
                  style: TextStyle(color: Colors.white, height: 1.6),
                ),
                SizedBox(height: 18),
                Text(
                  '6 HALAMAN • 5 MATERI INTERAKTIF',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 10,
                    letterSpacing: 1.3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          const SectionTitle(
            title: 'Ruang Praktik',
            subtitle: 'Pilih materi yang ingin kamu coba.',
          ),
          _HomeMenuCard(
            icon: Icons.exposure_plus_1,
            title: 'State & Counter',
            description: 'Mengubah angka dengan setState().',
            color: primaryColor,
            onTap: () => onNavigate(1),
          ),
          _HomeMenuCard(
            icon: Icons.edit_note,
            title: 'Proses Input',
            description: 'Menampilkan teks secara langsung.',
            color: secondaryColor,
            onTap: () => onNavigate(2),
          ),
          _HomeMenuCard(
            icon: Icons.chat_bubble,
            title: 'Callback',
            description: 'Menjalankan fungsi saat tombol ditekan.',
            color: const Color(0xFF149B70),
            onTap: () => onNavigate(3),
          ),
          _HomeMenuCard(
            icon: Icons.animation,
            title: 'Animasi',
            description: 'Melihat perubahan bentuk dengan animasi.',
            color: const Color(0xFFE59A29),
            onTap: () => onNavigate(4),
          ),
          _HomeMenuCard(
            icon: Icons.playlist_add_check,
            title: 'Daftar Dinamis',
            description: 'Menambah dan menghapus item.',
            color: const Color(0xFFE45B7A),
            onTap: () => onNavigate(5),
          ),
          const SizedBox(height: 10),
          const InfoCard(
            icon: Icons.school_outlined,
            title: 'Tujuan Pembelajaran',
            description:
                'Memahami state, setState(), input, callback, animasi, '
                'dan daftar dinamis melalui satu aplikasi.',
          ),
        ],
      ),
    );
  }
}

class _HomeMenuCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;
  final VoidCallback onTap;

  const _HomeMenuCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(18),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(icon, color: color, size: 25),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.black38,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// 2. STATE DAN COUNTER
// ============================================================

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter = 0;

  void _increment() {
    setState(() => counter++);
  }

  void _decrement() {
    if (counter > 0) {
      setState(() => counter--);
    }
  }

  void _reset() {
    setState(() => counter = 0);
  }

  @override
  Widget build(BuildContext context) {
    return PagePadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: 'State & Counter',
            subtitle: 'Ubah angka dan perhatikan tampilan yang diperbarui.',
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [primaryColor, secondaryColor],
              ),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Column(
              children: [
                const Icon(Icons.touch_app, size: 42, color: Colors.white),
                const SizedBox(height: 12),
                const Text(
                  'Nilai Counter',
                  style: TextStyle(color: Colors.white70, fontSize: 15),
                ),
                const SizedBox(height: 10),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  transitionBuilder: (child, animation) =>
                      ScaleTransition(scale: animation, child: child),
                  child: Text(
                    '$counter',
                    key: ValueKey(counter),
                    style: const TextStyle(
                      fontSize: 68,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  counter == 0
                      ? 'Mulai dengan menekan tombol tambah'
                      : 'Nilai counter sekarang $counter',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white70, height: 1.5),
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          Row(
            children: [
              Expanded(
                child: FilledButton.icon(
                  onPressed: _decrement,
                  icon: const Icon(Icons.remove),
                  label: const Text('Kurang'),
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFFE45B7A),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: FilledButton.icon(
                  onPressed: _increment,
                  icon: const Icon(Icons.add),
                  label: const Text('Tambah'),
                  style: FilledButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          OutlinedButton.icon(
            onPressed: _reset,
            icon: const Icon(Icons.refresh),
            label: const Text('Reset Counter'),
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(double.infinity, 48),
            ),
          ),
          const SizedBox(height: 22),
          const InfoCard(
            icon: Icons.code,
            title: 'Konsep yang digunakan',
            description:
                'StatefulWidget menyimpan nilai counter. setState() '
                'memberitahu Flutter untuk memperbarui tampilan.',
          ),
        ],
      ),
    );
  }
}

// ============================================================
// 3. PROSES INPUT
// ============================================================

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String inputText = '';

  @override
  Widget build(BuildContext context) {
    return PagePadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: 'Proses Input',
            subtitle: 'Ketik sesuatu dan hasilnya akan berubah otomatis.',
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: const Color(0xFFE5E7F0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.edit_note, size: 38, color: secondaryColor),
                const SizedBox(height: 16),
                const Text(
                  'Tulis pesanmu',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                TextField(
                  onChanged: (value) {
                    setState(() => inputText = value);
                  },
                  decoration: const InputDecoration(
                    hintText: 'Contoh: Saya sedang belajar Flutter',
                    prefixIcon: Icon(Icons.keyboard),
                  ),
                ),
                const SizedBox(height: 22),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0EDFF),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.visibility, color: secondaryColor),
                          SizedBox(width: 8),
                          Text(
                            'Hasil langsung',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: secondaryColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        inputText.isEmpty
                            ? 'Teks yang kamu ketik akan tampil di sini.'
                            : inputText,
                        style: const TextStyle(fontSize: 17, height: 1.5),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        '${inputText.length} karakter',
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const InfoCard(
            icon: Icons.keyboard_alt_outlined,
            title: 'Konsep yang digunakan',
            description:
                'onChanged menerima teks terbaru dari TextField. setState() '
                'memperbarui hasil setiap kali pengguna mengetik.',
            color: secondaryColor,
          ),
        ],
      ),
    );
  }
}

// ============================================================
// 4. CALLBACK
// ============================================================

class CallbackPage extends StatefulWidget {
  const CallbackPage({super.key});

  @override
  State<CallbackPage> createState() => _CallbackPageState();
}

class _CallbackPageState extends State<CallbackPage> {
  int clickCount = 0;
  String statusMessage = 'Belum ada pesan yang dikirim.';

  void _showMessage(String message) {
    debugPrint('Callback diterima: $message');

    setState(() {
      clickCount++;
      statusMessage = message;
    });

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return PagePadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: 'Callback',
            subtitle: 'Tekan tombol untuk menjalankan fungsi callback.',
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: const Color(0xFFE5E7F0)),
            ),
            child: Column(
              children: [
                Container(
                  width: 88,
                  height: 88,
                  decoration: BoxDecoration(
                    color: const Color(0xFFDDF7E8),
                    borderRadius: BorderRadius.circular(26),
                  ),
                  child: const Icon(
                    Icons.mark_chat_read_outlined,
                    size: 43,
                    color: Color(0xFF149B70),
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  'Kirim Pesan Callback',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Setiap tombol mengirim pesan berbeda kepada fungsi yang sama.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black54, height: 1.5),
                ),
                const SizedBox(height: 22),
                FilledButton.icon(
                  onPressed: () =>
                      _showMessage('Halo! Tombol utama ditekan.'),
                  icon: const Icon(Icons.send),
                  label: const Text('Kirim Pesan'),
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF149B70),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                ),
                const SizedBox(height: 10),
                OutlinedButton.icon(
                  onPressed: () =>
                      _showMessage('Callback kedua berhasil dijalankan.'),
                  icon: const Icon(Icons.check_circle_outline),
                  label: const Text('Coba Callback Lain'),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 48),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFE4F7EE),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'STATUS CALLBACK',
                  style: TextStyle(
                    fontSize: 11,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF16804A),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  statusMessage,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                Text('Jumlah klik: $clickCount'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const InfoCard(
            icon: Icons.call_made,
            title: 'Konsep yang digunakan',
            description:
                'Fungsi _showMessage menerima String. Tombol memanggil '
                'fungsi tersebut dan mengirimkan pesan sebagai argumen.',
            color: Color(0xFF149B70),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// 5. ANIMASI
// ============================================================

class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  bool expanded = false;

  void _toggleAnimation() {
    setState(() => expanded = !expanded);
  }

  @override
  Widget build(BuildContext context) {
    final Color boxColor = expanded ? secondaryColor : primaryColor;

    return PagePadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: 'Animasi Interaktif',
            subtitle:
                'Tekan tombol untuk melihat perubahan bentuk, warna, dan ukuran.',
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 28),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: const Color(0xFFE5E7F0)),
            ),
            child: Column(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeInOutCubic,
                  width: expanded ? 220 : 140,
                  height: expanded ? 220 : 140,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        boxColor,
                        expanded
                            ? const Color(0xFFB28AF5)
                            : const Color(0xFF6EA4FF),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(expanded ? 40 : 24),
                    boxShadow: [
                      BoxShadow(
                        color: boxColor.withOpacity(0.25),
                        blurRadius: 25,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),
                  child: Center(
                    child: AnimatedRotation(
                      turns: expanded ? 0.125 : 0,
                      duration: const Duration(milliseconds: 600),
                      child: Icon(
                        expanded ? Icons.auto_awesome : Icons.star_rounded,
                        size: expanded ? 85 : 65,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: Text(
                    expanded ? 'Mode diperluas!' : 'Mode normal',
                    key: ValueKey(expanded),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  expanded
                      ? 'Kartu sudah berubah bentuk dan ukuran.'
                      : 'Kartu siap untuk dianimasikan.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 22),
                FilledButton.icon(
                  onPressed: _toggleAnimation,
                  icon: Icon(expanded ? Icons.refresh : Icons.play_arrow),
                  label: Text(
                    expanded ? 'Kembalikan Bentuk' : 'Jalankan Animasi',
                  ),
                  style: FilledButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const InfoCard(
            icon: Icons.animation,
            title: 'Konsep yang digunakan',
            description:
                'AnimatedContainer menganimasikan ukuran, warna, dan radius. '
                'AnimatedRotation mengubah rotasi ikon secara bertahap.',
            color: secondaryColor,
          ),
        ],
      ),
    );
  }
}

// ============================================================
// 6. DAFTAR DINAMIS
// ============================================================

class DynamicListPage extends StatefulWidget {
  const DynamicListPage({super.key});

  @override
  State<DynamicListPage> createState() => _DynamicListPageState();
}

class _DynamicListPageState extends State<DynamicListPage> {
  final TextEditingController itemController = TextEditingController();

  final List<String> items = [
    'Belajar StatefulWidget',
    'Memahami setState()',
    'Membuat UI Flutter',
  ];

  void _addItem() {
    final String newItem = itemController.text.trim();

    if (newItem.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Masukkan nama item terlebih dahulu.'),
        ),
      );
      return;
    }

    setState(() {
      items.add(newItem);
      itemController.clear();
    });

    FocusScope.of(context).unfocus();
  }

  void _removeItem(int index) {
    final String removedItem = items[index];

    setState(() {
      items.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('"$removedItem" berhasil dihapus.'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  void dispose() {
    itemController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PagePadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: 'Daftar Dinamis',
            subtitle: 'Tambahkan item sendiri dan hapus item yang tidak diperlukan.',
          ),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: const Color(0xFFE5E7F0)),
            ),
            child: Column(
              children: [
                TextField(
                  controller: itemController,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => _addItem(),
                  decoration: const InputDecoration(
                    hintText: 'Contoh: Belajar animasi',
                    prefixIcon: Icon(Icons.playlist_add),
                  ),
                ),
                const SizedBox(height: 12),
                FilledButton.icon(
                  onPressed: _addItem,
                  icon: const Icon(Icons.add),
                  label: const Text('Tambah Item'),
                  style: FilledButton.styleFrom(
                    backgroundColor: primaryColor,
                    minimumSize: const Size(double.infinity, 48),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Daftar Aktivitas',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                decoration: BoxDecoration(
                  color: const Color(0xFFE4E9FF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${items.length} item',
                  style: const TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (items.isEmpty)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                children: [
                  Icon(Icons.inbox_outlined, size: 48, color: Colors.black38),
                  SizedBox(height: 12),
                  Text(
                    'Belum ada item',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Tambahkan item melalui kolom di atas.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            )
          else
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(17),
                    border: Border.all(color: const Color(0xFFE9EAF3)),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: primaryColor.withOpacity(0.12),
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: Text(
                      items[index],
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    trailing: IconButton(
                      tooltip: 'Hapus item',
                      onPressed: () => _removeItem(index),
                      icon: const Icon(
                        Icons.delete_outline,
                        color: Color(0xFFE45B7A),
                      ),
                    ),
                  ),
                );
              },
            ),
          const SizedBox(height: 18),
          const InfoCard(
            icon: Icons.playlist_add_check,
            title: 'Konsep yang digunakan',
            description:
                'TextEditingController mengelola input. ListView.builder '
                'menampilkan daftar, sedangkan setState() memperbarui '
                'tampilan saat item ditambahkan atau dihapus.',
            color: Color(0xFFE45B7A),
          ),
        ],
      ),
    );
  }
}
