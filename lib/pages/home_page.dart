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
  late ScrollController _mainScrollController;
  late ScrollController _categoryScrollController;
  late ScrollController _arrivalScrollController;

  @override
  void initState() {
    super.initState();
    _mainScrollController = ScrollController();
    _categoryScrollController = ScrollController();
    _arrivalScrollController = ScrollController();
  }

  @override
  void dispose() {
    _mainScrollController.dispose();
    _categoryScrollController.dispose();
    _arrivalScrollController.dispose();
    super.dispose();
  }

  static final List<Product> _featuredProducts = List.generate(8, (index) => Product(
    name: 'Product ${index + 1}',
    description: 'Description ${index + 1}',
    price: 10.0 + index,
    rating: 4.5,
    imageUrl: 'https://via.placeholder.com/200?text=Product+${index + 1}',
    isNew: index % 2 == 0,
    isSale: index % 3 == 0,
  ));

  static final List<Product> _newArrivals = List.generate(10, (index) => Product(
    name: 'New Product ${index + 1}',
    description: 'New Description ${index + 1}',
    price: 15.0 + index,
    rating: 4.0,
    imageUrl: 'https://via.placeholder.com/150?text=New+${index + 1}',
    isNew: true,
  ));

  static final List<Product> _topSelling = List.generate(3, (index) => Product(
    name: 'Top Selling ${index + 1}',
    description: 'Fresh quality product',
    price: 20.0,
    rating: 5.0,
    imageUrl: AppConstants.imagePath[index % AppConstants.imagePath.length],
  ));

  static final List<Product> _topRated = List.generate(3, (index) => Product(
    name: 'Top Rated ${index + 1}',
    description: 'Highly recommended',
    price: 25.0,
    rating: 4.8,
    imageUrl: AppConstants.imagePath2[index % AppConstants.imagePath2.length],
  ));

  static final List<Product> _trending = List.generate(3, (index) => Product(
    name: 'Trending ${index + 1}',
    description: 'Popular this week',
    price: 30.0,
    rating: 4.7,
    imageUrl: AppConstants.imagePath3[index % AppConstants.imagePath3.length],
  ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppHeader(scaffoldKey: _scaffoldKey),
      drawer: const AppDrawer(),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: CustomScrollView(
            controller: _mainScrollController,
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            slivers: [
              // 1. Hero
              SliverToBoxAdapter(child: _buildHeroSection()),
              
              // 2. Categories
              SliverToBoxAdapter(child: _buildCategoriesRow()),
              
              // 3. Featured Products Title
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Featured Products', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                ),
              ),
              
              // 4. Featured Products Grid (SliverGrid)
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => ProductCard(key: ValueKey('featured_$index'), product: _featuredProducts[index]),
                    childCount: _featuredProducts.length,
                  ),
                ),
              ),
              
              // 5. Veg Banner
              SliverToBoxAdapter(child: _buildVegetablesBanner()),
              
              // 6. New Arrivals
              SliverToBoxAdapter(child: _buildNewArrivalsSection()),
              
              // 7. Promo Items
              SliverToBoxAdapter(child: _buildPromoSection()),
              
              // 8. Support Section
              SliverToBoxAdapter(child: _buildCustomerSupportSection()),
              
              // 9. Extra Lists (Top Selling, etc)
              _buildSliverGridSection('Top Selling', _topSelling, 'topsell'),
              _buildSliverGridSection('Top Rated', _topRated, 'toprated'),
              _buildSliverGridSection('Trending', _trending, 'trending'),
              
              // 10. Footer
              const SliverToBoxAdapter(child: AppFooter()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    return AspectRatio(
      aspectRatio: 16 / 6,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/fashion1.jpg',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(color: Colors.grey[200]),
          ),
          Container(color: Colors.black.withOpacity(0.2)),
          Positioned(
            left: 50,
            top: 0,
            bottom: 0,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Fresh Groceries', style: TextStyle(fontSize: 42, color: Colors.white, fontWeight: FontWeight.bold)),
                  const Text('Delivered to your door', style: TextStyle(fontSize: 20, color: Colors.white)),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    key: const ValueKey('hero_shop_btn'),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green, padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20)),
                    child: const Text('Shop Now', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesRow() {
    return Container(
      height: 140,
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: ListView(
        controller: _categoryScrollController,
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          CategoryIcon(key: const ValueKey('cat_fruits'), category: Category(name: 'Fruits', remaining: 50, icon: Icons.apple)),
          CategoryIcon(key: const ValueKey('cat_veg'), category: Category(name: 'Vegetables', remaining: 30, icon: Icons.grass)),
          CategoryIcon(key: const ValueKey('cat_bakery'), category: Category(name: 'Bakery', remaining: 20, icon: Icons.cake)),
          CategoryIcon(key: const ValueKey('cat_snacks'), category: Category(name: 'Snacks', remaining: 40, icon: Icons.fastfood)),
          CategoryIcon(key: const ValueKey('cat_drinks'), category: Category(name: 'Drinks', remaining: 60, icon: Icons.local_drink)),
          CategoryIcon(key: const ValueKey('cat_milk'), category: Category(name: 'Milk', remaining: 25, icon: Icons.local_cafe)),
        ],
      ),
    );
  }

  Widget _buildVegetablesBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 40),
      child: AspectRatio(
        aspectRatio: 16 / 4,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/background2.jpg',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(color: Colors.grey[200]),
            ),
            Positioned(
              right: 80,
              top: 0,
              bottom: 0,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Fresh Vegetables', style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold)),
                    const Text('Healthy and Organic', style: TextStyle(fontSize: 18, color: Colors.white)),
                    const SizedBox(height: 10),
                    ElevatedButton(key: const ValueKey('veg_btn'), onPressed: () {}, child: const Text('Order Now')),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewArrivalsSection() {
    return Column(
      children: [
        const Text('New Arrivals', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        SizedBox(
          height: 250,
          child: ListView.builder(
            controller: _arrivalScrollController,
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: _newArrivals.length,
            itemBuilder: (context, index) => ProductCard(key: ValueKey('arr_$index'), product: _newArrivals[index]),
          ),
        ),
      ],
    );
  }

  Widget _buildPromoSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 8),
      child: Row(
        children: [
          Expanded(child: _buildPromoItem('Fashion Sale', '50% OFF', 'promo1')),
          Expanded(child: _buildPromoItem('Tech Deals', 'Free Shipping', 'promo2')),
        ],
      ),
    );
  }

  Widget _buildPromoItem(String title, String sub, String key) {
    return AspectRatio(
      aspectRatio: 1.2,
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(12)),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network('https://via.placeholder.com/400x300?text=$title', fit: BoxFit.cover, errorBuilder: (c,e,s) => const Icon(Icons.image)),
            Container(color: Colors.black26),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                  Text(sub, style: const TextStyle(color: Colors.white70)),
                  const SizedBox(height: 10),
                  ElevatedButton(key: ValueKey(key), onPressed: () {}, child: const Text('View')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomerSupportSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60),
      color: Colors.grey[50],
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _SupportItem(icon: Icons.security, title: 'Guarantee'),
          _SupportItem(icon: Icons.payment, title: 'Secure Payment'),
          _SupportItem(icon: Icons.refresh, title: 'Return Policy'),
        ],
      ),
    );
  }

  Widget _buildSliverGridSection(String title, List<Product> products, String keyPrefix) {
    return MultiSliver(
      children: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 0.7, crossAxisSpacing: 12, mainAxisSpacing: 12),
            delegate: SliverChildBuilderDelegate(
              (c, i) => ProductCard(key: ValueKey('${keyPrefix}_$i'), product: products[i]),
              childCount: products.length,
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 30)),
      ],
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
        Icon(icon, size: 40, color: Colors.green),
        const SizedBox(height: 10),
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class MultiSliver extends StatelessWidget {
  final List<Widget> children;
  const MultiSliver({super.key, required this.children});
  @override
  Widget build(BuildContext context) => SliverList(delegate: SliverChildListDelegate(children));
}
