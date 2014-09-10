//
//  DetailViewController.m
//  SmartQiita
//
//  Created by yutaka on 2014/09/10.
//  Copyright (c) 2014年 yutaka. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

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
    
    // Stringオブジェクトをつくります
    NSString* urlString = self.recieveArticle[@"url"];
    // これを使って、URLオブジェクトをつくります
    NSURL* googleURL = [NSURL URLWithString: urlString];
    // さらにこれを使って、Requestオブジェクトをつくります
    NSURLRequest* myRequest = [NSURLRequest requestWithURL: googleURL];
    // これを、myFirstWebViewのloadRequestメソッドに渡します
    [self.webView loadRequest:myRequest];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
