import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvp_project/db/app_database.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  final AppDatabase db;

  ThemeCubit(this.db) : super(ThemeMode.light) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final saved = await db.getTheme();
    if (saved == 'dark') {
      emit(ThemeMode.dark);
    } else {
      emit(ThemeMode.light);
    }
  }

  Future<void> toggleTheme() async {
    final newMode =
    state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

    emit(newMode);
    await db.saveTheme(newMode == ThemeMode.dark ? 'dark' : 'light');
  }
}
