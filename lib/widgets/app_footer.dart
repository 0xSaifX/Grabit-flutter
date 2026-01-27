import 'package:flutter/material.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const ValueKey('app_footer_container'),
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildFooterColumn(
                'Categories',
                ['Fruits', 'Vegetables', 'Bakery'],
              ),
              _buildFooterColumn(
                'Company',
                ['About Us', 'Contact', 'Careers'],
              ),
              _buildFooterColumn(
                'Contact',
                [
                  'Email: info@grabit.com',
                  'Phone: 123-456-7890',
                  'Address: 123 Main St'
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Divider(color: Colors.grey),
          const SizedBox(height: 10),
          const Text(
            '© 2026 Grabit App. All rights reserved.',
            key: ValueKey('footer_copyright'),
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterColumn(String title, List<String> items) {
    return Column(
      key: ValueKey('footer_col_$title'),
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
        const SizedBox(height: 10),
        ...items.map((item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: InkWell(
                key: ValueKey('footer_item_${title}_$item'),
                onTap: () {},
                child: Text(
                  item,
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ),
            )),
      ],
    );
  }
}
