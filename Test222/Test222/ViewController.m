//
//  ViewController.m
//  Test222
//
//  Created by 珠珠 on 2019/10/15.
//  Copyright © 2019 zhuzhu. All rights reserved.
//

#import "ViewController.h"
#import "SubHook.h"

#define Min(A,B) (A)<(B)?(A):(B)

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@property (nonatomic, copy) NSString * orderId;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    [SubHook new];
    
    [self asyncConCurrent];
    
//    NSMutableString * s = [[NSMutableString alloc] initWithString:@"abc"];
//
//    self.orderId = s;
//    NSLog(@"%@",self.orderId);
//
//
//    [s appendString:@"123"];
//    NSLog(@"%@",self.orderId);
//
//
//    NSInteger a = 5;
//    NSInteger b = 10;
//
//    a = a + b; //==15
//    b = a - b; // 15 -10 = 5
//    a = a - b; // 15 - 5 = 10
//
//
//    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
//    NSMutableString * str = [[NSMutableString alloc] initWithString:@"123"];
//    [dic setObject:@"100" forKey:str];
//    NSLog(@"%p %@",&str,str);
//    [str appendString:@"456"];
//
//    NSLog(@"str : %@",dic[str]);
//
//
//    NSLog(@"%@",dic);
//
//
//    NSLog(@"-----------------");
//
//    NSCache * cache = [[NSCache alloc] init];
//    cache.totalCostLimit = 100;
//    [cache setObject:@"100" forKey:str];
//    NSLog(@"%p %@",&str,str);
//
////    [str appendString:@"789"];
//    NSLog(@"%p %@",&str,str);
//
//    NSLog(@"str %@",[cache objectForKey:str]);
//
//    NSLog(@"123456 %@",[cache objectForKey:@"123456"]);
//
//    NSLog(@"%@",cache);
    
//    UIButton
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
 
    
    NSLog(@"touchesBegan %@",touches);
}


- (void)asyncConCurrent {
    NSLog(@"asyncConCurrent---begin");
    
    dispatch_queue_t queue = dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        NSLog(@"11111");
        for (NSInteger i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"1---%zd", i);
        }
    });
    
    dispatch_async(queue, ^{
        NSLog(@"22222");
        for (NSInteger i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"2---%zd", i );
        }
    });
    
    NSLog(@"asyncConCurrent---end");
}


- (void)addDeveloperTest1 {
    NSLog(@"%s", __func__);
}

- (void)addTwoDeveloperTest1 {
    NSLog(@"%s", __func__);
}

@end
