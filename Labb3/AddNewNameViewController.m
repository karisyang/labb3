//
//  AddNewNameViewController.m
//  Labb3
//
//  Created by HyoJin Yang on 26/04/14.
//  Copyright (c) 2014 easnyang. All rights reserved.
//

#import "AddNewNameViewController.h"
#import "Task.h"

@interface AddNewNameViewController ()
@property (weak, nonatomic) IBOutlet UITextField *givenName;

@end

@implementation AddNewNameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
	{
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addNewName:(id)sender
{
    Task* name1 = [[Task alloc] initWithName:self.givenName.text];
    [self.nameList addObject:name1];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
