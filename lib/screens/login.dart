import 'package:flutter/material.dart';
import 'dasboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Validasi email sederhana dan efektif
  String? validateEmail(String? value) {
    const pattern =
        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";
    final regex = RegExp(pattern);
    return value == null || value.isEmpty || !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : null;
  }

  // Validasi password opsional
  String? validatePassword(String? value) {
    return value == null || value.length < 6
        ? 'Password must be at least 6 characters'
        : null;
  }

  void login() {
  if (_formKey.currentState!.validate()) {
    if (emailController.text == "username@pensmail.com" &&
        passwordController.text == "123456") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login berhasil!")),
      );

      // Navigasi ke AdminDashboard
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AdminDashboard()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Email atau password salah!")),
      );
    }
  }
}

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 991;

    return Scaffold(
      backgroundColor: const Color(0xFFDAF7FD),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 60),
            Center(
              child: Image.asset('assets/images/logo.png', width: 100),
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: Center(
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 1100),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x40000000),
                            offset: Offset(4, 4),
                            blurRadius: 12,
                          ),
                        ],
                      ),
                      child: isDesktop
                          ? Row(
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Image.asset(
                                      'assets/images/welcome.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Expanded(flex: 5, child: _buildLoginForm()),
                              ],
                            )
                          : Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Image.asset(
                                    'assets/images/welcome.png',
                                    height: 200,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                _buildLoginForm(),
                              ],
                            ),
                    ),
                  ),
                ),
                const Positioned(
                  top: 20,
                  left: 20,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xFF005C81),
                  ),
                ),
                const Positioned(
                  bottom: 20,
                  right: 20,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xFFF7A634),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        decoration: const BoxDecoration(
          color: Color(0xFF006181),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontFamily: 'KdamThmorPro',
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Email',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'KdamThmorPro',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: emailController,
              validator: validateEmail,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white24,
                hintText: 'Enter your email',
                hintStyle: const TextStyle(color: Colors.white70),
                prefixIcon: const Icon(Icons.email, color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.all(16),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Password',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'KdamThmorPro',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: passwordController,
              validator: validatePassword,
              obscureText: true,
              textInputAction: TextInputAction.done,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white24,
                hintText: 'Enter your password',
                hintStyle: const TextStyle(color: Colors.white70),
                prefixIcon: const Icon(Icons.lock, color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.all(16),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0x6E01C0FF),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: login,
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'KdamThmorPro',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
