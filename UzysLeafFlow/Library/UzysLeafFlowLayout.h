//
//  UzysLeafFlowLayout.h
//  UzysLeafFlow
//
//  Created by Jaehoon Jung on 13. 4. 4..
//  Copyright (c) 2013년 Uzys. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UzysLeafFlowLayout : UICollectionViewLayout
@property (nonatomic, assign) CGFloat itemWidth; // Width for every column
@property (nonatomic, assign) UIEdgeInsets sectionInset; // The margins used to lay out content in a section
@end
