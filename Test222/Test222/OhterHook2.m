//
//  OhterHook2.m
//  Test222
//
//  Created by 珠珠 on 2019/10/26.
//  Copyright © 2019 zhuzhu. All rights reserved.
//

#import "OhterHook2.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import <UIKit/UIKit.h>


@implementation OhterHook2


+ (void)load {
    
//    SEL origSel = @selector(setText:) ;
//    SEL altSel = @selector(setTextHooked:) ;
//
//    Method origMethod = class_getInstanceMethod([UILabel class], origSel);
//    // 给UILabel添加一个方法,然后在交换.不需要在类别中实现
//    class_addMethod([UILabel class],altSel,
//                    (IMP)setTextHooked,
//                    "v@:@");
//    Method altMethod = class_getInstanceMethod([UILabel class], altSel);
//    method_exchangeImplementations(origMethod,altMethod);
    
}

/// 主要是解决 服务器有时返回NSNumber类型,但是用了NSString指针接收,在 label.text = @(num) 时崩溃
void setTextHooked(id self , SEL _cmd,NSString * string) {
 
    
    if (string == nil) {
        string = @"";
    }
    if ([string isKindOfClass:[NSNumber class]]) {
        NSLog(@"怎么回事,小兄弟,传个Number过来,邪门歪道22,偶尔有用");
        string = string.description;
    }
    
    if ([string isKindOfClass:[NSString class]] && [string containsString:@"(null)"]) {
        string = [string stringByReplacingOccurrencesOfString:@"(null)" withString:@""];
    }
    
    // 这里的self是UILabel,_cmd是setText:
    objc_msgSend(self, @selector(setTextHooked:),string.description);
    
}
/// 没用,只是为了消除警告
- (void) setTextHooked:(NSString *)string {}


@end
