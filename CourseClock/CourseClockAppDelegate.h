//
//  CourseClockAppDelegate.h
//  CourseClock
//
//  Created by 高橋 啓治郎 on 11/05/18.
//  Copyright 2011 none. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;

@interface CourseClockAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet MainViewController *mainViewController;

@end
