import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../pages/grocery_page.dart';
import '../pages/vegetables_page.dart';
import '../pages/fashion_page.dart';
import '../pages/login_page.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900],
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Grabit',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Your premium destination for fresh groceries delivered to your doorstep. Quality and speed guaranteed.',
                      style: TextStyle(color: Colors.grey[400], height: 1.5),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 40),
              _FooterCol(
                title: 'Shop',
                items: const ['Fruits', 'Vegetables', 'Dairy', 'Fashion'],
              ),
              _FooterCol(
                title: 'Company',
                items: const ['About Us', 'Contact', 'Careers'],
              ),
              _FooterCol(
                title: 'Support',
                items: const ['FAQ', 'Returns', 'Security', 'Login'],
              ),
            ],
          ),
          const SizedBox(height: 60),
          const Divider(color: Colors.white10),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '© 2026 Grabit Inc. All rights reserved.',
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
              Row(
                children: [
                  _SocialIcon(
                    Icons.facebook,
                    label: 'Facebook',
                    url: 'https://facebook.com/grabit',
                  ),
                  _SocialIcon(
                    Icons.camera_alt_outlined,
                    label: 'Instagram',
                    url: 'https://instagram.com/grabit',
                  ),
                  _SocialIcon(
                    Icons.alternate_email_rounded,
                    label: 'Email',
                    url: 'mailto:support@grabit.com',
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FooterCol extends StatelessWidget {
  final String title;
  final List<String> items;
  const _FooterCol({required this.title, required this.items});

  void _navigate(BuildContext context, String item) {
    Widget? page;
    switch (item) {
      case 'Fruits':
      case 'Dairy':
        page = const GroceryPage();
        break;
      case 'Vegetables':
        page = const VegetablesPage();
        break;
      case 'Fashion':
        page = const FashionPage();
        break;
      case 'Login':
        page = const LoginPage();
        break;
      case 'Returns':
      case 'Security':
      case 'FAQ':
      case 'About Us':
      case 'Contact':
      case 'Careers':
        // These can go to a generic "Information" page but for now let's just use Grocery as placeholder
        // or a simple Scaffold with text
        page = Scaffold(
          appBar: AppBar(title: Text(item)),
          body: Center(child: Text('This is the $item page')),
        );
        break;
    }

    if (page != null) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => page!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: InkWell(
                onTap: () => _navigate(context, item),
                child: Text(
                  item,
                  style: TextStyle(color: Colors.grey[500], fontSize: 14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final String url;
  const _SocialIcon(this.icon, {required this.label, required this.url});

  Future<void> _launchUrl() async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode
          .externalApplication, // Ensures it opens in a new tab/browser
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: IconButton(
        icon: Icon(icon, color: Colors.grey[400], size: 22),
        onPressed: _launchUrl,
        tooltip: label,
      ),
    );
  }
}
