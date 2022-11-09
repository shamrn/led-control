import 'package:rgb_control/models/mode.dart';
import 'package:rgb_control/services/mode/mode_provider.dart';

class ModeRepository {
  final ModeProvider _modeProvider = ModeProvider();

  Future<List<Mode>> getModes() => _modeProvider.getModes();
}
