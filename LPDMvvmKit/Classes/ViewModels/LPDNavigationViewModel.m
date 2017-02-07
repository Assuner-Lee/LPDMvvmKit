//
//  LPDNavigationViewModel.m
//  LPDMvvm
//
//  Created by foxsofter on 15/10/13.
//  Copyright © 2015年 foxsofter. All rights reserved.
//

#import "LPDNavigationViewModel.h"
#import "LPDWeakArray.h"

NS_ASSUME_NONNULL_BEGIN

@interface LPDNavigationViewModel ()

@property (nullable, nonatomic, strong) LPDWeakArray<id<LPDViewModelProtocol>> *weakViewModels;

@end

@implementation LPDNavigationViewModel

@synthesize presentedViewModel = _presentedViewModel;
@synthesize presentingViewModel = _presentingViewModel;
@synthesize tabBar = _tabBar;

#pragma mark - life cycle

- (instancetype)initWithRootViewModel:(__kindof id<LPDViewModelProtocol>)viewModel {
  self = [super init];
  if (self) {
    _weakViewModels = [LPDWeakArray array];
    [_weakViewModels addObject:viewModel];
    viewModel.navigation = self;
  }
  return self;
}

#pragma mark - navigation methods

- (void)pushViewModel:(__kindof id<LPDViewModelProtocol>)viewModel animated:(BOOL)animated {
}

- (void)popViewModelAnimated:(BOOL)animated {
}

- (void)popToRootViewModelAnimated:(BOOL)animated {
}

- (void)presentNavigationViewModel:(__kindof id<LPDNavigationViewModelProtocol>)viewModel
                          animated:(BOOL)animated
                        completion:(nullable void (^)())completion {
}

- (void)dismissNavigationViewModelAnimated:(BOOL)animated completion:(nullable void (^)())completion {
}

#pragma mark - properties

- (_Nullable __kindof id<LPDViewModelProtocol>)topViewModel {
  return [_weakViewModels lastObject];
}

- (_Nullable __kindof id<LPDViewModelProtocol>)visibleViewModel {
  if (_presentedViewModel) {
    return _presentedViewModel;
  }
  return [_weakViewModels lastObject];
}

- (void)setPresentedViewModel:(__kindof id<LPDNavigationViewModelProtocol> _Nullable)presentedViewModel {
  _presentedViewModel = presentedViewModel;
}

- (NSArray<__kindof id<LPDViewModelProtocol>> *)viewModels {
  return [_weakViewModels toArray];
}

#pragma mark - reactive navigation methods

- (void)_pushViewModel:(__kindof id<LPDViewModelProtocol>)viewModel {
  [_weakViewModels addObject:viewModel];
  viewModel.navigation = self;
}

- (void)_popViewModel {
  if (_weakViewModels.count > 1) {
    [_weakViewModels removeLastObject];
  }
}

- (void)_popToRootViewModel {
  if (_weakViewModels.count > 1) {
    [_weakViewModels removeObjectsInRange:NSMakeRange(1, _weakViewModels.count - 1)];
  }
}

- (void)_presentNavigationViewModel:(__kindof id<LPDNavigationViewModelProtocol>)viewModel {
  _presentedViewModel = viewModel;
  _presentedViewModel.presentingViewModel = self;
}

- (void)_dismissNavigationViewModel {
  if (_presentedViewModel) {
    [_presentedViewModel
      dismissNavigationViewModelAnimated:NO
                    completion:^{
                      [((NSObject *)self.presentingViewModel) setNilValueForKey:@"presentedViewModel"];
                    }];
  } else {
    _presentingViewModel.presentedViewModel = nil;
  }
}
@end

NS_ASSUME_NONNULL_END
