# WebView in TableView Demo
This is a demostration of embedding multiple WKWebViews in UITableView cells to display seperated HTML contents. The key point is to caculate the HTML docuemnts' height exactly, and let TableView display them properly.
For this purpose, we use JS to callback and pass the height after the HTML conents have been totally loaded, includes the images. The result is like following screen shot:  

<p align="center" >
<img src="https://raw.githubusercontent.com/chenyun122/CYKit/master/WebViewInTableViewDemo/Screenshot_2018-06-26.png" alt="WebView in TableView Demo" title="WebView in TableView Demo">
</p>


## License
CYKit is released under the MIT license. See LICENSE for details.
