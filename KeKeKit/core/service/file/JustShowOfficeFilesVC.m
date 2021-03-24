//
//  OpenFileVC.m
//  FirstProject
//
//  Created by CZK on 2019/12/11.
//  Copyright © 2019 czk. All rights reserved.
//
#import <QuickLook/QuickLook.h>
#import "JustShowOfficeFilesVC.h"

@interface JustShowOfficeFilesVC ()

@end

@implementation JustShowOfficeFilesVC
- (instancetype)initWithDirPath:(NSString*)dirpath
{
    self = [super init];
    if (self) {
        self.dirpath=dirpath;
        [self fillData];
    }
    return self;
}
- (instancetype)initWithFileUrls:(NSArray*)fileUrls
{
    self = [super init];
    if (self) {
        self.datas = fileUrls;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];


    // Do any additional setup after loading the view.
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (!self.hasShown) {
        self.hasShown=YES;
        [self showPreView];
    }

}
- (void)showPreView
{

    QLPreviewController *previewController  =  [[QLPreviewController alloc]  init];
    previewController.view.backgroundColor=NatureColorNearlyWhite;
    previewController.dataSource  = self;
    previewController.delegate = self;
        //调用系统自带的分享功能，把选中的图片们分享出去
    [self presentViewController:previewController animated:NO completion:nil];
}
-(void)fillData
{
    NSMutableArray*arr=nil;
    NSFileManager *fm=[NSFileManager defaultManager];
    NSString*dir_path=self.dirpath;
    if (dir_path.length) {
        arr=[NSMutableArray arrayWithArray:[fm contentsOfDirectoryAtPath:dir_path error:nil]];
        self.datas = [[NSMutableArray alloc] init];
        for (int i=0; i<[arr count]; i++)
            {
            NSString*nowpath=[arr objectAtIndex:i];

            NSString*filePath=[dir_path stringByAppendingPathComponent:[nowpath lastPathComponent]];
            NSURL*fileurl=[NSURL fileURLWithPath:filePath];
            [self.datas addObject:fileurl];
            }
    }

}
    // self.pdfArray 是数组，存取所有查看文件的路径
    //返回的当前预览的文件QLPreviewItem, controller：当前预览控制器，index：当前预览的第几个文件。
-(id<QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index {
    NSURL * url = self.datas[index];
    return url;
}

- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)previewController{
    return self.datas.count;
}

- (void)previewControllerWillDismiss:(QLPreviewController *)controller {
    [self wannengBack];
}
-(void)wannengBack
{
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
        {
        [self dismissViewControllerAnimated:YES completion:nil];
        }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
