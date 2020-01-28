//
//  WKWebView+BlocksKit.m
//  BlocksKit
//

#import "A2DynamicDelegate.h"
#import "NSObject+A2BlockDelegate.h"
#import "WKWebView+BlocksKit.h"

#pragma mark Custom delegate

@interface A2DynamicWKWebViewDelegate : A2DynamicDelegate <WKNavigationDelegate>
@end

@implementation A2DynamicWKWebViewDelegate

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
  id realDelegate = self.realDelegate;
  if (realDelegate && [realDelegate respondsToSelector:@selector(webView:decidePolicyForNavigationAction:decisionHandler:)])
    [realDelegate webView:webView decidePolicyForNavigationAction:navigationAction decisionHandler:decisionHandler];

  void (^block)(WKWebView *, WKNavigationAction *, WKNavigationActionPolicy) = [self blockImplementationForMethod:_cmd];
  if (block) block(webView, navigationAction, (WKNavigationActionPolicy)decisionHandler);
  decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
  id realDelegate = self.realDelegate;
  if (realDelegate && [realDelegate respondsToSelector:@selector(webView:didStartProvisionalNavigation:)])
    [realDelegate webView:webView didStartProvisionalNavigation:navigation];

  void (^block)(WKWebView *, WKNavigation *) = [self blockImplementationForMethod:_cmd];
  if (block) block(webView, navigation);
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
  id realDelegate = self.realDelegate;
  if (realDelegate && [realDelegate respondsToSelector:@selector(webView:didFinishNavigation:)])
    [realDelegate webView:webView didFinishNavigation:navigation];

  void (^block)(WKWebView *, WKNavigation *) = [self blockImplementationForMethod:_cmd];
  if (block) block(webView, navigation);
}

- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error {
  id realDelegate = self.realDelegate;
  if (realDelegate && [realDelegate respondsToSelector:@selector(webView:didFailNavigation:withError:)])
    [realDelegate webView:webView didFailNavigation:navigation withError:error];

  void (^block)(WKWebView *, WKNavigation *, NSError *) = [self blockImplementationForMethod:_cmd];
  if (block) block(webView, navigation, error);
}

@end

#pragma mark Category

@implementation WKWebView (BlocksKit)

@dynamic bk_decidePolicyForNavigationActionBlock, bk_didStartProvisionalNavigationBlock, bk_didFinishNavigationBlock, bk_didFailNavigationBlock;

+ (void)load
{
	@autoreleasepool {
		[self bk_registerDynamicDelegate];
		[self bk_linkDelegateMethods:@{
			@"bk_decidePolicyForNavigationActionBlock": @"webView:decidePolicyForNavigationAction:decisionHandler:",
			@"bk_didStartProvisionalNavigationBlock": @"webView:didStartProvisionalNavigation:",
			@"bk_didFinishNavigationBlock": @"webView:didFinishNavigation:",
			@"bk_didFailNavigationBlock": @"webView:didFailNavigation:withError:"
		}];
	}
}

@end
