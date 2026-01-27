import 'package:flutter/material.dart';
import '../widgets/app_header.dart';
import '../widgets/app_drawer.dart';
import '../widgets/app_footer.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool _isLogin = true;

  @override
  void dispose() {
    _scrollController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  void _handleAuth() {
    // Basic validation
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    if (!_isLogin && _nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your full name'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    // Success Simulation
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_isLogin ? 'Login Successful! Welcome back.' : 'Registration Successful! Welcome to Grabit.'),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );

    // Navigate to Home Page after a small delay to show the message
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppHeader(scaffoldKey: _scaffoldKey),
      drawer: const AppDrawer(),
      body: CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          // 1. Login Form Card
          SliverToBoxAdapter(
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 500),
                margin: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Icon(Icons.lock_person_rounded, size: 60, color: Colors.green),
                    const SizedBox(height: 20),
                    Text(
                      _isLogin ? 'Welcome Back' : 'Create Account', 
                      style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: Colors.green),
                    ),
                    Text(
                      _isLogin ? 'Sign in to continue shopping' : 'Join Grabit family today',
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 40),
                    _buildTextField(Icons.email_outlined, 'Email Address', controller: _emailController),
                    const SizedBox(height: 20),
                    _buildTextField(Icons.lock_outline_rounded, 'Password', isObscure: true, controller: _passwordController),
                    if (!_isLogin) ...[
                      const SizedBox(height: 20),
                      _buildTextField(Icons.person_outline_rounded, 'Full Name', controller: _nameController),
                    ],
                    const SizedBox(height: 10),
                    if (_isLogin)
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(onPressed: () {}, child: const Text('Forgot Password?')),
                      ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: _handleAuth,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        ),
                        child: Text(
                          _isLogin ? 'SIGN IN' : 'REGISTER', 
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(_isLogin ? "Don't have an account?" : "Already have an account?"),
                        TextButton(
                          onPressed: () => setState(() => _isLogin = !_isLogin), 
                          child: Text(_isLogin ? 'Register' : 'Login', style: const TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 2. Footer
          const SliverToBoxAdapter(
            child: AppFooter(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(IconData icon, String label, {bool isObscure = false, TextEditingController? controller}) {
    return TextField(
      controller: controller,
      obscureText: isObscure,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.green),
        filled: true,
        fillColor: Colors.grey[50],
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      ),
    );
  }
}
