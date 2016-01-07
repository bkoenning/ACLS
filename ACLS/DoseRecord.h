//
//  DoseRecord.h
//  ACLS
//
//  Created by Brandon Koenning on 1/3/16.
//  Copyright © 2016 Brandon Koenning. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DoseRecord : NSObject

@property NSString *titleString;
@property NSDate *timeGiven;

-(NSString*)timeGivenString;

@end
