<img src="https://github.com/ashkanpower/ConstraintMaker/blob/master/ConstraintMaker.png" center width="100px"  alt="" />

# ConstraintMaker
Easy to use, human readable constraint library


how to install
```
pod 'ConstraintMaker', '~> 0.0'
```
Example 
```
view2.con.to(view1)
  .allEdge(8)
  .sameHeight()
  .width(100)
  .aspectRatio() // 1:1
```
