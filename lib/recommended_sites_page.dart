import 'package:flutter/material.dart';

class RecommendedSitesPage extends StatefulWidget {
  const RecommendedSitesPage({Key? key}) : super(key: key);

  @override
  _RecommendedSitesPageState createState() => _RecommendedSitesPageState();
}

class _RecommendedSitesPageState extends State<RecommendedSitesPage> {
  // List of recommended sites
  final List<Map<String, String>> _sites = [
    {
      'name': 'Flutter',
      'url': 'https://flutter.dev/',
      'image': 'https://picsum.photos/id/10/200/200',
      'description':
      'Flutter is Google’s UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.',
    },
    {
      'name': 'Dart Programming Language',
      'url': 'https://dart.dev/',
      'image': 'https://picsum.photos/id/20/200/200',
      'description':
      'Dart is a client-optimized language for fast apps on any platform.',
    },
    {
      'name': 'Firebase',
      'url': 'https://firebase.google.com/',
      'image': 'https://picsum.photos/id/30/200/200',
      'description':
      'Firebase is a platform developed by Google for creating mobile and web applications.',
    },
  ];

  // List of favorite sites
  List<Map<String, String>> _favoriteSites = [];

  // Check if site is already in favorite list
  bool _isFavorite(String url) {
    return _favoriteSites.any((site) => site['url'] == url);
  }

  // Toggle favorite site
  void _toggleFavorite(Map<String, String> site) {
    setState(() {
      if (_isFavorite(site['url']!)) {
        _favoriteSites.removeWhere((s) => s['url'] == site['url']);
      } else {
        _favoriteSites.add(site);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: _sites.map(
                (site) =>
                Card(
                  margin: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 100.0,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.network(
                              site['image']!,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              right: 8.0,
                              bottom: 8.0,
                              child: IconButton(
                                icon: Icon(
                                  _isFavorite(site['url']!)
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: _isFavorite(site['url']!)
                                      ? Colors.red
                                      : null,
                                ),
                                onPressed: () => _toggleFavorite(site),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              site['name']!,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline6!,
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              site['description']!,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .subtitle1!,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
          ).toList(),
        ),
      ),
    );
  }
}