//
//  UILabel+SafeSetText.m
//  test
//
//  Created by EDZ on 2020/4/29.
//  Copyright © 2020 EDZ. All rights reserved.
//

#import "UILabel+SafeSetText.h"
@import ObjectiveC.runtime;


@implementation UILabel (SafeSetText)


- (void)setText:(NSString *)text {
    
    if (text == nil) {
        text = @"";
    }

    if ([text isKindOfClass:[NSString class] ] == NO) {
        text =  text.description;
    }
    // 调用系统的原始方法,
    // 1.从方法列表中倒序寻找,类别中的方法在最前面,如果正序寻找需要遍历完,倒序可以break
    // 2.找到第一个匹配的就是系统的原始方法,
    // 3.用原始方法的imp指针调用
    u_int count = 0;
    // class_copyMethodList只会找本类的方法,如果是UILabel的子类会找不到而崩溃,所以这里必须是[UILabel class]
    Method * methods = class_copyMethodList([UILabel class], &count);
    NSInteger index = -1;
    for (int i = count-1; i>=0; i--) {
        SEL tempSel = method_getName(methods[i]);
        NSString * strName = [NSString stringWithCString:sel_getName(tempSel) encoding:NSUTF8StringEncoding];
        NSLog(@"%d  %@",i,strName);
        if (tempSel == _cmd) {
            index = i;
            break;
        }
        
    }
    NSAssert(index != -1, @"未找到指定的方法");
    
    SEL resultSel = method_getName(methods[index]);
    IMP imp = method_getImplementation(methods[index]);
    
    ( (void (*) (id,SEL,NSString *)) imp)(self,resultSel,text);
    
}



@end
