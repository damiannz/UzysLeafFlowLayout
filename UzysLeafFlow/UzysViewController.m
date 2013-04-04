//
//  UzysViewController.m
//  UzysLeafFlow
//
//  Created by Jaehoon Jung on 13. 4. 4..
//  Copyright (c) 2013년 Uzys. All rights reserved.
//
#define CELL_WIDTH 175

#import "UzysViewController.h"
#import "UzysLeafFlowLayout.h"
#import "UzysLeafFlowCell.h"
#define CELL_IDENTIFIER @"UzysLeafFlow"
@interface UzysViewController ()
@property (nonatomic,retain) UICollectionView *collectionView;
@property (nonatomic,retain) NSMutableArray *pDataArr;
@end

@implementation UzysViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UzysLeafFlowLayout *layout = [[[UzysLeafFlowLayout alloc] init] autorelease];
    layout.itemWidth = CELL_WIDTH;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.backgroundColor = [UIColor blackColor];
    [_collectionView setFrame:self.view.bounds];
    [_collectionView registerClass:[UzysLeafFlowCell class] forCellWithReuseIdentifier:CELL_IDENTIFIER];
    [self.view addSubview:_collectionView];

    [self generateSampleData];
}

-(void)generateSampleData
{
    self.pDataArr = [NSMutableArray array];
    
    for(int i=0 ; i<30;i++)
    {
        NSString *fName =[NSString stringWithFormat:@"%d.jpeg",i%8+1];
        [self.pDataArr addObject:[UIImage imageNamed:fName]];
    }
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.pDataArr count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UzysLeafFlowCell *cell =
    (UzysLeafFlowCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CELL_IDENTIFIER
                                                               forIndexPath:indexPath];
    cell.imgView.image = [self.pDataArr objectAtIndex:indexPath.item];
    cell.imgView.tag = indexPath.row;
    [cell reLayout:collectionView atIndexPath:indexPath];
    cell.imgTouchblock = ^{ NSLog(@"Touch %d img",indexPath.item);};
    return cell;
}



- (void)dealloc
{
    [_collectionView release];
    [super dealloc];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
