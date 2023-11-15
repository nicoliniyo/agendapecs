// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:io';

import 'package:app/pages/design_system.dart';
import 'package:app/theme/custom_theme.dart';
import 'package:app/theme/theme_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Sets a platform override for desktop to avoid exceptions. See
// https://flutter.dev/desktop#target-platform-override for more info.
void _enablePlatformOverrideForDesktop() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux)) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
}

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 161, 174, 189),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 4, 93, 196),
);

void main() {
  _enablePlatformOverrideForDesktop();
  runApp(AgendaPecsApp());
}

ThemeManager _themeManager = ThemeManager();

class AgendaPecsApp extends StatefulWidget {

  @override
  _AgendaPecsApp createState() => _AgendaPecsApp();

}

class _AgendaPecsApp extends State<AgendaPecsApp> {

  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if(mounted) {
      setState(() {
        
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agenda PECS',
      
      themeMode: _themeManager.themeMode,
      
      theme: lightTheme,
      darkTheme: darkTheme,
      home: DesignSystem(themeManager: _themeManager),
    );
  }
}
