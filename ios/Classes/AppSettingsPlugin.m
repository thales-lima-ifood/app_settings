#import "AppSettingsPlugin.h"

@implementation AppSettingsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"app_settings"
            binaryMessenger:[registrar messenger]];
  AppSettingsPlugin* instance = [[AppSettingsPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
      NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    UIApplication *application = [UIApplication sharedApplication];
    if ([application respondsToSelector:@selector(openURL:options:completionHandler:)]) {
        [application openURL:url options:@{}
           completionHandler:^(BOOL success) {
        }];
    } else {
        if ([application canOpenURL:url]){
            [application openURL:url];
        }
    }
}

@end
