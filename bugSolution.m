To prevent the crash, ensure the object remains in memory until the delayed selector is executed.  Weak references and other techniques are effective:

```objectivec
//bugSolution.m
@interface MyObject : NSObject
- (void)myMethod;
@end

@implementation MyObject
- (void)myMethod {
    NSLog("Method executed successfully");
}
@end

@interface ViewController : UIViewController
@property (nonatomic, weak) MyObject *myObject;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    MyObject *obj = [[MyObject alloc] init];
    self.myObject = obj;
    [self.myObject performSelector:@selector(myMethod) withObject:nil afterDelay:2.0]; 
    //Or use blocks for better management
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{        
        [self.myObject myMethod];
    });
}
@end
```
Using blocks (GCD) or ensuring a strong reference to the object within the relevant scope during the delay period prevents the deallocation problem.