import 'package:flutter_to_debian/flutter_to_debian.dart';
import 'package:flutter_to_debian/vars.dart';
import 'package:test/test.dart';


void main() {
  group('validate yaml parsing', () {

    test('check arch', () async {

      var result = await Vars.parseDebianYaml(debianYaml : "./test/debian/debian.yaml");

      expect(result?.flutterArch, "x64");
      expect(result?.debianControl.debArch, "amd64");

      result = await Vars.parseDebianYaml(debianYaml : "./test/debian/debian.arm64.yaml");

      expect(result?.flutterArch, "arm64");
      expect(result?.debianControl.debArch, "arm64");

    });


  });
}