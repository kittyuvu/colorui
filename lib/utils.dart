// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

/// https://gist.github.com/whiplashoo/afe1c8e542c6bf8e8b2659eb9d9a4071
Color hexOrRGBToColor(String colorStr) {
  RegExp hexColorRegex =
      RegExp(r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6}|[0-9a-fA-F]{8})$');
  if (colorStr.startsWith("rgba")) {
    List rgbaList = colorStr.substring(5, colorStr.length - 1).split(",");
    return Color.fromRGBO(int.parse(rgbaList[0]), int.parse(rgbaList[1]),
        int.parse(rgbaList[2]), double.parse(rgbaList[3]));
  } else if (colorStr.startsWith("rgb")) {
    List rgbList = colorStr
        .substring(4, colorStr.length - 1)
        .split(",")
        .map((c) => int.parse(c))
        .toList();
    return Color.fromRGBO(rgbList[0], rgbList[1], rgbList[2], 1.0);
  } else if (hexColorRegex.hasMatch(colorStr)) {
    if (colorStr.length == 4) {
      colorStr = colorStr + colorStr.substring(1, 4);
    }
    if (colorStr.length == 7) {
      int colorValue = int.parse(colorStr.substring(1), radix: 16);
      return Color(colorValue).withOpacity(1.0);
    } else {
      int colorValue = int.parse(colorStr.substring(1, 7), radix: 16);
      double opacityValue =
          int.parse(colorStr.substring(7), radix: 16).toDouble() / 255;
      return Color(colorValue).withOpacity(opacityValue);
    }
  } else if (colorStr.isEmpty) {
    throw UnsupportedError("Empty color field found.");
  } else if (colorStr == 'none') {
    return Colors.transparent;
  } else {
    throw UnsupportedError(
        "Only hex, rgb, or rgba color format currently supported. String:  $colorStr");
  }
}

String colorToHex(Color c) {
  return "#${(c.value.toRadixString(16))..padLeft(8, '0').toUpperCase()}";
}

_shift(List l) {
  if (l.isNotEmpty) {
    var first = l.first;
    l.removeAt(0);
    return first;
  }
  return null;
}

RegExp _ipv4Maybe = RegExp(r'^(\d?\d?\d)\.(\d?\d?\d)\.(\d?\d?\d)\.(\d?\d?\d)$');
RegExp _ipv6 =
    RegExp(r'^::|^::1|^([a-fA-F0-9]{1,4}::?){1,7}([a-fA-F0-9]{1,4})$');

/// check if the string [str] is IP [version] 4 or 6
///
/// * [version] is a String or an `int`.
bool isIP(String? str, [/*<String | int>*/ version]) {
  version = version.toString();
  if (version == 'null') {
    return isIP(str, 4) || isIP(str, 6);
  } else if (version == '4') {
    if (!_ipv4Maybe.hasMatch(str!)) {
      return false;
    }
    var parts = str.split('.');
    parts.sort((a, b) => int.parse(a) - int.parse(b));
    return int.parse(parts[3]) <= 255;
  }
  return version == '6' && _ipv6.hasMatch(str!);
}

/// check if the string [str] is a fully qualified domain name (e.g. domain.com).
///
/// * [requireTld] sets if TLD is required
/// * [allowUnderscore] sets if underscores are allowed
bool isFQDN(String str,
    {bool requireTld = true, bool allowUnderscores = false}) {
  var parts = str.split('.');
  if (requireTld) {
    var tld = parts.removeLast();
    if (parts.isEmpty || !RegExp(r'^[a-z]{2,}$').hasMatch(tld)) {
      return false;
    }
  }

  for (var part in parts) {
    if (allowUnderscores) {
      if (part.contains('__')) {
        return false;
      }
    }
    if (!RegExp(r'^[a-z\\u00a1-\\uffff0-9-]+$').hasMatch(part)) {
      return false;
    }
    if (part[0] == '-' ||
        part[part.length - 1] == '-' ||
        part.contains('---')) {
      return false;
    }
  }
  return true;
}

/// check if the string [str] is a URL
///
/// * [protocols] sets the list of allowed protocols
/// * [requireTld] sets if TLD is required
/// * [requireProtocol] is a `bool` that sets if protocol is required for validation
/// * [allowUnderscore] sets if underscores are allowed
/// * [hostWhitelist] sets the list of allowed hosts
/// * [hostBlacklist] sets the list of disallowed hosts
bool isURL(String? str,
    {List<String?> protocols = const ['http', 'https', 'ftp'],
    bool requireTld = true,
    bool requireProtocol = false,
    bool allowUnderscore = false,
    List<String> hostWhitelist = const [],
    List<String> hostBlacklist = const []}) {
  if (str == null ||
      str.isEmpty ||
      str.length > 2083 ||
      str.startsWith('mailto:')) {
    return false;
  }

  var protocol,
      user,
      auth,
      host,
      hostname,
      port,
      portStr,
      path,
      query,
      hash,
      split;

  // check protocol
  split = str.split('://');
  if (split.length > 1) {
    protocol = _shift(split);
    if (!protocols.contains(protocol)) {
      return false;
    }
  } else if (requireProtocol == true) {
    return false;
  }
  str = split.join('://');

  // check hash
  split = str!.split('#');
  str = _shift(split);
  hash = split.join('#');
  if (hash != null && hash != "" && RegExp(r'\s').hasMatch(hash)) {
    return false;
  }

  // check query params
  split = str!.split('?');
  str = _shift(split);
  query = split.join('?');
  if (query != null && query != "" && RegExp(r'\s').hasMatch(query)) {
    return false;
  }

  // check path
  split = str!.split('/');
  str = _shift(split);
  path = split.join('/');
  if (path != null && path != "" && RegExp(r'\s').hasMatch(path)) {
    return false;
  }

  // check auth type urls
  split = str!.split('@');
  if (split.length > 1) {
    auth = _shift(split);
    if (auth.indexOf(':') >= 0) {
      auth = auth.split(':');
      user = _shift(auth);
      if (!RegExp(r'^\S+$').hasMatch(user)) {
        return false;
      }
      if (!RegExp(r'^\S*$').hasMatch(user)) {
        return false;
      }
    }
  }

  // check hostname
  hostname = split.join('@');
  split = hostname.split(':');
  host = _shift(split);
  if (split.length > 0) {
    portStr = split.join(':');
    try {
      port = int.parse(portStr, radix: 10);
    } catch (e) {
      return false;
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(portStr) || port <= 0 || port > 65535) {
      return false;
    }
  }

  if (!isIP(host) &&
      !isFQDN(host,
          requireTld: requireTld, allowUnderscores: allowUnderscore) &&
      host != 'localhost') {
    return false;
  }

  if (hostWhitelist.isNotEmpty && !hostWhitelist.contains(host)) {
    return false;
  }

  if (hostBlacklist.isNotEmpty && hostBlacklist.contains(host)) {
    return false;
  }

  return true;
}
