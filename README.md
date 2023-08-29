#  FB13080609

## NavigationSplitView with NavigationStack inside crashes when it appears with content on the NavigationPath


### Scenario

There is a ```NavigationSplitView``` with a ```NavigationStack``` in the detail column. The ```NavigationPath``` of the ```NavigationStack``` is stored in a ```@State``` variable. The whole view gets removed and displayed again with the same path applied. So the NavigationStack inside of the NavigationSplitView appears with items in its path. 


### The issue

When the view re-appears (with items on the stack), the app hangs and crashes after some time. The log shows the following message:

```Abnormal number of gesture recognizer dependencies: 1.350. System performance may be affected. Please investigate reducing gesture recognizers and/or their dependencies.```
Counting up until it crashes, CPU stays at 100% and memory grows.


### Example Project

The example shows a ```NavigationStack``` inside the detail column of a ```NavigationSplitView```. There is a toggle to hide/show the ```NavigationSplitView```.

When there is one or multiple views on the stack (not just the selection of the sidebar) and the NavigationSplitView re-appears after being hidden, the app gets inresponsive until it crashes. This does not happen with an empty stack. The log shows the following message:

```Abnormal number of gesture recognizer dependencies: 1.350. System performance may be affected. Please investigate reducing gesture recognizers and/or their dependencies.```


### How to reproduce

1. Run the app on iPad or iPhone.
2. Select an entry from the list.
3. Select another entry from the new list.
4. Disable the toggle to hide the view.
5. Enable the toggle to show the view again.


Issue exists on:
 - Xcode 15.0 Beta 8 with iOS 17.0 (21A5326a)
 - Xcode 15.0 Beta 7 with iOS 17.0 (21A5317a)
 - Xcode 15.0 Beta 6 with iOS 17.0 (21A5303d)
 - Xcode 15.0 Beta 5 with iOS 17.0 (21A5291g)
 
Works on:
 - Xcode 15.0 Beta 4 with iOS 17.0 (21A5277g)

