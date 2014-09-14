//
//  ArticleTableViewController.h
//  SmartQiita
//
//  Created by yutaka on 2014/09/10.
//  Copyright (c) 2014年 yutaka. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleTableViewController : UITableViewController

@property (strong, nonatomic) NSString *recieveTag;
@property (strong, nonatomic) NSArray *recieveArticles;

@end
