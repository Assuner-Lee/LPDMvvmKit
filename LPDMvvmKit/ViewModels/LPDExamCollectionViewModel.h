//
//  LPDExamCollectionViewModel.h
//  LPDMvvmKit
//
//  Created by 李博 on 16/2/29.
//  Copyright © 2016年 eleme. All rights reserved.
//

#import "LPDCollectionViewModel.h"
#import "LPDScrollViewModel.h"

@interface LPDExamCollectionViewModel : LPDScrollViewModel

@property (nonatomic, copy) NSString *tabBarItemImage;
@property (nonatomic, copy) NSString *tabBarItemSelectedImage;

@property (nonatomic, strong) LPDCollectionViewModel *collectionViewModel;

@property (nonatomic, strong, readonly) RACCommand *insertCellCommand;
@property (nonatomic, strong, readonly) RACCommand *insertCellsCommand;
@property (nonatomic, strong, readonly) RACCommand *removeCellCommand;
@property (nonatomic, strong, readonly) RACCommand *removeCellsCommand;

@end
