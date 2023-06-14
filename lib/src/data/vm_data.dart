/// Data for ViewModel initialization or update
///
/// Must be with valid equals overrides!
abstract class VMData {}

/// Simple wrapper over one value data
///
/// ```
/// final data = "Hello";
/// final simpleData = SimpleData(data);
/// ```
class SimpleVmData<T> extends VMData {
  final T data;

  SimpleVmData(this.data);
}
