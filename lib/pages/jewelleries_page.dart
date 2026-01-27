import 'package:flutter/material.dart';
import '../widgets/app_header.dart';
import '../widgets/app_drawer.dart';
import '../widgets/app_footer.dart';
import '../widgets/product_card.dart';
import '../models/product.dart';
import '../constants/app_constants.dart';

class JewelleriesPage extends StatefulWidget {
  const JewelleriesPage({super.key});

  @override
  State<JewelleriesPage> createState() => _JewelleriesPageState();
}

class _JewelleriesPageState extends State<JewelleriesPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();

  static final List<Product> _jewelryProducts = List.generate(10, (i) => Product(
    name: 'Luxury Piece ${i + 1}',
    description: 'Gold and Diamond finish',
    price: 199.99 * (i + 1),
    rating: 5.0,
    imageUrl: AppConstants.imagePath7[(i + 5) % AppConstants.imagePath7.length], // Starts from 6th image (index 5)
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
          // Elegant Hero Banner
          SliverToBoxAdapter(
            child: Container(
              height: 350,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/jewellery_hero.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.8),
                      Colors.black.withOpacity(0.2),
                    ],
                  ),
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.diamond_outlined, color: Colors.amber, size: 60),
                      SizedBox(height: 16),
                      Text(
                        'PRECIOUS GEMS',
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w200,
                          letterSpacing: 12,
                          color: Colors.white,
                          fontFamily: 'Serif', // If available, otherwise default
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'EXQUISITE LUXURY AT YOUR FINGERTIPS',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          letterSpacing: 4,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          
          const SliverPadding(
            padding: EdgeInsets.all(32.0),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Newest Arrivals',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              delegate: SliverChildBuilderDelegate(
                (c, i) => ProductCard(product: _jewelryProducts[i]),
                childCount: _jewelryProducts.length,
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 80)),
          const SliverToBoxAdapter(child: AppFooter()),
        ],
      ),
    );
  }
}
