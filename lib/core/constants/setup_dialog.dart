import 'package:go_cart_rider/app/locator.dart';
import 'package:go_cart_rider/core/enums/dialog_type.dart';
import 'package:go_cart_rider/ui/widgets/dialogs/loader_dialog.dart';
import 'package:stacked_services/stacked_services.dart';

void setupDialog() {
  final DialogService _dialogService = locator<DialogService>();

  final builders = {
    DialogType.loader: ( context, sheetRequest, completer) => LoaderDialog(request: sheetRequest)
  };

  _dialogService.registerCustomDialogBuilders(builders);
}