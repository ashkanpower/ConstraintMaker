//
//  ConstraintMaker.swift
//  ConstraintMaker
//
//  Created by Ashkan Ghodrat on 2/28/19.
//  Copyright © 2019 Ashkan Ghodrat. All rights reserved.
//

import Foundation
import UIKit

public enum Prioarity : Int{
    case high = 1000
    case more = 750
    case normal = 500
    case low = 250
}

public enum SpaceType {
    case equal
    case greater
    case lessThan
}

public class ConstraintMaker {
    
    
    var view : UIView!
    var otherView : UIView?
    
    public init(_ view : UIView){
        view.translatesAutoresizingMaskIntoConstraints = false
        self.view = view
    }
    
    public func to(_ otherView : UIView?)->ConstraintMaker {
        //otherView?.translatesAutoresizingMaskIntoConstraints = false
        view.translatesAutoresizingMaskIntoConstraints = false
        self.otherView = otherView
        return self
    }
    
    public func toParent()->ConstraintMaker {
        //otherView?.translatesAutoresizingMaskIntoConstraints = false
        view.translatesAutoresizingMaskIntoConstraints = false
        self.otherView = view.superview
        return self
    }
    
    // leading anchor
    var leading : NSLayoutConstraint? {
        get {
            return findConstraint(.leading, otherView) ?? findConstraint(.leadingMargin)
                ?? findConstraint(.left) ?? findConstraint(.leftMargin)
        }
    }
    
    @discardableResult
    public func leading(_ constant : CGFloat = CGFloat(0), _ prioarity : Prioarity = .high , _ type : SpaceType = .equal) -> ConstraintMaker{
        makeConstraint(leading, view.leadingAnchor, otherView!.leadingAnchor, constant: constant, prioarity: prioarity, type)
        return self
    }
    
    @discardableResult
    public func leadingTrailing(_ constant : CGFloat = CGFloat(0), _ prioarity : Prioarity = .high , _ type : SpaceType = .equal) -> ConstraintMaker{
        makeConstraint(leading, view.leadingAnchor, otherView!.trailingAnchor, constant: constant, prioarity: prioarity, type)
        return self
    }
    
    
    // trailing anchor
    var trailing : NSLayoutConstraint? {
        get {
            return findConstraint(.trailing, otherView) ?? findConstraint(.trailingMargin)
                ?? findConstraint(.right) ?? findConstraint(.rightMargin)
        }
    }
    
    @discardableResult
    public func trailing(_ constant : CGFloat = CGFloat(0), _ prioarity : Prioarity = .high , _ type : SpaceType = .equal) -> ConstraintMaker{
        makeConstraint(trailing, otherView!.trailingAnchor, view.trailingAnchor, constant: constant, prioarity: prioarity, type)
        return self
    }
    
    @discardableResult
    public func trailingLeading(_ constant : CGFloat = CGFloat(0), _ prioarity : Prioarity = .high , _ type : SpaceType = .equal) -> ConstraintMaker{
        makeConstraint(trailing, otherView!.leadingAnchor, view.trailingAnchor, constant: constant, prioarity: prioarity, type)
        return self
    }
    
    // top anchor
    var top : NSLayoutConstraint? {
        get {
            return findConstraint(.top, otherView) ?? findConstraint(.topMargin)
        }
    }
    
    @discardableResult
    public func top(_ constant : CGFloat = CGFloat(0), _ prioarity : Prioarity = .high , _ type : SpaceType = .equal) -> ConstraintMaker{
        makeConstraint(top, view.topAnchor, otherView!.topAnchor, constant: constant, prioarity: prioarity, type)
        return self
    }
    
