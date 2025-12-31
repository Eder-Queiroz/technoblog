import 'package:flutter/material.dart';
import 'package:mobile/views/utils/common_app_bar.dart';

class ArticleDetailScreen extends StatefulWidget {
  final String id;
  const ArticleDetailScreen({super.key, required this.id});

  @override
  State<ArticleDetailScreen> createState() => _ArticleDetailScreenState();
}

class _ArticleDetailScreenState extends State<ArticleDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CommonAppBar(),
      body: SafeArea(child: Center(child: Text('Article Detail'))),
    );
  }
}
