//
//  NameTableViewController.m
//  Labb3
//
//  Created by Karis on 2014-04-24.
//  Copyright (c) 2014 easnyang. All rights reserved.
//

#import "NameTableViewController.h"
#import "AddNewNameViewController.h"
#import "Task.h"



@interface NameTableViewController ()
@property (nonatomic, strong) NSMutableArray* nameList;
@property (nonatomic) int chosenIndex;

@end

@implementation NameTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // init
    //self.nameList = [[NSMutableArray alloc] init];
	
	// for testing
	//self.nameList = [@[@"Karis", @"Salgo", @"Martin", @"Niklas"] mutableCopy];
    
    // with task class
    self.nameList = [[NSMutableArray alloc] init];
    Task* name1 = [[Task alloc] initWithName:@"Karis"];
    [self.nameList addObject:name1];
    name1 = [[Task alloc] initWithName:@"Salgo"];
    [self.nameList addObject:name1];
    name1 = [[Task alloc] initWithName:@"Martin"];
    [self.nameList addObject:name1];
    name1 = [[Task alloc] initWithName:@"Niklas"];
    [self.nameList addObject:name1];
    //NSLog(@"Name: %@", name1.name);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
	//NSLog(@"array size is %d", self.nameList.count);
	
    return self.nameList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    
    // get index number for showing index.
    cell.textLabel.text = [self.nameList[indexPath.row] name];
    
    if([self.nameList[indexPath.row] isTaskDone])
    {
        cell.backgroundColor = [UIColor colorWithRed:0.81 green:0.91 blue:0.81 alpha:1.0];
    }
    
    return cell;
}
- (IBAction)removeChosenName:(id)sender
{
    // set this one as done.
    [self.nameList[self.chosenIndex] setTaskAsDone];
    
    
    /*
    for(int i = 0; i < self.nameList.count; i++)
    {
        if([self.nameList[i] isTaskDone])
        {
            //[self.nameList removeObjectAtIndex:self.chosenIndex];
        }
    }
    */
	
	// update data after removing element
	[self.tableView reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"Selected section>> %d",indexPath.section);
    NSLog(@"Selected row of section >> %d",indexPath.row);
	self.chosenIndex = indexPath.row;
}

#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
	if([segue.identifier isEqualToString:@"add"])
    {
        AddNewNameViewController* addView = [segue destinationViewController];
		
		// preparing connection to nameList MutableArray in AddNewNameViewContoller
        addView.nameList = self.nameList;
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
	// Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/





@end
