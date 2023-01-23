class Printer {
  String? target;
  String? ipAddress;
  String? macAddress;
  String? bdAddress;
  String? deviceName;
  int? deviceType;
  String? printerType;
  int? printerSeries;
  String? connectionType;
}

class PrintObj {
  PrintObj();
  String? key;
  dynamic value;

  toMap() {
    return {'key': key, 'value': value};
  }
}

class PrintText extends PrintObj {
  PrintText(String text) : super() {
    key = 'text';
    value = '$text\n';
  }
}

class PrintTextCenter extends PrintObj {
  PrintTextCenter(String text) : super() {
    key = 'textCenter';
    value = '$text\n';
  }
}

class PrintTextRight extends PrintObj {
  PrintTextRight(String text) : super() {
    key = 'textRight';
    value = '$text\n';
  }
}

class PrintFeed extends PrintObj {
  PrintFeed(int lines) : super() {
    key = 'feed';
    value = lines;
  }
}

class PrintLine extends PrintObj {
  PrintLine(int lineThickness) : super() {
    key = 'hline';
    value = lineThickness;
  }
}

class PrintCut extends PrintObj {
  PrintCut(int type) : super() {
    key = 'cut';
    value = type;
  }
}

class PrintDrawer extends PrintObj {
  PrintDrawer(int type) : super() {
    key = 'drawer';
    value = type;
  }
}
