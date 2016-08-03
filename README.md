# XYXCirculateView
 Cycle show image

if you want to use this library,just a few steps:
Firstly,import the name of the library --> XYXCirculateView
Than write the following lines of code
```objc
  // create object
  XYXCirculateView *circulate = [[XYXCirculateView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200)];
  
  // add view
  [self.view addSubview:circulate];
    
  //set images to show (the number of iamge is free)
  circulate.imagesArray = @[[UIImage imageNamed:@"imagename1"],[UIImage imageNamed:@"imagename2"],[UIImage imageNamed:@"imagename3"],[UIImage imageNamed:@"imagename4"]];
    
  //the following code is not necessary (currentColor default is green ,otherColor default is gray)
  circulate.currentColor = [UIColor redColor];
  circulate.otherColor = [UIColor darkGrayColor];
```
Okay! show it now.

