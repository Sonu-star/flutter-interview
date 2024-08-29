import 'dart:convert';

import 'package:gbs/global_export.dart';
import 'package:http/http.dart' as http;

const JsonDecoder _decoder = JsonDecoder();

class NetUtil {
  static final NetUtil _instance = NetUtil.internal();
  String token = '';

  NetUtil.internal();

  factory NetUtil() => _instance;

  Future<dynamic> get(
      {required String url, required bool isTokenAvailable}) async {
    Map<String, String> headers = await header(isTokenAvailable);
    return http
        .get(
      Uri.parse(url),
      headers: headers,
    )
        .then((http.Response response) async {
      var result = await responseCodeCheck(response);
      if (result != Null) {
        return await _decoder.convert(result);
      } else {
        return Null;
      }
    });
  }

  Future<dynamic> post(
      {required String url,
      required bool isTokenAvailable,
      required body}) async {
            print('URL ---> $url');

    Map<String, String> headers = await header(isTokenAvailable);
    return await http
        .post(Uri.parse(url), headers: headers, body: body)
        .then((http.Response response) async {
      print('DRAGO   ddddd--> ${response.body}');
      var result = await responseCodeCheck(response);
      if (result != Null) {
        return await _decoder.convert(result);
      } else {
        return Null;
      }
    });
  }
}

header(token) async {
  if (token) {
    return {
      "Accept": "application/json",
      "Content-Type": "application/json; charset=UTF-8",
      "Authorization": "Scoodel token"
    };
  } else {
    return {
      "Accept": "application/json",
      "Content-Type": "application/json; charset=UTF-8",
    };
  }
}

responseCodeCheck(response) {
  try {
    var res = response.body;

    final int statusCode = response.statusCode;

    if (statusCode == 100) {
      errorToast('Continue');
    } else if (statusCode == 101) {
      errorToast('Switching Protocol');
    } else if (statusCode == 102) {
      errorToast('Processing (WebDAV)');
    } else if (statusCode == 103) {
      errorToast('Early Hints');
    } else if (statusCode == 200) {
      return res; //OK
    } else if (statusCode == 201) {
      return res; // Created
    } else if (statusCode == 202) {
      errorToast('Accepted');
    } else if (statusCode == 203) {
      errorToast('Non-Authoritative Information');
    } else if (statusCode == 204) {
      errorToast('No Content');
    } else if (statusCode == 205) {
      errorToast('Reset Content');
    } else if (statusCode == 206) {
      errorToast('Partial Content');
    } else if (statusCode == 207) {
      errorToast('Multi-Status (WebDAV)');
    } else if (statusCode == 208) {
      return res; // Already Reported (WebDAV)
    } else if (statusCode == 226) {
      errorToast(
          _decoder.convert(res)['error'] ?? _decoder.convert(res)['message']);
      return Null;
    } else if (statusCode == 300) {
      errorToast('Multiple Choices');
    } else if (statusCode == 301) {
      errorToast('Moved Permanently');
    } else if (statusCode == 302) {
      errorToast('Found');
    } else if (statusCode == 303) {
      errorToast('See Other');
    } else if (statusCode == 304) {
      errorToast('Not Modified');
    } else if (statusCode == 305) {
      errorToast('Use Proxy');
    } else if (statusCode == 306) {
      errorToast('(Unused)');
    } else if (statusCode == 307) {
      errorToast('Temporary Redirect');
    } else if (statusCode == 308) {
      errorToast('Permanent Redirect (experimental)');
    } else if (statusCode == 400) {
      errorToast(_decoder.convert(res)['error'].toString());
      return Null;
    } else if (statusCode == 401) {
      errorToast('Unauthorised user?');
    } else if (statusCode == 402) {
      errorToast('Payment Required (Experimental)');
    } else if (statusCode == 403) {
      errorToast('Forbidden');
    } else if (statusCode == 404) {
      errorToast('Not Found');
      return Null;
    } else if (statusCode == 405) {
      errorToast('Method Not Allowed');
    } else if (statusCode == 406) {
      errorToast('Not Acceptable');
    } else if (statusCode == 407) {
      errorToast('Proxy Authentication Required');
    } else if (statusCode == 408) {
      errorToast('Request Timeout');
    } else if (statusCode == 409) {
      errorToast('Conflict');
    } else if (statusCode == 410) {
      errorToast('Gone');
    } else if (statusCode == 411) {
      errorToast('Length Required');
    } else if (statusCode == 412) {
      errorToast('Precondition Failed');
    } else if (statusCode == 413) {
      errorToast('Request Entity Too Large');
    } else if (statusCode == 414) {
      errorToast('Request-URI Too Long');
    } else if (statusCode == 415) {
      errorToast('Unsupported Media Type');
    } else if (statusCode == 416) {
      errorToast('Requested Range Not Satisfiable');
    } else if (statusCode == 417) {
      errorToast('Expectation Failed');
    } else if (statusCode == 418) {
      errorToast('I’m a teapot');
    } else if (statusCode == 420) {
      errorToast('Enhance Your Calm');
    } else if (statusCode == 422) {
      errorToast('Unprocessable Entity (WebDAV)');
    } else if (statusCode == 423) {
      errorToast('Locked (WebDAV)');
    } else if (statusCode == 424) {
      errorToast('Failed Dependency (WebDAV)');
    } else if (statusCode == 425) {
      errorToast('Too Early (WebDAV)');
    } else if (statusCode == 426) {
      errorToast('Upgrade Required');
    } else if (statusCode == 428) {
      errorToast('Precondition Required');
    } else if (statusCode == 429) {
      errorToast('You have requested too may times');
    } else if (statusCode == 431) {
      errorToast('Request Header Fields Too Large');
    } else if (statusCode == 444) {
      errorToast('No Response (Nginx)');
    } else if (statusCode == 449) {
      errorToast(' Retry With (Microsoft)');
    } else if (statusCode == 450) {
      errorToast('Blocked by Windows Parental Controls (Microsoft)');
    } else if (statusCode == 451) {
      errorToast('Unavailable For Legal Reasons');
    } else if (statusCode == 499) {
      errorToast('Client Closed Request (Nginx)');
    } else if (statusCode == 500) {
      errorToast('Internal Server Error');
    } else if (statusCode == 501) {
      errorToast('Not Implemented');
    } else if (statusCode == 502) {
      errorToast('Bad Gateway');
    } else if (statusCode == 503) {
      errorToast('Service Unavailable');
    } else if (statusCode == 504) {
      errorToast('Gateway Timeout');
    } else if (statusCode == 505) {
      errorToast('HTTP Version Not Supported (Experimental)');
    } else if (statusCode == 506) {
      errorToast('Variant Also Negotiates (Experimental)');
    } else if (statusCode == 507) {
      errorToast('Insufficient Storage (WebDAV)');
    } else if (statusCode == 508) {
      errorToast('Loop Detected');
    } else if (statusCode == 510) {
      errorToast('Not Extended');
    } else if (statusCode == 511) {
      errorToast('Network Authentication Required');
    }
  } catch (e) {
    if (kDebugMode) {
      print(e.toString());
    }
  }
}
