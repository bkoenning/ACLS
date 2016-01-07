//
//  DrugDose.h
//  ACLS
//
//  Created by Brandon Koenning on 1/3/16.
//  Copyright © 2016 Brandon Koenning. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DrugDose : NSObject

@property NSString *titleString;
@property NSDate *timeGiven;
@property NSDate *previousTimeGiven;
@property int dosesGiven;

-(NSString*)timeLastGivenString;
-(void) addDose;

@end
