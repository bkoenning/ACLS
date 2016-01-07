//
//  TimedActionCell.h
//  ACLS
//
//  Created by Brandon Koenning on 1/5/16.
//  Copyright © 2016 Brandon Koenning. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimedActionCell : UITableViewCell

@property IBOutlet UILabel *labelTitle;
@property IBOutlet UILabel *labelTimeStarted;
@property IBOutlet UILabel *labelTimeElapsed;

@end
