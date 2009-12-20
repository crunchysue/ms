//
//  MainViewController.m
//  MileyCyrus
//
//  Created by Sue Brown on 12/19/09.
//  Copyright House of Crunchy 2009. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"

@implementation MainViewController

@synthesize curTitle;
@synthesize songListBreakout;
@synthesize songListHannaMontanaMovie;
@synthesize songListTimeOfOurLives;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
		
		self.songListBreakout = [NSArray arrayWithObjects:
								 @"Breakout",
								 @"7 Things", 
								 @"The Driveway", 
								 @"Girls Just Wanna Have Fun", 
								 @"Full Circle", 
								 @"Fly On The Wall", 
								 @"Bottom Of The Ocean", 
								 @"Wake Up America", 
								 @"Four Walls", 
								 @"Simple Song", 
								 @"Goodbye", 
								 @"See You Again", 
								 nil];
		
		self.songListHannaMontanaMovie = [NSArray arrayWithObjects:
										  @"Don't Walk Away",
										  @"Hoedown Throwdown",
										  @"Dream",
										  @"The Climb",
										  @"Butterfly Fly Away",
										  nil];
		
		self.songListTimeOfOurLives = [NSArray arrayWithObjects:
									   @"Kicking And Screaming",
									   @"Party In The U.S.A",
									   @"When I Look At You",
									   @"Time Of Our Lives",
									   @"Talk Is Cheap",
									   @"Obsessed",
									   @"Before The Storm",
									   nil];
									
		
    }
    return self;
}



 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
 [super viewDidLoad];
	 [songsTable reloadData];	 
 }
 


/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */


- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller {
    
	[self dismissModalViewControllerAnimated:YES];
}



- (IBAction)showInfo {    
	
	FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
	controller.delegate = self;
	
	controller.songTitle = self.curTitle;
	
	NSLog(@"curTitle = %@", self.curTitle);
	
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:controller animated:YES];
	
	[controller release];
	
	
}

#pragma mark -
#pragma mark Table Callbacks



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}


// a required callback
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	switch (section) {
		case 0:
			return [songListHannaMontanaMovie count];
			break;
		case 1:
			return [songListBreakout count];
			break;
		case 2:
			return [songListTimeOfOurLives count];
			break;
		default:
			return 0;
			break;
	}
		
}


// a required callback
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
	
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	
	switch (indexPath.section) {
		case 0:
			cell.textLabel.text = [songListHannaMontanaMovie objectAtIndex:indexPath.row];
			break;
		case 1:
			cell.textLabel.text = [songListBreakout objectAtIndex:indexPath.row];
			break;
		case 2:
			cell.textLabel.text = [songListTimeOfOurLives objectAtIndex:indexPath.row];
			break;
		default:
			break;
	}
		
	return cell;
}

// a required callback
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {	
		
	switch (indexPath.section) {
		case 0:
			self.curTitle = [songListHannaMontanaMovie objectAtIndex:indexPath.row];
			break;
		case 1:
			self.curTitle = [songListBreakout objectAtIndex:indexPath.row];
			break;
		case 2:
			self.curTitle = [songListTimeOfOurLives objectAtIndex:indexPath.row];
			break;
		default:
			break;
	}
		
	[self showInfo];
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {	
	
	switch (section) {
		case 0:
			return @"Album: Hanna Montana: The Movie";
			break;
		case 1:
			return @"Album: Breakout";
			break;
		case 2:
			return @"Album: The Time Of Our Lives";
			break;
		default:
			return nil;
			break;
	}
}




/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
	[songListBreakout release];
	[songListTimeOfOurLives release];
	[songListHannaMontanaMovie release];
}


@end
