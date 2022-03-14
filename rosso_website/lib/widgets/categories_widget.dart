import 'package:flutter/material.dart';
import 'package:rosso_website/models/category_model.dart';
import 'package:rosso_website/utils/scree_size.dart';
import 'package:rosso_website/widgets/category_tile.dart';

class CategoriesWidget extends StatelessWidget {
  final ScreenSize size = ScreenSize();
  final List<CategoryModel> categories;
  final bool isInDrawer;

  CategoriesWidget({Key? key, required this.categories, required this.isInDrawer,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white70),
          borderRadius: BorderRadius.circular(5),
          color: Colors.white54,
        ),
        child: Column(
          children: [
            SizedBox(height: 10,),
            Visibility(
              visible: !size.isMobile(context: context),
              child: Text("CATEGORIAS", style: TextStyle(fontSize: 20, color: Colors.grey[800]),)),
            SizedBox(height: 10,),
            Column(
              children: categories.map((e) => CategoryTile(category: e,)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
