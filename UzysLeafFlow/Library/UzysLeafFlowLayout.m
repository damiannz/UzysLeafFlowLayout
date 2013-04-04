//
//  UzysLeafFlowLayout.m
//  UzysLeafFlow
//
//  Created by Jaehoon Jung on 13. 4. 4..
//  Copyright (c) 2013년 Uzys. All rights reserved.
//
#define ITEM_HEIGHT 158
#import "UzysLeafFlowLayout.h"
#import "ARCHelper.h"
@interface UzysLeafFlowLayout()
@property (nonatomic, assign) NSInteger itemCount;
@property (nonatomic, assign) CGFloat interitemSpacing;
@property (nonatomic, assign) NSInteger contentHeight;
@property (nonatomic, strong) NSMutableArray *itemAttributes; // attributes for each item
@end
@implementation UzysLeafFlowLayout
- (void)commonInit
{
    _itemWidth = 175;
    _sectionInset = UIEdgeInsetsZero;
}

- (id)init
{
    self = [super init];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)dealloc
{
    [_itemAttributes release];
    [super ah_dealloc];
}

#pragma mark - Methods to Override
- (void)prepareLayout
{
    [super prepareLayout];
    
    _itemCount = [[self collectionView] numberOfItemsInSection:0];
    CGFloat width = self.collectionView.frame.size.width - _sectionInset.left - _sectionInset.right;
    _interitemSpacing = floorf((width - 2 * _itemWidth) ); //아이템 사이의 거리
    self.itemAttributes = [NSMutableArray arrayWithCapacity:_itemCount];
    
    CGPoint lastItemCenter = CGPointZero;
    for (NSInteger idx = 0; idx < _itemCount; idx++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:idx inSection:0];
        CGFloat itemHeight = ITEM_HEIGHT;
        CGFloat xOffset;
        if(idx%2)
        {
            xOffset = width - _itemWidth;
        }
        else
        {
            xOffset = _sectionInset.left;
        }
        
        CGFloat yOffset =0;
        CGPoint itemCenter = CGPointMake(floorf(xOffset +_itemWidth/2) , lastItemCenter.y + floorf((yOffset + itemHeight/2 + 20)));
        
        UICollectionViewLayoutAttributes *attributes =
        [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        attributes.size = CGSizeMake(self.itemWidth, itemHeight);
        attributes.center = itemCenter;
        attributes.zIndex = idx;
        [_itemAttributes addObject:attributes];
        lastItemCenter = itemCenter;
    }
    _contentHeight = lastItemCenter.y + ITEM_HEIGHT/2;
}

- (CGSize)collectionViewContentSize
{
    if (self.itemCount == 0) {
        return CGSizeZero;
    }
    CGSize contentSize = self.collectionView.frame.size;
    contentSize.height = _contentHeight;
    return contentSize;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)path
{
    if(path.row > [self.itemAttributes count]-1)
    {
        NSLog(@"outofrange");
    }
    return (self.itemAttributes)[path.item];
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.itemAttributes;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return NO;
}
@end
