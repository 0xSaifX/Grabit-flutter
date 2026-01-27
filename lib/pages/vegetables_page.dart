import 'package:flutter/material.dart';
import '../widgets/app_header.dart';
import '../widgets/app_drawer.dart';
import '../widgets/app_footer.dart';
import '../widgets/product_card.dart';
import '../models/product.dart';
import '../constants/app_constants.dart';

class VegetablesPage extends StatefulWidget {
  const VegetablesPage({super.key});

  @override
  State<VegetablesPage> createState() => _VegetablesPageState();
}

class _VegetablesPageState extends State<VegetablesPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();

  static final List<Product> _vegProducts = List.generate(4, (i) {
    // Starting from index 6 of imagePath5 to use the "remaining" images
    final int imageIndex = (4 + i) % AppConstants.imagePath5.length;
    return Product(
      name: 'Fresh Veggie Bundle ${i + 1}',
      description: '100% Organic & Pesticide Free',
      price: 3.50 + i,
      rating: 4.7,
      imageUrl: AppConstants.imagePath5[imageIndex],
      isSale: i % 2 == 0,
    );
  });

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
          // Banner with a fresh image-based look
          SliverToBoxAdapter(
            child: Container(
              height: 220,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/latest1.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: -20,
                      top: -20,
                      child: Icon(Icons.eco, size: 200, color: Colors.white.withOpacity(0.1)),
                    ),
                    const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.grass_rounded, color: Colors.white, size: 40),
                          SizedBox(height: 10),
                          Text(
                            'ORGANIC MARKET',
                            style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 2),
                          ),
                          Text(
                            'Directly from farmers to you',
                            style: TextStyle(color: Colors.white70, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          const SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Seasonal Vegetables',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Colors.green),
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              delegate: SliverChildBuilderDelegate(
                (c, i) => ProductCard(product: _vegProducts[i]),
                childCount: _vegProducts.length,
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 60)),
          const SliverToBoxAdapter(child: AppFooter()),
        ],
      ),
    );
  }
}
