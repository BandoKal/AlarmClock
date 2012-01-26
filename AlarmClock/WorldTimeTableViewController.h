//
//  WorldTimeTableViewController.h
//  AlarmClock
//
//  Created by  on 1/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WorldTimeTableViewController : UITableViewController


@property (strong, nonatomic) NSArray *mainList;
@property (strong, nonatomic) NSTimer *timer;


-(void)updateTimer;

@end
