// lib/login_page.dart
import 'package:flutter/material.dart';
import 'library_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _errorMessage = "";

  // Variabel untuk mengontrol visibilitas password (buka/tutup mata)
  bool _obscurePassword = true;

  final String _dummyEmail = "admin";
  final String _dummyPass = "123456";

  void _handleLogin() {
    setState(() {
      if (_emailController.text.trim() == _dummyEmail &&
          _passwordController.text.trim() == _dummyPass) {
        _errorMessage = "";
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LibraryPage()),
        );
      } else {
        _errorMessage = "Email atau password tidak sesuai.";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Login Perpustakaan',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.book, size: 80, color: Colors.blue),
                const SizedBox(height: 24),
                
                // TextField Email / Username
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Masukan Username',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                
                // TextField Password dengan Fitur Tombol Mata
                TextField(
                  controller: _passwordController,
                  // Menggunakan variabel _obscurePassword agar bisa diubah dinamis
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Masukan Password',
                    border: const OutlineInputBorder(),
                    // Menambahkan ikon mata di bagian ujung kanan kolom password
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          // Membalik nilai true / false saat ikon ditekan
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                if (_errorMessage.isNotEmpty)
                  Text(
                    _errorMessage,
                    style: const TextStyle(color: Colors.red),
                  ),
                const SizedBox(height: 16),

                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: _handleLogin,
                    child: const Text('Login', style: TextStyle(fontSize: 16)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}