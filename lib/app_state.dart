import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _watchlist = prefs.getStringList('ff_watchlist') ?? _watchlist;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _watchlist = [];
  List<String> get watchlist => _watchlist;
  set watchlist(List<String> value) {
    _watchlist = value;
    prefs.setStringList('ff_watchlist', value);
  }

  void addToWatchlist(String value) {
    _watchlist.add(value);
    prefs.setStringList('ff_watchlist', _watchlist);
  }

  void removeFromWatchlist(String value) {
    _watchlist.remove(value);
    prefs.setStringList('ff_watchlist', _watchlist);
  }

  void removeAtIndexFromWatchlist(int index) {
    _watchlist.removeAt(index);
    prefs.setStringList('ff_watchlist', _watchlist);
  }

  void updateWatchlistAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _watchlist[index] = updateFn(_watchlist[index]);
    prefs.setStringList('ff_watchlist', _watchlist);
  }

  void insertAtIndexInWatchlist(int index, String value) {
    _watchlist.insert(index, value);
    prefs.setStringList('ff_watchlist', _watchlist);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
