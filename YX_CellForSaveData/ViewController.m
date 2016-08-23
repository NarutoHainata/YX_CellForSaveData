//
//  ViewController.m
//  YX_CellForSaveData
//
//  Created by yang on 16/8/23.
//  Copyright © 2016年 poplary. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UITextViewDelegate>

@property (nonatomic, strong) UITableView *mainTableView;

@property (nonatomic, strong) UITextView *valueText;

@property (nonatomic, strong) NSMutableArray *saveData;
@end


@implementation ViewController
- (UITableView *)mainTableView{
    
    if (_mainTableView == nil) {
        _mainTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.valueText.frame.size.width, 0.01f)];
    }
    return _mainTableView;
}
- (UITextView *)valueText{
    
    if (_valueText == nil) {
        _valueText = [[UITextView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
        _valueText.backgroundColor = [UIColor whiteColor];
        _valueText.text = [self.saveData objectAtIndex:0];
        _valueText.textColor  =[UIColor lightGrayColor];
        _valueText.delegate = self;
    }
    return _valueText;
}
- (NSMutableArray *)saveData{
    
    if (_saveData == nil) {
        _saveData = [[NSMutableArray alloc]initWithObjects:@"请输入", nil];
        
    }
    return _saveData;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"CellForSaveData";
    [self.view addSubview:self.mainTableView];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    //解决cell的复用问题
    else{
//    while ([cell.contentView.subviews lastObject] != nil) {
//        [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
//    }
        for (UIView *view in cell.contentView.subviews) {
            [view removeFromSuperview];
        }
    }
    if (indexPath.row == 3) {
        [cell.contentView addSubview:self.valueText];
    }
    
    cell.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44;
}
- (void)textViewDidBeginEditing:(UITextView *)textView{
    
    if ([textView.text isEqualToString:@"请输入"]) {
        textView.text = @"";
    }
}
- (void)textViewDidEndEditing:(UITextView *)textView{
    
    [self.saveData replaceObjectAtIndex:0 withObject:textView.text];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.valueText resignFirstResponder];
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
