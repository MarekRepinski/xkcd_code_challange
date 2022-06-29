import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xkcd_code_challange/data/services/services.dart';
import 'package:xkcd_code_challange/presentation/controllers/home_page_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final DataBaseService _db = Get.find();
  final _controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    final PageController pageController =
    PageController(initialPage: _db.currentComicIndex.value);
    return PageView.builder(
      controller: pageController,
      itemCount: _db.comicsList.length,
      itemBuilder: (context, position) {
        _controller.checkForLoading(position);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'XKCD Comics',
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                // Get.bottomSheet(
                //   bottomSheet(context, position),
                //   backgroundColor: Colors.white,
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(20.0)),
                // );
              },
              child: FractionallySizedBox(
                widthFactor: 1.0,
                heightFactor: 0.95,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        _db.comicsList[position].title,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.merge(
                            const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Flexible(
                        child: Image.network(
                          _db.comicsList[position].img,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
