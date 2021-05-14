//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"

#if __has_include(<cipher2/Cipher2Plugin.h>)
#import <cipher2/Cipher2Plugin.h>
#else
@import cipher2;
#endif

#if __has_include(<flutter_string_encryption/FlutterStringEncryptionPlugin.h>)
#import <flutter_string_encryption/FlutterStringEncryptionPlugin.h>
#else
@import flutter_string_encryption;
#endif

#if __has_include(<sms/SmsPlugin.h>)
#import <sms/SmsPlugin.h>
#else
@import sms;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [Cipher2Plugin registerWithRegistrar:[registry registrarForPlugin:@"Cipher2Plugin"]];
  [FlutterStringEncryptionPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterStringEncryptionPlugin"]];
  [SmsPlugin registerWithRegistrar:[registry registrarForPlugin:@"SmsPlugin"]];
}

@end
