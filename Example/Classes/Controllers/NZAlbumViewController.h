//
//  NZAlbumViewController.h
//  Photoapp
//
//  Created by Bruno Furtado on 11/12/13.
//  Copyright (c) 2013 No Zebra Network. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "AGPhotoBrowserView.h"

@interface NZAlbumViewController : UICollectionViewController
<
    AGPhotoBrowserDelegate,
    AGPhotoBrowserDataSource,
    UICollectionViewDataSource,
    UICollectionViewDelegate,
    UICollectionViewDelegateFlowLayout
>

@end