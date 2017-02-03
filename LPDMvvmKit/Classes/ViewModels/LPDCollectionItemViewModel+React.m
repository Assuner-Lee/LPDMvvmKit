//
//  LPDCollectionCellViewModel+React.m
//  LPDMvvmKit
//
//  Created by foxsofter on 16/2/22.
//  Copyright © 2016年 eleme. All rights reserved.
//

#import <objc/runtime.h>
#import "LPDCollectionItemViewModel+React.h"
#import "LPDCollectionViewModel+React.h"

@implementation LPDCollectionItemViewModel (React)

- (RACSignal *)didLoadViewSignal {
  return [self.viewModel didLoadViewSignal];
}

- (RACSignal *)didLayoutSubviewsSignal {
  return [self.viewModel didLayoutSubviewsSignal];
}

- (RACSignal *)didBecomeActiveSignal {
  return [self.viewModel didBecomeActiveSignal];
}

- (RACSignal *)didBecomeInactiveSignal {
  return [self.viewModel didBecomeInactiveSignal];
}

- (LPDScrollingState)scrollingtState {
  return [self.viewModel scrollingtState];
}

- (void)setScrollingtState:(LPDScrollingState)scrollingtState {
  [self.viewModel setScrollingtState:scrollingtState];
}

- (BOOL)isSubmitting {
  return [self.viewModel isSubmitting];
}

- (void)setSubmitting:(BOOL)submitting {
  [self.viewModel setSubmitting:submitting];
}

- (void)setSubmittingWithMessage:(NSString *)message {
  [self.viewModel setSubmittingWithMessage:message];
}

- (RACSubject *)successSubject {
  return [self.viewModel successSubject];
}

- (RACSubject *)errorSubject {
  return [self.viewModel errorSubject];
}

@end
