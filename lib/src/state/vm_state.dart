import 'package:flutter/material.dart';

import '../view_model.dart';

/// Binds [ViewModel] to widget
///
/// Does not react to changes of [ViewModel]
///
abstract class VmState<D extends VMData, VM extends ViewModel<D>,
    W extends StatefulWidget> extends State<W> {
  @protected
  VM Function(
    BuildContext context,
  ) get vmBuilder;

  @protected
  D? get vmData => null;

  @protected
  VM get vm => _vm;

  late final VM _vm;

  @override
  void initState() {
    super.initState();

    _vm = vmBuilder(context);
    _vm.onInit(vmData);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _vm.onDidChangeDependencies(vmData);
  }

  @override
  void didUpdateWidget(covariant oldWidget) {
    super.didUpdateWidget(oldWidget);

    _vm.onUpdate(vmData);
  }

  @override
  void dispose() {
    vm.dispose();

    super.dispose();
  }
}

/// Binds [NotifierViewModel] to widget
/// Subscribes to changes of VM.
abstract class NotifierVmState<VM extends NotifierViewModel<VMData>,
    W extends StatefulWidget> extends VmState<VMData, VM, W> {
  @override
  void initState() {
    super.initState();

    _vm.addListener(_update);
  }

  @override
  void dispose() {
    vm.removeListener(_update);

    super.dispose();
  }

  void _update() {
    setState(() {});
  }
}
