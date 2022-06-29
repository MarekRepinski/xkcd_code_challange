import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xkcd_code_challange/data/services/services.dart';
import 'package:xkcd_code_challange/core/constants/constants.dart';
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
            title: Text(Pages.homePage.getDisplayName),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FractionallySizedBox(
              widthFactor: 1.0,
              heightFactor: 0.95,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            splashColor: Colors.blue.withAlpha(30),
                            onTap: () {
                              _controller.showExplaination(position);
                            },
                            child: const Icon(
                              Icons.info_outline,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          const Icon(
                            Icons.share,
                            color: Colors.black,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          InkWell(
                            splashColor: Colors.red.withAlpha(30),
                            onTap: () {
                              _controller.toggleFavo(position);
                            },
                            child: Obx(() {
                              return _controller.favoIcon.value;
                            }),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      _db.comicsList[position].title,
                      style: Theme.of(context).textTheme.headlineSmall?.merge(
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
        );
      },
    );
  }
}
