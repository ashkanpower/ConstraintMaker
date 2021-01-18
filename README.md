<img src="https://github.com/ashkanpower/ConstraintMaker/blob/master/ConstraintMaker.png" center width="100px"  alt="" />

# ConstraintMaker
Easy to use, human readable constraint library


how to install
```
pod 'ConstraintMaker', '~> 0.0'
```
# How To Use 
```
view2.con.to(view1)
  .allEdge(8)
  .sameHeight()
  .width(100)
  .aspectRatio() // 1:1
```

# Info
you can call a constraint by its name and create a constraint for that anchor</br>
each function has optional parameters that can control how that constraint should be applied
```
leading(_ constant : CGFloat = CGFloat(0), _ prioarity : Prioarity = .high , _ type : SpaceType = .equal) 
```

constant : as you can see you can set the constant value</br>
prioarity : prioarity of the constraint</br>
SpaceType : and the type of contraitn related to the other anchor</br>


constraints can be applied to other views or to self </br>
so if you want to specify what is the other view you can use 'to' function
```
view2.con.to(view1)
.sameWidth()
.to(view3)
.sameHeight()
.toParent()
.allEdge()
```
as you can see you can change the other view in middle of a block</br>
if the constraint function is aimed to self, it ignores the other view
</br></br>
you can also call toParent() to access superView

# Edge Constraints

```
.to(otherView)
.leading()
.trailing()
.top()
.bottom()
.leadingTrailing() // leading of current view to trailing of otherView
.trailingLeading()
.topBottom()
.bottomTop()
.topSafe()
.bottomSafe()
.allEdge()
.allEdgeSafe()
.fillTopPart()
.fillLeadingPart()
.fillTrailingPart()
.fillBottomPart()
.fillTopPartSafe()
.fillBottomPartSafe()

```

# sizing Constraints
```
.aspectRatio() //self
.width()       //self
.height()      //self
.size()        //self

.to(otherView)
.sameSize()
.sameWidth()
.sameHeight()
```

# positioning Constraints
```
to(otherView)
.center()
.centerX()
.centerY()
```
# Example
<img src="https://github.com/ashkanpower/ConstraintMaker/blob/master/images/example1.png" center width="100px"  alt="" />
```
view1.addAndConstraint(to: view)
    .fillTopPartSafe(8)
    .height(100)

view2.addAndConstraint(to: view1)
    .fillLeadingPart(8)

view3.addAndConstraint(to: view1)
    .fillTrailingPart(8)
    .to(view2)
    .sameWidth()
    .leadingTrailing(8)
```
