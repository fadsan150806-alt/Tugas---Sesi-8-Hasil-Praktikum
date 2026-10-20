
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
      title: 'Flutter Dinamis',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6478F5),
        ),
      ),
      home: const DynamicListPage(),
    );
  }
}

class DynamicListPage extends StatefulWidget {
  const DynamicListPage({super.key});

  @override
  State<DynamicListPage> createState() => _DynamicListPageState();
}

class _DynamicListPageState extends State<DynamicListPage> {
  final TextEditingController _controller = TextEditingController();

  final List<String> _items = [
    'Apel',
    'Jeruk',
    'Mangga',
  ];

  final List<IconData> _icons = [
    Icons.apple,
    Icons.local_grocery_store_rounded,
    Icons.eco_rounded,
    Icons.shopping_basket_rounded,
    Icons.spa_rounded,
  ];

  void _addItem() {
    final String text = _controller.text.trim();

    if (text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Silakan masukkan nama item terlebih dahulu.'),
        ),
      );
      return;
    }

    setState(() {
      _items.add(text);
      _controller.clear();
    });

    FocusScope.of(context).unfocus();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$text berhasil ditambahkan!'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _removeItem(int index) {
    final String removedItem = _items[index];

    setState(() {
      _items.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$removedItem dihapus dari daftar.'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6FF),
      body: Stack(
        children: [
          Positioned(
            top: -100,
            right: -70,
            child: Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                color: const Color(0xFFDCE5FF).withValues(alpha: 0.7),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -100,
            left: -60,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: const Color(0xFFE8DEFF).withValues(alpha: 0.7),
                shape: BoxShape.circle,
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 700),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF637CE0)
                              .withValues(alpha: 0.15),
                          blurRadius: 35,
                          offset: const Offset(0, 12),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        // Header
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(28),
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF4A91FF),
                                Color(0xFF8D63F5),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: const Column(
                            children: [
                              Icon(
                                Icons.auto_awesome_rounded,
                                color: Colors.white,
                                size: 42,
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Flutter Dinamis',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Kelola daftar item dengan mudah '
                                'dan tambahkan item baru kapan saja.',
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

                        // Isi halaman
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Expanded(
                                      child: Text(
                                        'Daftar Item',
                                        style: TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF293657),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 14,
                                        vertical: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFEDEFFF),
                                        borderRadius:
                                            BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        '${_items.length} item',
                                        style: const TextStyle(
                                          color: Color(0xFF655DE5),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                const Text(
                                  'Daftar akan diperbarui saat item ditambahkan.',
                                  style: TextStyle(
                                    color: Color(0xFF8791AA),
                                    fontSize: 13,
                                  ),
                                ),
                                const SizedBox(height: 18),

                                // Daftar dinamis
                                Expanded(
                                  child: _items.isEmpty
                                      ? const Center(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(
                                                Icons.inventory_2_outlined,
                                                size: 55,
                                                color: Color(0xFFB2BCD3),
                                              ),
                                              SizedBox(height: 12),
                                              Text(
                                                'Belum ada item',
                                                style: TextStyle(
                                                  color: Color(0xFF8791AA),
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : ListView.builder(
                                          itemCount: _items.length,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              margin: const EdgeInsets.only(
                                                bottom: 12,
                                              ),
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFF8F9FF),
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                border: Border.all(
                                                  color: const Color(
                                                    0xFFE8ECFA,
                                                  ),
                                                ),
                                              ),
                                              child: ListTile(
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 14,
                                                  vertical: 5,
                                                ),
                                                leading: Container(
                                                  width: 45,
                                                  height: 45,
                                                  decoration: BoxDecoration(
                                                    gradient:
                                                        const LinearGradient(
                                                      colors: [
                                                        Color(0xFFDBE8FF),
                                                        Color(0xFFEAE1FF),
                                                      ],
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      14,
                                                    ),
                                                  ),
                                                  child: Icon(
                                                    _icons[index %
                                                        _icons.length],
                                                    color: const Color(
                                                      0xFF6578E8,
                                                    ),
                                                  ),
                                                ),
                                                title: Text(
                                                  _items[index],
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xFF34415F),
                                                  ),
                                                ),
                                                subtitle: Text(
                                                  'Item ke-${index + 1}',
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Color(0xFF939DB3),
                                                  ),
                                                ),
                                                trailing: IconButton(
                                                  tooltip: 'Hapus item',
                                                  onPressed: () =>
                                                      _removeItem(index),
                                                  icon: const Icon(
                                                    Icons.delete_outline,
                                                    color: Color(0xFFE87991),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                ),

                                const SizedBox(height: 18),

                                // Form tambah item
                                const Text(
                                  'Tambah Item Baru',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF293657),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        controller: _controller,
                                        onSubmitted: (_) => _addItem(),
                                        decoration: InputDecoration(
                                          hintText: 'Contoh: Pisang',
                                          prefixIcon: const Icon(
                                            Icons.edit_note_rounded,
                                            color: Color(0xFF7182E8),
                                          ),
                                          filled: true,
                                          fillColor:
                                              const Color(0xFFF8F9FF),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide.none,
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: const BorderSide(
                                              color: Color(0xFF7182E8),
                                              width: 1.5,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    SizedBox(
                                      width: 55,
                                      height: 55,
                                      child: ElevatedButton(
                                        onPressed: _addItem,
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFF6E78ED),
                                          foregroundColor: Colors.white,
                                          padding: EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.add_rounded,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                const Center(
                                  child: Text(
                                    'Flutter • State dan Interaksi Pengguna',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFFA1A9BD),
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
}
