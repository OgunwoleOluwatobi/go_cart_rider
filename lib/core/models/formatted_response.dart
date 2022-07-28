class FormattedResponse {
  final bool success;
  final dynamic data;
  final String? message;

  FormattedResponse({required this.success, this.message, this.data});
}