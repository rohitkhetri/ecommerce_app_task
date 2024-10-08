import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo1yt/products_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
  
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber[100],
          elevation: 0,
          title: Center(
            child: CircleAvatar(
              backgroundColor: Colors.amber,
              radius: 20,
              child: Image.asset('assets/snt_logo.png'),
            ),
          ),
          actions: [
            IconButton(icon: const Icon(Icons.notifications, color: Colors.black),onPressed: () {},),
            IconButton(icon: const Icon(Icons.favorite_border, color: Colors.black),onPressed: () {},),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.amber[100],
                ),
                child: const Text('Menu',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Profile'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          children: const [
            HomePage(),
            CategoriesPage(),
            BrandsPage(),
            BagPage(),
            ProfilePage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.black),label: 'Home',),
            BottomNavigationBarItem(icon: Icon(Icons.category, color: Colors.black),label: 'Categories',),
            BottomNavigationBarItem(icon: Icon(Icons.border_all_outlined, color: Colors.black),label: 'Brands',),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag, color: Colors.black),label: 'Bag',),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 12,
                backgroundColor: Colors.amber,
                child: Text("R", style: TextStyle(color: Colors.white)),
              ),
              label: 'Raj Kumar',
            ),
          ],
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.blue.shade900,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search By Product, Brand & More..',
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                  icon: Icon(Icons.search, color: Colors.white),
                ),
              ),
            ),
          ),

          // Banner Section
          CarouselSlider(
            options: CarouselOptions(
              height: 180.0,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              viewportFraction: 1.0,
            ),
            items: [
              'assets/banner1.jpeg',
              'assets/banner2.jpeg',
              'assets/banner2.jpeg',
              'assets/banner2.jpeg'
            ].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                    ),
                    child: Image.asset(
                      i,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              );
            }).toList(),
          ),

          // Categories Section
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CategoryItem(label: 'Earrings', assetImage: 'assets/earrings.jpeg'),
                CategoryItem(label: 'Pendants', assetImage: 'assets/pendants.jpeg'),
                CategoryItem(label: 'Gold Rings', assetImage: 'assets/ring.jpg'),
                CategoryItem(label: 'Necklaces', assetImage: 'assets/necklace.jpeg'),
                CategoryItem(label: 'Bracelets', assetImage: 'assets/bracelets.jpeg'),
              ],
            ),
          ),

          // Product Photos
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ProductCategory(
                        assetImage: 'assets/ring.jpg',
                        label: 'Gold Ring',
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: ProductCategory(
                        assetImage: 'assets/earrings.jpeg',
                        label: 'Gold Earring',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: ProductCategory(
                        assetImage: 'assets/pendants.jpeg',
                        label: 'Gold Pendant',
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: ProductCategory(
                        assetImage: 'assets/necklace.jpeg',
                        label: 'Gold Chain',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Recently Viewed Section
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Recently Viewed',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
            itemCount: 6, 
            itemBuilder: (context, index) {
              return const ProductItem();
            },
          ),
        ],
      ),
    );
  }
}


class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Categories Page', style: TextStyle(fontSize: 24)));
  }
}

class BrandsPage extends StatelessWidget {
  const BrandsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Brands Page', style: TextStyle(fontSize: 24)));
  }
}

class BagPage extends StatelessWidget {
  const BagPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Bag Page', style: TextStyle(fontSize: 24)));
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Profile Page', style: TextStyle(fontSize: 24)));
  }
}

// Category Item  
class CategoryItem extends StatelessWidget {
  final String label;
  final String assetImage;

  const CategoryItem({super.key, required this.label, required this.assetImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Image.asset(assetImage, width: 50, height: 50),
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

// Product Category 
class ProductCategory extends StatelessWidget {
  final String label;
  final String assetImage;

  const ProductCategory({super.key, required this.label, required this.assetImage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, 
        MaterialPageRoute(builder: (context) => const ProductsScreen()),
        );
      },
    child: Column(
      children: [
        Image.asset(assetImage, height: 180, fit: BoxFit.fill),
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    ),
    );
  }
}


// Product Item 
class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, 
        MaterialPageRoute(builder: (context) => const ProductsScreen()),
        );
      },
      child :Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/ring.jpg',
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  color: Colors.red,
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  child: const Text(
                    '30% OFF',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Product Name Goes Here',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                SizedBox(height: 5),
                Text(
                  '₹ 25,652',
                  style: TextStyle(color: Colors.green, fontSize: 14),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '4.7K likes',
                      style: TextStyle(fontSize: 12),
                    ),
                    Icon(Icons.favorite_border, size: 18),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    );
  }
}