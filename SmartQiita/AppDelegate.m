//
//  AppDelegate.m
//  SmartQiita
//
//  Created by yutaka on 2014/09/10.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    NSArray *all_tags = [NSArray arrayWithObjects:@"ruby",@"javascript",@"rails",@"php",@"ios",@"objective-c",@"python",@"android",@"c",@"git",@"java",@"linux",@"mac",@"vim",@"node",@"xcode",@"iphone",@"mysql",@"aws",@"vagrant",@"jquery",@"centos",@"emacs",@"ubuntu",@"css",@"windows",@"macosx",@"bash",@"swift",@"scala",@"shellscript",@"どう書く",@"haskell",@"github",@"coffeescript",@"docker",@"html",@"go",@"zsh",@"perl",@"qiita",@"r",@"chef",@"heroku",@"html5",@"angularjs",@"unity",@"apache",@"homebrew",@"nginx",@"wordpress",@"osx",@"rspec",@"yhpg",@"eclipse",@"chrome",@"shell",@"adventcalendar",@"jenkins",@"ssh",@"mongodb",@"unity3d",@"virtualbox",@"sublimetext2",@"cakephp",@"twitter",@"clojure",@"grunt",@"cocos2d",@"ansible",@"groovy",@"titanium",@"ec2",@"gem",@"markdown",@"test",@"postgresql",@"fluentd",@"facebook",@"fuelphp",@"backbone",@"golang",@"tmux",@"capistrano",@"rbenv",@"django",@"css3",@"rails4",@"redmine",@"debian",@"laravel",@"excel",@"bootstrap",@"xamarin",@"terminal",@"sass",@"gitlab",@"sql",@"unix",@"googleappsscript", nil];
    NSArray *default_tags = [NSArray arrayWithObjects:@"ruby",@"javascript",@"rails",@"php",@"ios",@"objective-c",@"python",@"android",@"c",@"git", nil];

    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:all_tags forKey:@"ALL_TAGS"];
    [ud setObject:default_tags forKey:@"DEFAULT_TAGS"];
    [ud synchronize];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
