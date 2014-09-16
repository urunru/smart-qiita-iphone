//
//  MenuTableViewController.m
//  SmartQiita
//
//  Created by yutaka on 2014/09/10.
//  Copyright (c) 2014年 yutaka. All rights reserved.
//

#import "MenuTableViewController.h"
#import "ArticleTableViewController.h"

@interface MenuTableViewController ()

@property NSString *sendTag;
@property NSArray *sendArticles;

@end

@implementation MenuTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)setSelectedTags
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    self.tags = [ud arrayForKey:@"SELECTED_TAGS"];
}

-(void)setArticles;
{
    NSString *strTags = [self.tags componentsJoinedByString:@","];
    NSString *escapedString = [strTags stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];
    NSString *url = [NSString stringWithFormat:@"http://smart-qiita.herokuapp.com/article/?tags=%@", escapedString];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    NSData *json = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    self.articles = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"タグ一覧";
}

-(void) viewWillAppear:(BOOL)animated {
    [self setSelectedTags];
    [self setArticles];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.tags.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.tags[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.sendTag = self.tags[indexPath.row];
    self.sendArticles = [self.articles filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(tag == %@)", self.sendTag]];
    
    [self performSegueWithIdentifier:@"next" sender:self];
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

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"next"])
    {
        // Get reference to the destination view controller
        ArticleTableViewController *articleViewController = [segue destinationViewController];
        articleViewController.recieveTag = self.sendTag;
        articleViewController.recieveArticles = self.sendArticles;
    }
}
@end
