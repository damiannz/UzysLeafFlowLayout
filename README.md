UzysLeafFlowLayout
================

One of UICollectionViewLayout Example. 

It's compatible with [PSTUICollectionView][1].

![Screenshot](https://github.com/uzysjung/UzysLeafFlowLayout/raw/master/UzysLeafFlowLayout.png)


Prerequisite
------------
* iOS 6+, or
* iOS 4.x/5.x, with [PSTUICollectionView][1].


## How to Use

See the demo code. It's very Simple.

Copy over the files libary folder to your project folder

## Usage


``` objective-c
#import "UzysLeafFlowLayout.h"
#import "UzysLeafFlowCell.h"
#define CELL_IDENTIFIER @"UzysLeafFlow"
#define CELL_WIDTH 175

```

### Initialize


``` objective-c
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
```

###UICollectionViewDataSource
``` objective-c
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
```
License
-------
UzysLeafFlowLayout is available under the MIT license. See the LICENSE file for more info.

[1]: https://github.com/steipete/PSTCollectionView
