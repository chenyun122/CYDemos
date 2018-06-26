# CYDemos
Useful codes backups and demonstrations. It’s growing.

## UIView+ColorOfPoint
Get color of a point in a UIView, `usage`:

```swift
//Static method
let color = UIView.colorOfPoint(point: aPoint, view: aView)

//Call instance method in a custom view
let color = self.colorOfPoint(point: aPoint)
```


```swift
//Example: get the color when touching in a view
class ExampleView: UIView {
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let color = self.colorOfPoint(point: location)
            //Go ahead to handle the color...
        }
    }
}
```

## AnnularSectorView
A demo of drawing annular sector with UIBezierPath, `usage`:
```swift
let annularSectorView = AnnularSectorView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
annularSectorView.startAngle = CGFloat.pi * 9 / 8
annularSectorView.endAngle = CGFloat.pi * 15 / 8
annularSectorView.numberOfSectors = 4
self.view.addSubview(annularSectorView)

// Feel free to change the source code directly to fit your specific requirements 
```

<p align="center" >
<img src="https://raw.githubusercontent.com/chenyun122/CYKit/master/AnnularSectorView/AnnularSectorView.png" alt="AnnularSectorView" title="AnnularSectorView">
</p>

## WebView in TableView Demo
This is a demostration of embedding multiple `WKWebViews` in `UITableView` cells to display seperated HTML contents. The key point is to caculate the HTML docuemnts' **height** exactly, and let `TableView` display them properly.
For this purpose, we use JS to callback and pass the height after the HTML conents have been totally loaded, includes the images. The result is like following screen shot:  

<p align="center" >
<img src="https://raw.githubusercontent.com/chenyun122/CYKit/master/WebViewInTableViewDemo/Screenshot_2018-06-26.png" alt="WebView in TableView Demo" title="WebView in TableView Demo" width="35%">
</p>


## License

CYKit is released under the MIT license. See LICENSE for details.
