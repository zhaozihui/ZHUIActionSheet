#ZHUIActionSheet
可以简单实现在底部弹出类似ActionView画面 

使用起来非常简单,可以自定义标题和详情

实现简单的ActionView

```
 ZHActionSheet *sheet = [[ZHActionSheet alloc] init];
    [sheet showInViewWithItems:@[@"button1",@"button2",@"button2"] title:@"title" detail:@"This demo will show a actionsheet with title and detail!" cancel:@"Cancel" inView:self.view];
    sheet.block = ^(int index)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You have choosed:" message:[NSString stringWithFormat:@"index:%d",index] delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [alert show];
    };
```

画面效果:

<img src="https://raw.githubusercontent.com/zhaozihui/ZHUIActionSheet/master/IMG_1207.PNG" width="320" height="568" alt="画面效果"/>



#联系作者:zhaozihui@gmail.com