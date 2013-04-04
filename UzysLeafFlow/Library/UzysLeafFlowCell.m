//
//  UzyLeafFlowCell.m
//  UzysLeafFlow
//
//  Created by Jaehoon Jung on 13. 4. 4..
//  Copyright (c) 2013년 Uzys. All rights reserved.
//
#import "ARCHelper.h"
#import "UzysLeafFlowCell.h"
@interface UzysLeafFlowCell()
@property (nonatomic,retain) UIView *horizontalLineView;
@property (nonatomic,retain) UIView *verticalLineView1;
@property (nonatomic,retain) UIView *verticalLineView2;
@end
@implementation UzysLeafFlowCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

-(void)initialize
{
    _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 130,130)];
    _imgView.userInteractionEnabled = YES;
    _imgView.clipsToBounds = YES;
    _imgView.contentMode = UIViewContentModeScaleAspectFill;
    
    _button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [_button setImage:[UIImage imageNamed:@"btnIcon"] forState:UIControlStateNormal];
    _horizontalLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 1)];
    _verticalLineView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 50)];
    _verticalLineView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 50)];
    [self addSubview:_imgView];
    [self addSubview:_button];
    [self addSubview:_horizontalLineView];
    [self addSubview:_verticalLineView1];
    [self addSubview:_verticalLineView2];
    _verticalLineView1.backgroundColor = [UIColor whiteColor];
    _verticalLineView2.backgroundColor = [UIColor whiteColor];
    _horizontalLineView.backgroundColor = [UIColor whiteColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    
    [self setupGestureRecognizer];
}
-(void)setupGestureRecognizer
{
    
    UITapGestureRecognizer *tapRecognizer = [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)] autorelease];
    [self.imgView addGestureRecognizer:tapRecognizer];
    
}
- (void)handleSingleTap:(UIGestureRecognizer *)gestureRecognizer
{
    if(self.imgTouchblock)
        self.imgTouchblock();
}
-(void)setCellType:(CELLTYPE )cellType
{
    _cellType = cellType;
    if(cellType == CELL_LEFT)
        [self LayoutLeft];
    else
        [self LayOutRight];
}

-(void)LayoutLeft
{
    [_imgView setFrame:CGRectMake(5,14, 130, 130)];
    [_button setFrame:CGRectMake(145, 64, 30, 30)];
    [_horizontalLineView setFrame:CGRectMake(135, 79, 10, 1)];
    if(_isFirst)
    {
        _verticalLineView1.hidden = YES;
    }
    else
    {
        _verticalLineView1.hidden = NO;
    }
    if(_isLast)
    {
        _verticalLineView2.hidden = YES;
    }
    else
    {
        _verticalLineView2.hidden = NO;
    }
    [_verticalLineView1 setFrame:CGRectMake(160, 14, 1, 50)];
    [_verticalLineView2 setFrame:CGRectMake(160, 95, 1, 50)];
}

-(void)LayOutRight
{
    CGFloat width = self.bounds.size.width;
    
    [_imgView setFrame:CGRectMake(width - 130 -5 ,14, 130, 130)];
    [_button setFrame:CGRectMake(width- 30 - 145, 64, 30, 30)];
    [_horizontalLineView setFrame:CGRectMake(width -10 - 135, 79, 10, 1)];
    
    if(_isFirst)
    {
        _verticalLineView1.hidden = YES;
    }
    else
    {
        _verticalLineView1.hidden = NO;
    }
    if(_isLast)
    {
        _verticalLineView2.hidden = YES;
    }
    else
    {
        _verticalLineView2.hidden = NO;
    }
    [_verticalLineView1 setFrame:CGRectMake(width - 160, 14, 1, 50)];
    [_verticalLineView2 setFrame:CGRectMake(width -160, 95, 1, 50)];
}

-(void)prepareForReuse
{
    [super prepareForReuse];
    _isFirst = NO;
    _isLast = NO;
    _imgView.image = nil;
    self.imgTouchblock = nil;
}

-(void)dealloc
{
    [_button release];
    [_imgView release];
    [_horizontalLineView release];
    [_verticalLineView1 release];
    [_verticalLineView2 release];
    [super ah_dealloc];
}

-(void)reLayout:(UICollectionView *)collectionView atIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row ==0) self.isFirst = YES;
    self.isLast = (indexPath.row == [collectionView numberOfItemsInSection:indexPath.section] - 1);
    if(indexPath.row%2) self.cellType = CELL_RIGHT; else self.cellType = CELL_LEFT;
}
@end
