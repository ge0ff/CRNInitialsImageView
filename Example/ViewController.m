//
//  ViewController.m
//  CRNInitialsImageView
//
//  Created by Geoff Cornwall on 7/17/13.
//  Copyright (c) 2013 Geoff Cornwall. All rights reserved.
//

#import "ViewController.h"
#import "CRNInitialsImageView.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Default to circles
        _isCircle = TRUE;
        
        // Load dummy set of names
        _names = [[NSMutableArray alloc] initWithObjects:[[NSArray alloc] initWithObjects:@"Bruce", @"Wayne", nil],
                  [[NSArray alloc] initWithObjects:@"Tony", @"Stark", nil],
                  [[NSArray alloc] initWithObjects:@"Steve", @"Rodgers", nil],
                  [[NSArray alloc] initWithObjects:@"Thor", @"Odinson", nil],
                  [[NSArray alloc] initWithObjects:@"Bruce", @"Banner", nil],
                  [[NSArray alloc] initWithObjects:@"Clark", @"Kent", nil],
                  [[NSArray alloc] initWithObjects:@"Diana", @"Prince", nil],
                  [[NSArray alloc] initWithObjects:@"Ben", @"Grimm", nil],
                  [[NSArray alloc] initWithObjects:@"Natalia", @"Romanova", nil],
                  [[NSArray alloc] initWithObjects:@"Hal", @"Jordan", nil],
                  [[NSArray alloc] initWithObjects:@"Victor", @"Stone", nil],
                  [[NSArray alloc] initWithObjects:@"Peter", @"Parker", nil],
                  nil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // UISegmentedControl to choose between circle / rounded rect image
    UISegmentedControl *imgSwitch = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"Circle", @"Rounded Rect", nil]];
    [imgSwitch sizeToFit];
    imgSwitch.segmentedControlStyle = UISegmentedControlStyleBar;
    imgSwitch.selectedSegmentIndex = 0;
    [imgSwitch addTarget:self action:@selector(valueChanged:) forControlEvents: UIControlEventValueChanged];
    self.navigationItem.titleView = imgSwitch;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_names count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Get the username from dummy data
    NSArray *nameArray = [_names objectAtIndex:indexPath.row];
    NSString *firstName = [nameArray objectAtIndex:0];
    NSString *lastName = [nameArray objectAtIndex:1];
    
    // Implementation example of CRNInitialsImageView
    CRNInitialsImageView *crnImageView = [[CRNInitialsImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    crnImageView.initialsBackgroundColor = [self randomColor];
    crnImageView.initialsTextColor = [UIColor whiteColor];
    crnImageView.initialsFont = [UIFont fontWithName:@"HelveticaNeue" size:18];
    crnImageView.useCircle = _isCircle ? TRUE : FALSE; // setting value based on UISegmentedControl
    crnImageView.firstName = firstName;
    crnImageView.lastName = lastName;
    [crnImageView drawImage];
    
    // Set the cell data
    cell.imageView.image = crnImageView.image;
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", firstName, lastName];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)valueChanged:(UISegmentedControl *)segment {
    if(segment.selectedSegmentIndex == 0) {
        _isCircle = TRUE;
        [self.tableView reloadData];
    }
    else if(segment.selectedSegmentIndex == 1){
        _isCircle = FALSE;
        [self.tableView reloadData];
    }
}

- (UIColor *)randomColor {
    CGFloat hue = (arc4random() % 128 / 256.0) + 0.25;
    CGFloat saturation = (arc4random() % 128 / 256.0) + 0.25;
    CGFloat brightness = (arc4random() % 128 / 256.0) + 0.25;
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end
