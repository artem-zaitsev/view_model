import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'data/vm_data.dart';

export 'data/vm_data.dart';

/// Interface for ViewModel
abstract class ViewModel<D extends VMData> {
  D? _initData;

  D? get initData => _initData;

  /// Called on initState()
  @mustCallSuper
  void onInit(D? data) {
    _initData = data;
  }

  /// Called on didChangeDependencies()
  /// [data] can differ from current
  @mustCallSuper
  void onDidChangeDependencies(D? data) {
    
  }

  /// Called on didUpdateWidget()
  @mustCallSuper
  void onUpdate(D? data) {
    if (data != _initData) {
      _initData = data;
    }
  }

  /// Called on dispose()
  void dispose();
}

/// [ViewModel] which can be listened from UI
class NotifierViewModel<D extends VMData> extends ViewModel<D>
    with ChangeNotifier {
  @mustCallSuper
  @override
  void dispose() {
    super.dispose();
  }
}
