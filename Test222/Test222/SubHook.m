//
//  SubHook.m
//  Test222
//
//  Created by 珠珠 on 2019/11/20.
//  Copyright © 2019 zhuzhu. All rights reserved.
//

#import "SubHook.h"

@implementation SubHook

+ (void)initialize {
    NSLog(@"%@ SubHook initialize",[self class]);
}
+ (void)load {
    NSLog(@"SubHook load");
}



@end
