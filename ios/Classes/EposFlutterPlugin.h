#import <Flutter/Flutter.h>
#import <ePOS2.h>
#import <ePOSEasySelect.h>

@interface EposFlutterPlugin : NSObject<FlutterPlugin, Epos2DiscoveryDelegate, Epos2PtrReceiveDelegate>


- (void)startEpsonDiscovery:(Epos2FilterOption *)option forChannel:(FlutterMethodChannel *)channel;
+ (NSString *)printList:(NSArray *)list toPrinter:(NSString *)target withPrinterSeries:(int)printerSeries;
- (int)getPrinterSeries:(NSString *)printerName;

@end
