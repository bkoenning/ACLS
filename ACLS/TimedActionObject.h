//
//  TimedActionObject.h
//  ACLS
//
//  Created by Brandon Koenning on 1/6/16.
//  Copyright © 2016 Brandon Koenning. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimedActionObject : NSObject

@property NSDate *timeStarted;
@property NSString *title;
@property NSTimer *durationTimer;
@property int secondsSinceLast;

-(NSString *)timeSinceLastString;
-(NSString *)timeStartedString;

-(void)start;
-(void)stop;

@end
