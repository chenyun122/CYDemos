# CYKit
Useful Swift codes backup

## UIView+ColorOfPoint
Get color of a point in a UIView, `usage`:

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
