import 'package:flutter/material.dart';
import '../models/product.dart';
import '../models/category.dart';
import '../widgets/category_icon.dart';
import '../widgets/product_card.dart';
import '../widgets/app_drawer.dart';
import '../widgets/app_header.dart';
import '../widgets/app_footer.dart';
import '../constants/app_constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late ScrollController _scrollController;
  late ScrollController _catController;
  late ScrollController _arrivalController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _catController = ScrollController();
    _arrivalController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _catController.dispose();
    _arrivalController.dispose();
    super.dispose();
  }

  // --- Static Data Definitions to Prevent Rebuild Churn ---
  static final List<Category> _categories = [
    Category(
      name: 'Fruits',
      remaining: 45,
      imageUrl: AppConstants.imagePath5[0],
      icon: Icons.apple_rounded,
    ),
    Category(
      name: 'Vege',
      remaining: 23,
      imageUrl: AppConstants.imagePath5[1],
      icon: Icons.grass_rounded,
    ),
    Category(
      name: 'Dairy',
      remaining: 12,
      imageUrl: AppConstants.imagePath5[2],
      icon: Icons.coffee_rounded,
    ),
    Category(
      name: 'Bakery',
      remaining: 8,
      imageUrl: AppConstants.imagePath5[3],
      icon: Icons.bakery_dining_rounded,
    ),
    Category(
      name: 'Drinks',
      remaining: 60,
      imageUrl: AppConstants.imagePath5[4],
      icon: Icons.local_drink_rounded,
    ),
    Category(
      name: 'Meat',
      remaining: 5,
      imageUrl: AppConstants.imagePath5[5],
      icon: Icons.kebab_dining_rounded,
    ),
  ];

  static final List<Product> _featuredProducts = List.generate(
    8,
    (i) => Product(
      name: 'Featured Item ${i + 1}',
      description: 'Premium quality grocery',
      price: 12.99 + i,
      rating: 4.8,
      imageUrl: AppConstants.imagePath4[i % AppConstants.imagePath4.length],
      isNew: i < 2,
      isSale: i > 5,
    ),
  );

  static final List<Product> _newArrivals = List.generate(
    6,
    (i) => Product(
      name: 'New Arrivals $i',
      description: 'Freshly stocked today',
      price: 9.99 * (i + 1),
      rating: 4.5,
      imageUrl: AppConstants.imagePath4[i % AppConstants.imagePath4.length],
      isNew: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppHeader(scaffoldKey: _scaffoldKey),
      drawer: const AppDrawer(),
      body: CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: [
          // 1. Hero Promo Section
          const SliverToBoxAdapter(child: _HeroSection()),

          // 2. Categories Row
          SliverToBoxAdapter(
            child: RepaintBoundary(
              child: Container(
                height: 140,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListView.builder(
                  controller: _catController,
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: _categories.length,
                  itemBuilder: (context, index) =>
                      CategoryIcon(category: _categories[index]),
                ),
              ),
            ),
          ),

          // 3. Featured Products Header
          const _SliverSectionTitle(title: 'Featured Products'),

          // 4. Featured Products Grid (High Efficiency)
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.72,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              delegate: SliverChildBuilderDelegate(
                (c, i) => ProductCard(product: _featuredProducts[i]),
                childCount: _featuredProducts.length,
              ),
            ),
          ),

          // 5. Promotional Images Banner
          const SliverToBoxAdapter(child: _VegBanner()),

          // 6. New Arrivals Header
          const _SliverSectionTitle(title: 'New Arrivals'),

          // 7. New Arrivals Horizontal List
          SliverToBoxAdapter(
            child: RepaintBoundary(
              child: Container(
                height: 260,
                margin: const EdgeInsets.only(bottom: 32),
                child: ListView.builder(
                  controller: _arrivalController,
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: _newArrivals.length,
                  itemBuilder: (c, i) => Container(
                    width: 170,
                    margin: const EdgeInsets.only(right: 16),
                    child: ProductCard(product: _newArrivals[i]),
                  ),
                ),
              ),
            ),
          ),

          // 8. Two Images Promo Section
          const SliverToBoxAdapter(child: _PromoCardsRow()),

          // 9. Top Selling Header
          const _SliverSectionTitle(title: 'Top Selling'),
          _ResponsiveGridSliver(
            itemCount: 3,
            itemBuilder: (c, i) => ProductCard(
              product: Product(
                name: 'Top sell $i',
                description: 'Highly popular',
                price: 24.99,
                rating: 4.9,
                imageUrl:
                    AppConstants.imagePath[i % AppConstants.imagePath.length],
              ),
            ),
          ),

          // 10. Top Rated Header
          const _SliverSectionTitle(title: 'Top Rated'),
          _ResponsiveGridSliver(
            itemCount: 3,
            itemBuilder: (c, i) => ProductCard(
              product: Product(
                name: 'Top Rated $i',
                description: 'Five star quality',
                price: 29.99,
                rating: 5.0,
                imageUrl:
                    AppConstants.imagePath2[i % AppConstants.imagePath2.length],
              ),
            ),
          ),

          // 11. Trending Header
          const _SliverSectionTitle(title: 'Trending'),
          _ResponsiveGridSliver(
            itemCount: 3,
            itemBuilder: (c, i) => ProductCard(
              product: Product(
                name: 'Trending $i',
                description: 'Fashionable choice',
                price: 34.99,
                rating: 4.7,
                imageUrl:
                    AppConstants.imagePath3[i % AppConstants.imagePath3.length],
              ),
            ),
          ),

          // 12. Customer Support Info
          const SliverToBoxAdapter(child: _SupportSection()),

          // 13. Social / Brand Section

          // 14. Footer
          const SliverToBoxAdapter(child: AppFooter()),
        ],
      ),
    );
  }
}

