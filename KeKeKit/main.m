//
//  main.m
//  KeKeKit
//
//  Created by 陈志科 on 2020/10/7.
//

#import <UIKit/UIKit.h>
#import "KeKeAppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([KeKeAppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
