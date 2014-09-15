//
//  TagViewController.m
//  SmartQiita
//
//  Created by yutaka on 2014/09/10.
//  Copyright (c) 2014年 yutaka. All rights reserved.
//

#import "TagViewController.h"
#import "TagViewCell.h"
#import "MenuTableViewController.h"

@interface TagViewController ()

@property NSArray *tags;
@property NSArray *selectedItems;
@property NSArray *selectedTags;

@end

@implementation TagViewController

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
    // Do any additional setup after loading the view.
    self.tags = [NSArray arrayWithObjects:@"Ruby",@"Javascript",@"Rails",@"php",@"ios",@"objective-c",@"python",@"android",@"c",@"git",@"Java",@"linux",@"mac",@"vim",@"node",@"xcode",@"iphone",@"mysql",@"aws",@"vagrant",@"jquery",@"centos",@"emacs",@"ubuntu",@"css",@"windows",@"macosx",@"bash",@"swift",@"scala",@"shellscript",@"どう書く",@"haskell",@"github",@"coffeescript",@"docker",@"html",@"go",@"zsh",@"perl",@"qiita",@"R",@"chef",@"heroku",@"html5",@"angularjs",@"unity",@"apache",@"homebrew",@"nginx",@"wordpress",@"osx",@"rspec",@"YHPG",@"eclipse",@"chrome",@"shell",@"adventcalendar",@"jenkins",@"ssh",@"mongodb",@"unity3D",@"Virtualbox",@"sublimetext2",@"cakephp",@"twitter",@"clojure",@"grunt",@"cocos2D",@"ansible",@"groovy",@"titanium",@"EC2",@"gem",@"markdown",@"test",@"postgresql",@"fluentd",@"facebook",@"fuelphp",@"Backbone",@"golang",@"tmux",@"capistrano",@"rbenv",@"django",@"css3",@"Rails4",@"redmine",@"debian",@"laravel",@"excel",@"bootstrap",@"xamarin",@"terminal",@"sass",@"gitlab",@"sql",@"unix",@"googleappsscript", nil];
    
    self.collectionView.allowsMultipleSelection = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.tags.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    TagViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];

    UIView *selectedView = [UIView new];
    selectedView.backgroundColor = [UIColor darkGrayColor];
    NSString *tagName = self.tags[indexPath.row];
    
    cell.tagLabel.text = tagName;
    cell.tagImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",tagName]];
    cell.selectedBackgroundView = selectedView;
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedItems = [self.collectionView indexPathsForSelectedItems];
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

- (IBAction)addTag:(id)sender {
    self.selectedTags = [[NSArray alloc] init];
    for (NSIndexPath *item in self.selectedItems) {
        TagViewCell *cell = (TagViewCell *)[self.collectionView cellForItemAtIndexPath:item];
        self.selectedTags = [self.selectedTags arrayByAddingObject:cell.tagLabel.text];
    }
    MenuTableViewController* mtvc = (MenuTableViewController*)(self.navigationController.viewControllers[0]);
    mtvc.tags = self.selectedTags;
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
