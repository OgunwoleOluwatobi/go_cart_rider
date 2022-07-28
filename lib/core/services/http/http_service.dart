

import 'package:go_cart_rider/core/models/formatted_response.dart';

abstract class HttpService {
  /// Send GET request to endpoint/[route] and return the `response`
  /// - if successful: returns decoded json data
  ///
  /// - throws `NetworkException` if GET fails
  Future<FormattedResponse> getHttp(String route, {Map<String, dynamic> params});

  /// Send POST request with [body] to endpoint/[route] and return the `response`
  /// - if successful: returns decoded json data
  ///
  /// - throws `NetworkException` if POST request fails
  Future<FormattedResponse> postHttp(String route, dynamic body, {Map<String, dynamic> params});

  /// Send POST request with [body] to endpoint/[route] and return the `response`
  /// - if successful: returns decoded json data
  ///
  /// - throws `NetworkException` if POST request fails
  Future<dynamic> putHttp(String route, dynamic body, {Map<String, dynamic> params});

  /// Send DELETE request to endpoint/[route] and return the `response`
  /// - if successful: returns decoded json data
  ///
  /// - throws `NetworkException` if DELETE fails
  Future<dynamic> deleteHttp(String route, {Map<String, dynamic> params});

  /// Set the header to use for further requests
  setHeader();

  /// Clear headers set
  clearHeaders();

  void dispose();
}