    @discardableResult
    public func topSafe(_ constant : CGFloat = CGFloat(0), _ prioarity : Prioarity = .high , _ type : SpaceType = .equal) -> ConstraintMaker{
        if #available(iOS 11, *) {
            makeConstraint(top, view.topAnchor, otherView!.safeAreaLayoutGuide.topAnchor, constant: constant, prioarity: prioarity, type)
        } else {
            makeConstraint(top, view.topAnchor, otherView!.topAnchor, constant: constant, prioarity: prioarity, type)
        }
        return self
    }
    
    @discardableResult
    public func topBottom(_ constant : CGFloat = CGFloat(0), _ prioarity : Prioarity = .high , _ type : SpaceType = .equal) -> ConstraintMaker{
        makeConstraint(top, view.topAnchor, otherView!.bottomAnchor, constant: constant, prioarity: prioarity, type)
        return self
    }
    
    
    @discardableResult
    public func topBottomSafe(_ constant : CGFloat = CGFloat(0), _ prioarity : Prioarity = .high , _ type : SpaceType = .equal) -> ConstraintMaker{
        
        if #available(iOS 11, *) {
            makeConstraint(top, view.topAnchor, otherView!.safeAreaLayoutGuide.bottomAnchor, constant: constant, prioarity: prioarity, type)
        } else {
            makeConstraint(top, view.topAnchor, otherView!.bottomAnchor, constant: constant, prioarity: prioarity, type)
        }
        
        return self
    }
    
    
    
    // bottom anchor
    var bottom : NSLayoutConstraint? {
        get {
            return findConstraint(.bottom, otherView) ?? findConstraint(.bottomMargin)
        }
    }
    
    @discardableResult
    public func bottom(_ constant : CGFloat = CGFloat(0), _ prioarity : Prioarity = .high , _ type : SpaceType = .equal) -> ConstraintMaker{
        makeConstraint(bottom, otherView!.bottomAnchor, view.bottomAnchor, constant: constant, prioarity: prioarity, type)
        return self
    }
    
    @discardableResult
    public func bottomSafe(_ constant : CGFloat = CGFloat(0), _ prioarity : Prioarity = .high , _ type : SpaceType = .equal) -> ConstraintMaker{
        if #available(iOS 11, *) {
            makeConstraint(bottom, otherView!.safeAreaLayoutGuide.bottomAnchor, view.bottomAnchor, constant: constant, prioarity: prioarity, type)
        } else {
            makeConstraint(bottom, otherView!.bottomAnchor, view.bottomAnchor, constant: constant, prioarity: prioarity, type)
        }
        
        return self
    }
    
    @discardableResult
    public func bottomTop(_ constant : CGFloat = CGFloat(0), _ prioarity : Prioarity = .high , _ type : SpaceType = .equal) -> ConstraintMaker{
        makeConstraint(bottom, otherView!.topAnchor, view.bottomAnchor, constant: constant, prioarity: prioarity, type)
        return self
    }
    
    @discardableResult
    public func bottomTopSafe(_ constant : CGFloat = CGFloat(0), _ prioarity : Prioarity = .high , _ type : SpaceType = .equal) -> ConstraintMaker{
        
        if #available(iOS 11, *) {
            makeConstraint(bottom, otherView!.safeAreaLayoutGuide.topAnchor, view.bottomAnchor, constant: constant, prioarity: prioarity, type)
        } else {
            makeConstraint(bottom, otherView!.topAnchor, view.bottomAnchor, constant: constant, prioarity: prioarity, type)
        }
        
        return self
    }
    
    //other edges
    
    @discardableResult
    public func allEdge(_ constant : CGFloat = CGFloat(0), _ prioarity : Prioarity = .high , _ type : SpaceType = .equal) -> ConstraintMaker{
        leading(constant, prioarity, type)
        trailing(constant, prioarity, type)
        top(constant, prioarity, type)
        bottom(constant, prioarity, type)
        return self
    }
    
    @discardableResult
    public func allEdge(widthPadding : CGFloat = CGFloat(0), heightPadding : CGFloat = CGFloat(0), _ prioarity : Prioarity = .high , _ type : SpaceType = .equal) -> ConstraintMaker{
        leading(widthPadding, prioarity, type)
        trailing(widthPadding, prioarity, type)
        top(heightPadding, prioarity, type)
        bottom(heightPadding, prioarity, type)
        return self
    }
    
    @discardableResult
    public func allEdgeSafe(_ constant : CGFloat = CGFloat(0), _ prioarity : Prioarity = .high , _ type : SpaceType = .equal) -> ConstraintMaker{
        leading(constant, prioarity, type)
        trailing(constant, prioarity, type)
        topSafe(constant, prioarity, type)
        bottomSafe(constant, prioarity, type)
        return self
    }
    
    @discardableResult
    public func allEdgeSafe(widthPadding : CGFloat = CGFloat(0), heightPadding : CGFloat = CGFloat(0), _ prioarity : Prioarity = .high , _ type : SpaceType = .equal) -> ConstraintMaker{
        leading(widthPadding, prioarity, type)
        trailing(widthPadding, prioarity, type)
        topSafe(heightPadding, prioarity, type)
        bottomSafe(heightPadding, prioarity, type)
        return self
    }
    
    @discardableResult
    public func fillTopPart(_ constant : CGFloat = CGFloat(0), _ prioarity : Prioarity = .high , _ type : SpaceType = .equal) -> ConstraintMaker{
        top(constant, prioarity, type)
        trailing(constant, prioarity, type)
        leading(constant, prioarity, type)
        return self
    }
    
    @discardableResult
    public func fillLeadingPart(_ constant : CGFloat = CGFloat(0), _ prioarity : Prioarity = .high , _ type : SpaceType = .equal) -> ConstraintMaker{
        top(constant, prioarity, type)
        bottom(constant, prioarity, type)
        leading(constant, prioarity, type)
        return self
    }
    
    @discardableResult
    public func fillTrailingPart(_ constant : CGFloat = CGFloat(0), _ prioarity : Prioarity = .high , _ type : SpaceType = .equal) -> ConstraintMaker{
        top(constant, prioarity, type)
        bottom(constant, prioarity, type)
        trailing(constant, prioarity, type)
        return self
    }
    
    @discardableResult
    public func fillBottomPart(_ constant : CGFloat = CGFloat(0), _ prioarity : Prioarity = .high , _ type : SpaceType = .equal) -> ConstraintMaker{
        leading(constant, prioarity, type)
        bottom(constant, prioarity, type)
        trailing(constant, prioarity, type)
        return self
    }
    
    @discardableResult
    public func fillTopPartSafe(_ constant : CGFloat = CGFloat(0), _ prioarity : Prioarity = .high , _ type : SpaceType = .equal) -> ConstraintMaker{
        topSafe(constant, prioarity, type)
        trailing(constant, prioarity, type)
        leading(constant, prioarity, type)
        return self
    }
    
    @discardableResult
    public func fillLeadingPartSafe(_ constant : CGFloat = CGFloat(0), _ prioarity : Prioarity = .high , _ type : SpaceType = .equal) -> ConstraintMaker{
        top(constant, prioarity, type)
        bottomSafe(constant, prioarity, type)
        leading(constant, prioarity, type)
        return self
    }
    
    @discardableResult
    public func fillTrailingPartSafe(_ constant : CGFloat = CGFloat(0), _ prioarity : Prioarity = .high , _ type : SpaceType = .equal) -> ConstraintMaker{
        topSafe(constant, prioarity, type)
        bottomSafe(constant, prioarity, type)
        trailing(constant, prioarity, type)
        return self
    }
    
    @discardableResult
    public func fillBottomPartSafe(_ constant : CGFloat = CGFloat(0), _ prioarity : Prioarity = .high , _ type : SpaceType = .equal) -> ConstraintMaker{
        leading(constant, prioarity, type)
        bottomSafe(constant, prioarity, type)
        trailing(constant, prioarity, type)
        return self
    }
    
    @discardableResult
    public func fillTopSafeArea() -> ConstraintMaker{
        top()
        bottomTopSafe()
        trailing()
        leading()
        return self
    }
    
    @discardableResult
    public func fillBottomSafeArea() -> ConstraintMaker{
        bottom()
        topBottomSafe()
        trailing()
        leading()
        return self
    }
    
    
    
    var width : NSLayoutConstraint? {
        get {
            return findConstraint(.width) ?? findConstraint(.width, otherView)
        }
    }
    
    @discardableResult
    public func width(_ constant : CGFloat = CGFloat(0), _ prioarity : Prioarity = .high , _ type : SpaceType = .equal) -> ConstraintMaker{
        
        makeConstraint(width, first: view.widthAnchor, constant: constant, prioarity: prioarity, type: type)
        return self
    }
    
    @discardableResult
    public func sameWidth(_ constant : CGFloat = CGFloat(0), _ prioarity : Prioarity = .high , _ type : SpaceType = .equal) -> ConstraintMaker{
        
        makeConstraint(width, view.widthAnchor, otherView!.widthAnchor, constant: constant, prioarity: prioarity, type)
        return self
    }
    
    
    var height : NSLayoutConstraint? {
        get {
            return findConstraint(.height) ?? findConstraint(.height, otherView)
        }
    }
    
    @discardableResult
    public func height(_ constant : CGFloat = CGFloat(0), _ prioarity : Prioarity = .high , _ type : SpaceType = .equal) -> ConstraintMaker{
        
        makeConstraint(height, first: view.heightAnchor, constant: constant, prioarity: prioarity, type: type)
        return self
    }
    
    @discardableResult
    public func sameHeight(_ constant : CGFloat = CGFloat(0), _ prioarity : Prioarity = .high , _ type : SpaceType = .equal) -> ConstraintMaker{
        
        makeConstraint(height, view.heightAnchor, otherView!.heightAnchor, constant: constant, prioarity: prioarity, type)
        return self
    }
    
    
    @discardableResult
    public func size(_ _width : CGFloat = CGFloat(0), _ _height : CGFloat = CGFloat(0), _ prioarity : Prioarity = .high , _ type : SpaceType = .equal) -> ConstraintMaker{
        
        width(_width, prioarity, type)
        height(_height, prioarity, type)
        return self
    }
    
    @discardableResult
    public func sameSize(_ _width : CGFloat = CGFloat(0), _ _height : CGFloat = CGFloat(0), _ prioarity : Prioarity = .high , _ type : SpaceType = .equal) -> ConstraintMaker{
        
        sameWidth(_width, prioarity, type)
        sameHeight(_height, prioarity, type)
        return self
    }
    
    @discardableResult
    public func aspectRatio(_ _width : CGFloat = CGFloat(1), _ _height : CGFloat = CGFloat(1), _ prioarity : Prioarity = .high , _ type : SpaceType = .equal) -> ConstraintMaker{
        
        if let con = findConstraint(.width) {
            con.isActive = false
            view.removeConstraint(con)
        }
        
        view.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: _width / _height, constant: 0).isActive = true
        
        return self
    }
    
    var centerX : NSLayoutConstraint? {
        get {
            return findConstraint(.centerX, otherView) ?? findConstraint(.centerXWithinMargins, otherView)
        }
    }
    
    @discardableResult
    public func centerX(_ constant : CGFloat = CGFloat(0), _ prioarity : Prioarity = .high , _ type : SpaceType = .equal) -> ConstraintMaker{
        
        makeConstraint(centerX, view.centerXAnchor, otherView!.centerXAnchor, constant: constant, prioarity: prioarity, type)
        return self
    }
    
    
    var centerY : NSLayoutConstraint? {
        get {
            return findConstraint(.centerY, otherView) ?? findConstraint(.centerYWithinMargins, otherView)
        }
    }
    
    @discardableResult
    public func centerY(_ constant : CGFloat = CGFloat(0), _ prioarity : Prioarity = .high , _ type : SpaceType = .equal) -> ConstraintMaker{
        
        makeConstraint(centerY, view.centerYAnchor,  otherView!.centerYAnchor, constant: constant, prioarity: prioarity,  type)
        return self
    }
    
    @discardableResult
    public func center(_ x : CGFloat = CGFloat(0), _ y : CGFloat = CGFloat(0), _ prioarity : Prioarity = .high , _ type : SpaceType = .equal) -> ConstraintMaker{
        
        centerX(x, prioarity, type)
        centerY(y, prioarity, type)
        return self
    }
    
    
    
    
    
    private func makeConstraint(_ constraint : NSLayoutConstraint?, _ first : NSLayoutXAxisAnchor, _ second : NSLayoutXAxisAnchor, constant : CGFloat, prioarity : Prioarity , _ type : SpaceType ) {
        
        if constraint != nil {
            constraint?.isActive = false
            self.view.removeConstraint(constraint!)
        }
        
        var con : NSLayoutConstraint!
        switch type {
        case .equal:
            con = first.constraint(equalTo: second, constant: constant)
            
        case .greater:
            con = first.constraint(greaterThanOrEqualTo: second, constant: constant)
            
        case .lessThan:
            con = first.constraint(lessThanOrEqualTo: second, constant: constant)
            
        }
        con.priority  = UILayoutPriority(rawValue: Float(prioarity.rawValue))
        con.isActive = true
        
    }
    
    private func makeConstraint(_ constraint : NSLayoutConstraint?, _ first : NSLayoutYAxisAnchor, _ second : NSLayoutYAxisAnchor, constant : CGFloat, prioarity : Prioarity , _ type : SpaceType ) {
        
        
        if constraint != nil {
            constraint?.isActive = false
            self.view.removeConstraint(constraint!)
        }
        
        var con : NSLayoutConstraint!
        switch type {
        case .equal:
            con = first.constraint(equalTo: second, constant: constant)
            
        case .greater:
            con = first.constraint(greaterThanOrEqualTo: second, constant: constant)
            
        case .lessThan:
            con = first.constraint(lessThanOrEqualTo: second, constant: constant)
            
        }
        con.priority  = UILayoutPriority(rawValue: Float(prioarity.rawValue))
        con.isActive = true
    }
    
    private func makeConstraint(_ constraint : NSLayoutConstraint?, _ first : NSLayoutDimension, _ second : NSLayoutDimension, constant : CGFloat, prioarity : Prioarity , _ type : SpaceType ) {
        
        
        if constraint != nil {
            constraint?.isActive = false
            self.view.removeConstraint(constraint!)
        }
        
        var con : NSLayoutConstraint!
        switch type {
        case .equal:
            con = first.constraint(equalTo: second, constant: constant)
            
        case .greater:
            con = first.constraint(greaterThanOrEqualTo: second, constant: constant)
            
        case .lessThan:
            con = first.constraint(lessThanOrEqualTo: second, constant: constant)
            
        }
        con.priority  = UILayoutPriority(rawValue: Float(prioarity.rawValue))
        con.isActive = true
        
        
    }
    
    private func makeConstraint(_ constraint : NSLayoutConstraint?,  first : NSLayoutDimension, constant : CGFloat, prioarity : Prioarity ,  type : SpaceType ) {
        
        
        
        if constraint != nil {
            constraint?.isActive = false
            self.view.removeConstraint(constraint!)
        }
        
        var con : NSLayoutConstraint!
        switch type {
        case .equal:
            con = first.constraint(equalToConstant: constant)
            
        case .greater:
            con = first.constraint(greaterThanOrEqualToConstant: constant)
            
        case .lessThan:
            con = first.constraint(lessThanOrEqualToConstant: constant)
            
        }
        con.priority  = UILayoutPriority(rawValue: Float(prioarity.rawValue))
        con.isActive = true
        
        
    }
    
    
    
    
    
    private func findConstraint(_ attribute : NSLayoutConstraint.Attribute, _ toView : UIView? = nil) -> NSLayoutConstraint? {
        
        
        for con in view.superview?.constraints ?? [] {
            if (con.firstItem as? UIView) == view {
                
                if con.firstAttribute == attribute{
                    return con
                }
            }
            if(con.secondItem as? UIView) == view {
                
                if con.secondAttribute == attribute{
                    return con
                }
            }
        }
        
        for con in view.constraints {
            if (con.firstItem as? UIView) == view && (toView == nil || (con.secondItem as? UIView) == toView) {
                
                if con.firstAttribute == attribute {
                    return con
                }
            }
        }
        
        return nil
    }
    
    
}


extension UIView {
    
    public func addAndConstraint(to otherView : UIView?) -> ConstraintMaker {
        otherView?.addSubview(self)
        return ConstraintMaker(self).to(otherView)
    }
    
    public func constraint(to otherView : UIView?) -> ConstraintMaker {
        
        return ConstraintMaker(self).to(otherView)
    }
    
  
    public var con : ConstraintMaker {
        return ConstraintMaker(self)
    }
}
