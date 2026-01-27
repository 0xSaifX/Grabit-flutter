import 'package:flutter/material.dart';
import '../widgets/app_header.dart';
import '../widgets/app_drawer.dart';
import '../widgets/app_footer.dart';
import '../widgets/product_card.dart';
import '../models/product.dart';
import '../constants/app_constants.dart';

class FashionPage extends StatefulWidget {
  const FashionPage({super.key});

  @override
  State<FashionPage> createState() => _FashionPageState();
}

class _FashionPageState extends State<FashionPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();

  static final List<Product> _fashionProducts = List.generate(10, (i) => Product(
    name: 'Fashion Trend ${i + 1}',
    description: 'Designer collection wear',
    price: 49.99 + (i * 15),
    rating: 4.9,
    imageUrl: AppConstants.imagePath7[(i + 4) % AppConstants.imagePath7.length],
    isNew: true,
  ));

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
          // Banner
          SliverToBoxAdapter(
            child: Container(
              height: 250,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/fashion1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'FASHION HUB',
                        style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold, letterSpacing: -2),
                      ),
                      Text(
                        'Discover the latest trends in luxury wear',
                        style: TextStyle(color: Colors.white70, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          
          const SliverPadding(
            padding: EdgeInsets.all(24.0),
            sliver: SliverToBoxAdapter(
              child: Row(
                children: [
                  Icon(Icons.auto_awesome, color: Colors.amber, size: 28),
                  const SizedBox(width: 12),
                  Text(
                    'Exclusive Collection',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.68,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              delegate: SliverChildBuilderDelegate(
                (c, i) => ProductCard(product: _fashionProducts[i]),
                childCount: _fashionProducts.length,
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 50)),
          const SliverToBoxAdapter(child: AppFooter()),
        ],
      ),
    );
  }
}
