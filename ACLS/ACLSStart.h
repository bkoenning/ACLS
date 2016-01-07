//
//  ACLSStart.h
//  ACLS
//
//  Created by Brandon Koenning on 12/26/15.
//  Copyright © 2015 Brandon Koenning. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ACLSStart : NSObject

@property NSDate *startTime;
@property NSString *titleString;
@property NSTimer *codeTimer;
@property int secondsInCode;

-(NSString*) startTimeString;
-(BOOL)isStarted;
-(void)start;
-(NSString*)timeInCode;



@end
