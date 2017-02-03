# CYKit
Useful Swift codes backup

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
annularSectorView.numberOfSectors = 4
self.view.addSubview(annularSectorView)

// Feel free to change the source code directly to fit your specific requirements 
```

<p align="center" >
<img src="https://raw.githubusercontent.com/chenyun122/CYKit/master/AnnularSectorView/AnnularSectorView.png" alt="AnnularSectorView" title="AnnularSectorView">
</p>
