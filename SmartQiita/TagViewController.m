//
//  TagViewController.m
//  SmartQiita
//
//  Created by yutaka on 2014/09/10.
//  Copyright (c) 2014年 yutaka. All rights reserved.
//

#import "TagViewController.h"
#import "TagViewCell.h"

@interface TagViewController ()

@property NSArray *tags;

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
    self.tags = [NSArray arrayWithObjects:@"ruby",@"javascript",@"rails",@"php",@"ios",@"objective-c",@"python",@"android",@"c",@"git",@"java",@"linux",@"mac",@"vim",@"node",@"xcode",@"iphone",@"mysql",@"aws",@"vagrant",@"jquery",@"centos",@"emacs",@"ubuntu",@"css",@"windows",@"macosx",@"bash",@"swift",@"scala",@"shellscript",@"どう書く",@"haskell",@"github",@"coffeescript",@"docker",@"html",@"go",@"zsh",@"perl",@"qiita",@"r",@"chef",@"heroku",@"html5",@"angularjs",@"unity",@"apache",@"homebrew",@"nginx",@"wordpress",@"osx",@"rspec",@"yhpg",@"eclipse",@"chrome",@"shell",@"adventcalendar",@"jenkins",@"ssh",@"mongodb",@"unity3d",@"virtualbox",@"sublimetext2",@"cakephp",@"twitter",@"clojure",@"grunt",@"cocos2d",@"ansible",@"groovy",@"titanium",@"ec2",@"gem",@"markdown",@"test",@"postgresql",@"fluentd",@"facebook",@"fuelphp",@"backbone",@"golang",@"tmux",@"capistrano",@"rbenv",@"django",@"css3",@"rails4",@"redmine",@"debian",@"laravel",@"excel",@"bootstrap",@"xamarin",@"terminal",@"sass",@"gitlab",@"sql",@"unix",@"googleappsscript", nil];
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
    
    cell.tagLabel.text = self.tags[indexPath.row];

    return cell;
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
