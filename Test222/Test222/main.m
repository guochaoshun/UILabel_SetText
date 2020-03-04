//
//  main.m
//  Test222
//
//  Created by 珠珠 on 2019/10/15.
//  Copyright © 2019 zhuzhu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

typedef struct Node * Node;

struct Node {
    NSInteger value ;
    Node * next ;
};


Node  mergeTwoList(Node  n1,Node  n2) {
    if (n1==NULL) {
        return n2;
    }
    if (n2==NULL) {
        return n1;
    }
    Node head ={-1,NULL};
    Node current = head;
    while (n1!=NULL && n2!=NULL) {
        
        if (n1->value < n2->value) {
            current->next = n1;
            n1 = n1->next;
            current = current->next;
        } else {
            current->next = n2;
            n2 = n2->next;
            current = current->next;

        }
        
    }
    
    if (n1==NULL) {
        current->next = n2;
    }
    if (n2==NULL) {
        current->next = n1;
    }
    
    
    return head->next;
}


int main(int argc, char * argv[]) {
    
    
    
    
    
    
    
    
    
    
    
    
    
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
