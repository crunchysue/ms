//
//  MainViewController.h
//  TaylorSwift
//
//  Created by Sue Brown on 12/12/09.
//  Copyright House of Crunchy 2009. All rights reserved.
//

#import "FlipsideViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, 
												  UITableViewDelegate, 
												  UITableViewDataSource> {
	
	IBOutlet UITableView *songsTable;
	NSString *curTitle;
	NSArray *songListBreakout;
	NSArray *songListHannaMontanaMovie;
	NSArray *songListTimeOfOurLives;
	
}

@property (nonatomic, retain) NSString *curTitle;
@property (nonatomic, retain) NSArray *songListBreakout;
@property (nonatomic, retain) NSArray *songListHannaMontanaMovie;
@property (nonatomic, retain) NSArray *songListTimeOfOurLives;

- (IBAction) showInfo;

@end
