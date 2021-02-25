#import "AutofillHelperPlugin.h"
#if __has_include(<autofill_helper/autofill_helper-Swift.h>)
#import <autofill_helper/autofill_helper-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "autofill_helper-Swift.h"
#endif

@implementation AutofillHelperPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAutofillHelperPlugin registerWithRegistrar:registrar];
}
@end
