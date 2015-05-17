//
//  LEWMyToDoListViewController.m
//  MyToDoList(使用Interface Builder)
//
//  Created by William Lee on 5/17/15.
//  Copyright (c) 2015 LEW. All rights reserved.
//

#import "LEWMyToDoListViewController.h"

@interface LEWMyToDoListViewController ()

@property (nonatomic, weak) IBOutlet UITableView *myTableView;
@property (nonatomic, weak) NSMutableArray *myDataArray;      //这个是store the data as strings
@property (nonatomic, weak) IBOutlet UITextField *myTextField;
@property (nonatomic, weak) UIButton *myButton;       //前三个分别加了3个可视元素

- (IBAction)addTask:(id)mySender;

@end

@implementation LEWMyToDoListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.myDataArray = [NSMutableArray array];
    _myTableView.dataSource=self;
    _myTableView.delegate=self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view management

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    // Because this table view only has one section,
    // the number of rows in it is equal to the number
    // of items in the data array
    return [self.myDataArray count];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // To improve performance, this method first checks
    // for an existing cell object that we can reuse
    // If there isn't one, then a new cell is created
    UITableViewCell *c = [self.myTableView dequeueReusableCellWithIdentifier:@"Cell"];
    // Then we (re)configure the cell based on the model object,
    // in this case the data array, ...
    NSString *item = [self.myDataArray objectAtIndex:indexPath.row];
    c.textLabel.text = item;
    // ... and hand the properly configured cell back to the table view
    return c;
}

#pragma mark - Actions

- (IBAction)addTask:(id)mySender
{
    NSString *text = [self.myTextField text];
    if ([text length] == 0) {
        NSLog(@"Nothing entered!!");
        return;
    }
    // Log text to console
    NSLog(@"Task entered: %@", text);
    
    //***********************//
    // Add it to the working array
    [self.myDataArray addObject:text];
    // Refresh the table so that the new item shows up
    [self.myTableView reloadData];
    NSLog(@"%@",self.myTableView.dataSource);
    //***********************//
    
    [self.myTextField setText:@""];
    [self.myTextField resignFirstResponder];
}


@end
