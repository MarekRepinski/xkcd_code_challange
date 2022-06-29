import 'package:flutter/material.dart';

enum Pages {
  root,
  loading,
  homePage,
  xkcdExplain,
}

extension PagesExtension on Pages {
  String get name {
    switch (this) {
      case Pages.root:
        return '/';
      case Pages.loading:
        return '/loading';
      case Pages.homePage:
        return '/homePage';
      case Pages.xkcdExplain:
        return '/xkcdExplain';
    }
  }

  // Normally used in AppBar
  String get getDisplayName {
    switch (this) {
      case Pages.root:
        return '/';
      case Pages.loading:
        return 'Loading screen';
      case Pages.homePage:
        return 'XKCD Strip';
      case Pages.xkcdExplain:
        return 'XKCD Explained!';
    }
  }

  //Normally used in menus
  IconData get getDisplayIcon {
    switch (this) {
      case Pages.root:
        return Icons.error;
      case Pages.loading:
        return Icons.download;
      case Pages.homePage:
        return Icons.home;
      case Pages.xkcdExplain:
        return Icons.info;
    }
  }
}
