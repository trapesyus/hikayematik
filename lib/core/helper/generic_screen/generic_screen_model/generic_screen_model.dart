import 'package:mobx/mobx.dart';

import '../../../../model/generic_model/generic_model.dart';
import '../../../../model/generic_model/generic_service/generic_service.dart';

part 'generic_screen_model.g.dart';

final GenericScreenModel genericInstance = GenericScreenModel._internal();
class GenericScreenModel = _GenericScreenModelBase with _$GenericScreenModel;

abstract class _GenericScreenModelBase with Store {
  _GenericScreenModelBase._internal();

  factory _GenericScreenModelBase() {
    return genericInstance;
  }

  @observable
  List<GenericModel> data = ObservableList.of([]);
  final GenericService _service = GenericService();
  @observable
  bool isLoading = false;
  @observable
  bool isPrinting = false;

  @action
  Future<void> initialize(String tableName) async {
    isLoading = false;
    await getData(tableName).whenComplete(() => isLoading = true);
  }

  @action
  Future<void> getData(String tableName) async {
    isPrinting = true;
    data.clear();
    data.addAll(await _service.getData(tableName));

    isPrinting = false;
  }
}
