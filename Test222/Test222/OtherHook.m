//
//  OtherHook.m
//  Test222
//
//  Created by 珠珠 on 2019/10/26.
//  Copyright © 2019 zhuzhu. All rights reserved.
//

#import "OtherHook.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import <UIKit/UIKit.h>
@implementation OtherHook


+ (void)load {
    
    SEL origSel = @selector(setText:) ;
    SEL altSel = @selector(setTextHooked:) ;
    
    Method origMethod = class_getInstanceMethod([UILabel class], origSel);
    Method altMethod = class_getInstanceMethod(self, altSel);
    if (!origMethod || !altMethod) {
        return ;
    }
    method_exchangeImplementations(origMethod,altMethod);
    
}

/// 主要是解决 服务器有时返回NSNumber类型,但是用了NSString指针接收,在 label.text = @(num) 时崩溃
- (void) setTextHooked:(NSString *)string {
    
    
    if (string == nil) {
        string = @"";
    }
    if ([string isKindOfClass:[NSNumber class]]) {
        NSLog(@"怎么回事,小兄弟,传个Number过来,邪门歪道,偶尔有用");
        string = string.description;
    }
    
    if ([string isKindOfClass:[NSString class]] && [string containsString:@"(null)"]) {
        string = [string stringByReplacingOccurrencesOfString:@"(null)" withString:@""];
    }

    // 这里的self是UILabel,_cmd是setText:
    // 这样不行,因为UILabel中没有这个setTextHooked:,所以会找不到方法崩溃
    //    [self setTextHooked:string.description] ;
    // 这也不行,会递归
//    objc_msgSend(self, @selector(setText:),string.description);
    
    // 多次尝试这个才行,获取到原始方法的imp,通过imp调用原始方法,完成设置text
    Method altMethod = class_getInstanceMethod([OtherHook class], @selector(setTextHooked:));
    IMP origImp = method_getImplementation(altMethod);
    origImp(self,_cmd,string.description);
    
    
}




@end
