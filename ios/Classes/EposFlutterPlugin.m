#import "EposFlutterPlugin.h"
#if __has_include(<epos_flutter/epos_flutter-Swift.h>)
#import <epos_flutter/epos_flutter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "epos_flutter-Swift.h"
#endif

@implementation EposFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftEposFlutterPlugin registerWithRegistrar:registrar];
}
@end
