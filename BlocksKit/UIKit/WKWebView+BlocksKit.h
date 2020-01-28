//
//  WKWebView+BlocksKit.h
//  BlocksKit
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

/** Block callbacks for WKWebView.

 @warning WKWebView is only available on a platform with UIKit.
*/

@interface WKWebView (BlocksKit)

/** The block to be decide whether a URL will be loaded. 
 
 @warning If the delegate implements webView:shouldStartLoadWithRequest:navigationType:,
 the return values of both the delegate method and the block will be considered.
*/
@property (nonatomic, copy, setter = bk_decidePolicyForNavigationActionBlock:) BOOL (^bk_decidePolicyForNavigationActionBlock)(WKWebView *webView, WKNavigationAction *navigationAction, WKNavigationActionPolicy *decisionHandler);

/** The block that is fired when the web view starts loading. */
@property (nonatomic, copy, setter = bk_didStartProvisionalNavigationBlock:) void (^bk_didStartProvisionalNavigationBlock)(WKWebView *webView, WKNavigation *navigation);

/** The block that is fired when the web view finishes loading. */
@property (nonatomic, copy, setter = bk_didFinishNavigationBlock:) void (^bk_didFinishNavigationBlock)(WKWebView *webView, WKNavigation *navigation);

/** The block that is fired when the web view stops loading due to an error. */
@property (nonatomic, copy, setter = bk_didFailNavigationBlock:) void (^bk_didFailNavigationBlock)(WKWebView *webView, WKNavigation *navigation, NSError *error);

@end
