//
//  MasterViewController.m
//  Every.Do
//
//  Created by Chris Dean on 2018-02-27.
//  Copyright © 2018 Chris Dean. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ToDo.h"
#import "ToDoTableViewCell.h"
#import "AddToDoItemViewController.h"

@interface MasterViewController () <UITableViewDataSource, UITabBarDelegate>

@property NSMutableArray *objects;
@property NSMutableArray *toDoObjects;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    //create nav bar button to add new todo items
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    UISwipeGestureRecognizer *gesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipe:)];
    [gesture setDirection: (UISwipeGestureRecognizerDirectionLeft |UISwipeGestureRecognizerDirectionRight)];
    [self.tableView addGestureRecognizer:gesture];
    
    //Create todo list objects and add them to array
    ToDo *firstToDo = [[ToDo alloc] initWithTitle:@"Gym" withDescription:@"Curls 4 the Gurlz" withPriorityNumber:1];
    ToDo *secondToDo = [[ToDo alloc] initWithTitle:@"Homework" withDescription:@"Create table view LOL" withPriorityNumber:3];
    ToDo *thirdToDo = [[ToDo alloc] initWithTitle:@"Clean Dishes" withDescription:@"Dishwasher is broken sucker!" withPriorityNumber:2];
    _toDoObjects = [[NSMutableArray alloc] init];
    [self.toDoObjects addObject:firstToDo];
    [self.toDoObjects addObject:secondToDo];
    [self.toDoObjects addObject:thirdToDo];
    
}

- (void)viewWillAppear:(BOOL)animated {
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didSwipe:(UIGestureRecognizer*)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        CGPoint swipeLocation = [gestureRecognizer locationInView:self.tableView];
        NSIndexPath *swipedIndexPath = [self.tableView indexPathForRowAtPoint:swipeLocation];
        //ToDoTableViewCell* swipedCell = [self.tableView cellForRowAtIndexPath:swipedIndexPath];
        ToDo *object = self.toDoObjects[swipedIndexPath.row];
        [self.toDoObjects removeObjectAtIndex:swipedIndexPath.row];
        [self.toDoObjects addObject:object];
        [object didCompleteItem];
        
        //Make cell turn red and move to bottom of tableview when it is completed.
        NSInteger lastRowNumber = [self.tableView numberOfRowsInSection:0] - 1;
        NSIndexPath* ip = [NSIndexPath indexPathForRow:lastRowNumber inSection:0];
        ToDoTableViewCell* movedCell = [self.tableView cellForRowAtIndexPath:swipedIndexPath];
        [movedCell didComplete];
        [self.tableView moveRowAtIndexPath:swipedIndexPath toIndexPath:ip];

        [self.tableView reloadData];
    }
}

- (void)insertNewObject:(id)sender {
    
    AddToDoItemViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"AddToDoVC"];
    vc.delegate = self;
    vc.modalPresentationStyle = UIModalPresentationPopover;
    [self.navigationController presentViewController:vc animated:YES completion:nil];
    
}

- (void)addToDoItem:(ToDo*)toDoItem {
    
    [self.toDoObjects addObject:toDoItem];
    [self.tableView reloadData];
    
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ToDo *object = self.toDoObjects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        [controller setDetailItem:object];
    }
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.toDoObjects.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ToDoTableViewCell *toDoCell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    ToDo *toDoObject = self.toDoObjects[indexPath.row];
    
    toDoCell.titleLabel.text = toDoObject.title;
    toDoCell.descriptionLabel.text = toDoObject.todoDescription;
    toDoCell.priorityLabel.text = [NSString stringWithFormat:@"%d", toDoObject.priorityNumber];
    
    return toDoCell;
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
//
//    NSDate *object = self.objects[indexPath.row];
//    cell.textLabel.text = [object description];
//    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.toDoObjects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}


@end
