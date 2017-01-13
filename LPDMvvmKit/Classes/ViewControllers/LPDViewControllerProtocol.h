//
//  LPDViewControllerProtocol.h
//  LPDMvvm
//
//  Created by foxsofter on 15/10/11.
//  Copyright © 2015年 foxsofter. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LPDViewModelProtocol;

@protocol LPDViewControllerProtocol <NSObject>

@required

@property (nullable, nonatomic, strong, readonly) __kindof id<LPDViewModelProtocol> viewModel;

@property(nullable, nonatomic,readonly,strong) UINavigationController *navigationController;

@property(nonatomic,readonly) NSArray<__kindof UIViewController *> *childViewControllers NS_AVAILABLE_IOS(5_0);

- (void)addChildViewController:(UIViewController *)childController NS_AVAILABLE_IOS(5_0);

- (void)removeFromParentViewController NS_AVAILABLE_IOS(5_0);

@end

NS_ASSUME_NONNULL_END
