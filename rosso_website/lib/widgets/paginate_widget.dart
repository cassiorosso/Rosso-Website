import 'package:flutter/material.dart';
import 'package:rosso_website/utils/scree_size.dart';

class PaginateWidget extends StatelessWidget {
  final int currentPage;
  final int pages;
  final size = ScreenSize();
  final Function changePage;
  final Function jumpToTop;

  PaginateWidget(
      {Key? key,
      required this.currentPage,
      required this.pages,
      required this.changePage,
      required this.jumpToTop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Builder(builder: (context) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: currentPage != 1,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 2,
                          primary: Colors.red,
                          onPrimary: Colors.white),
                      onPressed: () {
                        jumpToTop();
                        changePage(currentPage - 1);
                      },
                      child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                          child: Text("< Página anterior",
                              style: TextStyle(fontSize: 17)))),
                ),
                Visibility(
                    visible: currentPage > 1 && currentPage < pages,
                    child: SizedBox(
                      width: 10,
                    )),
                Visibility(
                  visible: currentPage != pages,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 2,
                          primary: Colors.red,
                          onPrimary: Colors.white),
                      onPressed: () {
                        jumpToTop();
                        changePage(currentPage + 1);
                      },
                      child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                          child: Text(
                            "Próxima página >",
                            style: TextStyle(fontSize: 17),
                          ))),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Visibility(
              visible: pages > 1,
              child: Container(
                width: 50,
                child: TextField(
                  onSubmitted: (text) {
                    int pageNumber = int.tryParse(text) ?? currentPage;
                    print(pageNumber);
                    if (pageNumber == currentPage)
                      ;
                    else if (pageNumber >= 0 && pageNumber <= pages) {
                      jumpToTop();
                      changePage(pageNumber);
                    }
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(),
                      labelText: currentPage.toString(),
                      //hintText: currentPage.toString()
                      ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Text("Página $currentPage de $pages"),
            )
          ],
        );
      }),
    );
  }
}
