//
//  UzyLeafFlowCell.h
//  UzysLeafFlow
//
//  Created by Jaehoon Jung on 13. 4. 4..
//  Copyright (c) 2013년 Uzys. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^SelectionBlock)(void);
typedef enum
{
    CELL_LEFT, CELL_RIGHT
} CELLTYPE;


@interface UzysLeafFlowCell : UICollectionViewCell
@property (nonatomic,strong) UIImageView *imgView;
@property (nonatomic,strong) UIButton *button;
@property (nonatomic,copy) SelectionBlock imgTouchblock;
@property (nonatomic,assign) CELLTYPE cellType;
@property (nonatomic,assign) BOOL isFirst;
@property (nonatomic,assign) BOOL isLast;

-(void)reLayout:(UICollectionView *)collectionView atIndexPath:(NSIndexPath *)indexPath;

@end
