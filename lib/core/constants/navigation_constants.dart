import 'package:flutter/material.dart';

enum Pages {
  root,
  loading,
  homePage,
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
    }
  }
}
