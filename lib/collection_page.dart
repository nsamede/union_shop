import 'package:flutter/material.dart';
import 'package:union_shop/app_drawer.dart';
import 'package:union_shop/app_styles.dart';
import 'package:union_shop/footer.dart';
import 'package:union_shop/header.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/product_card.dart';
import 'package:union_shop/top_banner.dart';

enum SortingOption {
  priceAscending("Price, low to high"),
  priceDescending("Price, high to low"),
  alphaAcscending("Alphabetically, A-Z"),
  alphaDescending("Alphabetically, Z-A");

  const SortingOption(this.displayName);
  final String displayName;
}

class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  final List<Product> _products = List.generate(10, (index) {
    final types = <ProductType>[];
    if (index % 2 == 0) types.add(ProductType.merchandise);
    if (index % 3 == 0) types.add(ProductType.clothing);
    if (index % 5 == 0) types.add(ProductType.popular);
    return Product(
        title: 'Product $index',
        price: 10.0 + index,
        imageUrl: 'images/portsmouthCityMagnet1.jpg',
        productTypes: types);
  });
  List<Product> _displayedProducts = [];
  ProductType? _selectedProductType;
  SortingOption? _selectedSortingOption = SortingOption.priceAscending;

  @override
  void initState() {
    super.initState();
    _displayedProducts = _products;
  }

  void _onFilterChanged(ProductType? selectedType) {
    setState(() {
      _selectedProductType = selectedType;
      _applySorting();
      _applyFilter();
    });
  }

  void _applyFilter() {
    if (_selectedProductType == null) {
      _displayedProducts = _products;
    } else {
      _displayedProducts = _products
          .where(
              (product) => product.productTypes.contains(_selectedProductType))
          .toList();
    }
  }

  void _onSortChanged(SortingOption? selectedSort) {
    setState(() {
      _selectedSortingOption = selectedSort;
      _applySorting();
      _applyFilter();
    });
  }

  void _applySorting() {
    _displayedProducts.sort((product1, product2) {
      switch (_selectedSortingOption) {
        case SortingOption.priceAscending:
          return product1.price.compareTo(product2.price);
        case SortingOption.priceDescending:
          return product2.price.compareTo(product1.price);
        case SortingOption.alphaAcscending:
          return product1.title.compareTo(product2.title);
        case SortingOption.alphaDescending:
          return product2.title.compareTo(product1.title);
        case null:
          return 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TopBanner(),
            const Header(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Center(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          child: const Text(
                            "Example Collection",
                            style: heading1,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Text(
                            "This is a description for the example collection.",
                            style: bodyText,
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child: DropdownMenu<ProductType?>(
                              label: const Text("Filter by"),
                              onSelected: _onFilterChanged,
                              initialSelection: _selectedProductType,
                              requestFocusOnTap: false,
                              inputDecorationTheme:
                                  const InputDecorationTheme(),
                              dropdownMenuEntries: [
                                for (ProductType productType
                                    in ProductType.values)
                                  DropdownMenuEntry(
                                      value: productType,
                                      label: productType.displayName),
                                const DropdownMenuEntry(
                                    value: null, label: "All products")
                              ]),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: DropdownMenu<SortingOption>(
                            label: const Text("Sort by"),
                            onSelected: _onSortChanged,
                            initialSelection: _selectedSortingOption,
                            requestFocusOnTap: false,
                            inputDecorationTheme: const InputDecorationTheme(),
                            dropdownMenuEntries: [
                              for (SortingOption sortingOption
                                  in SortingOption.values)
                                DropdownMenuEntry(
                                    value: sortingOption,
                                    label: sortingOption.displayName)
                            ]),
                      ),
                    ],
                  ),
                  const Divider(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Text(
                        "${_displayedProducts.length} products",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                            fontStyle: FontStyle.italic,
                            letterSpacing: 1),
                      ),
                    ),
                  ),
                  GridView.count(
                    crossAxisCount: 2,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 48,
                    shrinkWrap: true,
                    children: [
                      for (var product in _displayedProducts)
                        ProductCard(
                          product: product,
                        )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon:
                                const Icon(Icons.keyboard_arrow_left_outlined)),
                        const Text("Page 1 of 1"),
                        IconButton(
                            onPressed: () {},
                            icon:
                                const Icon(Icons.keyboard_arrow_right_outlined))
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
