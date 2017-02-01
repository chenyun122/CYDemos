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