// --- Component Private Widgets to Maximize 'const' Usage ---

class _HeroSection extends StatelessWidget {
  const _HeroSection();
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Container(
      margin: const EdgeInsets.all(16),
      height: isMobile ? 240 : 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(colors: [Colors.green, Colors.teal]),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/fashion2back.jpg',
            fit: BoxFit.cover,
            errorBuilder: (c, e, s) => Container(),
          ),
          Container(color: Colors.black26),
          Padding(
            padding: EdgeInsets.all(isMobile ? 16.0 : 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'FREE DELIVERY',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Fresh Grocery\nAt Your Doorstep',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: isMobile ? 24 : 32,
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(
                        vertical: isMobile ? 10 : 12,
                      ),
                    ),
                    child: const Text(
                      'SHOP NOW',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _VegBanner extends StatelessWidget {
  const _VegBanner();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      height: 160,
      decoration: BoxDecoration(
        color: Colors.teal[50],
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage('assets/images/background2.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 20,
            top: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'Organic 100%',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Fresh Vegetables',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Order Now'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PromoCardsRow extends StatelessWidget {
  const _PromoCardsRow();
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: _PromoCard(
              title: 'Fast Food',
              sub: '20% OFF',
              color: Color(0xFFFFB300),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: _PromoCard(
              title: 'Bakery',
              sub: 'Buy 1 Get 1',
              color: Color(0xFFFF7043),
            ),
          ),
        ],
      ),
    );
  }
}

class _SupportSection extends StatelessWidget {
  const _SupportSection();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 40),
      padding: const EdgeInsets.symmetric(vertical: 40),
      color: Colors.white,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _SupportItem(
            icon: Icons.local_shipping_outlined,
            title: 'Free Delivery',
          ),
          _SupportItem(
            icon: Icons.replay_circle_filled_rounded,
            title: 'Easy Returns',
          ),
          _SupportItem(icon: Icons.shield_moon_outlined, title: 'Secure Pay'),
        ],
      ),
    );
  }
}

// class _BrandTrustSection extends StatelessWidget {
//   const _BrandTrustSection();
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(32),
//       child: Column(
//         children: [
//           const Text('Top Brands We Work With', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
//           const SizedBox(height: 20),
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children: List.generate(5, (i) => Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 12),
//                 padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                 decoration: BoxDecoration(border: Border.all(color: Colors.grey[200]!), borderRadius: BorderRadius.circular(10)),
//                 child: Text('BRAND ${i+1}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
//               )),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class _SliverSectionTitle extends StatelessWidget {
  final String title;
  const _SliverSectionTitle({required this.title});
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                color: Colors.black87,
              ),
            ),
            TextButton(onPressed: () {}, child: const Text('See All')),
          ],
        ),
      ),
    );
  }
}

class _PromoCard extends StatelessWidget {
  final String title;
  final String sub;
  final Color color;
  const _PromoCard({
    required this.title,
    required this.sub,
    required this.color,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            sub,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}

class _ResponsiveGridSliver extends StatelessWidget {
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  const _ResponsiveGridSliver({
    required this.itemCount,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount;
    double childAspectRatio;

    if (screenWidth < 480) {
      crossAxisCount = 2;
      childAspectRatio = 0.65;
    } else if (screenWidth < 768) {
      crossAxisCount = 2;
      childAspectRatio = 0.68;
    } else if (screenWidth < 1024) {
      crossAxisCount = 3;
      childAspectRatio = 0.70;
    } else {
      crossAxisCount = 3;
      childAspectRatio = 0.75;
    }

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: childAspectRatio,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        delegate: SliverChildBuilderDelegate(
          itemBuilder,
          childCount: itemCount,
        ),
      ),
    );
  }
}

class _SupportItem extends StatelessWidget {
  final IconData icon;
  final String title;
  const _SupportItem({required this.icon, required this.title});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.green, size: 32),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
      ],
    );
  }
}
