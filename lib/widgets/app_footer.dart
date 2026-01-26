import 'package:flutter/material.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
    );
  }

  Widget _buildFooterColumn(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        ...items.map((item) => Text(
              item,
              style: const TextStyle(color: Colors.white),
            )),
      ],
    );
  }
}
