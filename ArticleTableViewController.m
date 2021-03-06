//
//  ArticleTableViewController.m
//  SmartQiita
//
//  Created by yutaka on 2014/09/10.
//  Copyright (c) 2014年 yutaka. All rights reserved.
//

#import "ArticleTableViewController.h"
#import "ArticleTableViewCell.h"
#import "DetailViewController.h"

@interface ArticleTableViewController ()

@property NSArray *articles;
@property NSDictionary *sendArticle;

@end

@implementation ArticleTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.title = self.recieveTag;
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
    return self.recieveArticles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ArticleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"articleCell" forIndexPath:indexPath];
    
    // ユーザー画像の準備
    NSURL *url = [NSURL URLWithString:self.recieveArticles[indexPath.row][@"user_image_url"]];
    UIImage *placeholderImage = [UIImage imageNamed:@"placeholder.png"];
    
    // セルをセット
    cell.titleLabel.text = self.recieveArticles[indexPath.row][@"title"]; // タイトル
    cell.userLabel.text = self.recieveArticles[indexPath.row][@"user_name"]; // ユーザー名
    cell.stockLabel.text = [self.recieveArticles[indexPath.row][@"stock_count"] stringValue]; // ストック数
    [cell.userImageView sd_setImageWithURL:url placeholderImage:placeholderImage]; // ユーザー画像

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.sendArticle = self.recieveArticles[indexPath.row];
    [self performSegueWithIdentifier:@"next" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"next"])
    {
        // Get reference to the destination view controller
        DetailViewController *detailViewController = [segue destinationViewController];
        detailViewController.recieveArticle = self.sendArticle;
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
