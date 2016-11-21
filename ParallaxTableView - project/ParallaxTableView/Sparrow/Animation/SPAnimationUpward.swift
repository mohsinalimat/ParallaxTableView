//
//  UpwardAnimation.swift
//  reincarnation
//
//  Created by Ivan Vorobei on 6/20/16.
//  Copyright © 2016 Ivan Vorobei. All rights reserved.
//

import UIKit

class SPAnimationUpward {
    
    fileprivate static let durationListAnimation: TimeInterval = 0.45
    fileprivate static let coefLenthForTransition: CGFloat = 2.8
    fileprivate static let delayPerItem: TimeInterval = 0.09
    
    static func hide(_ duration: TimeInterval,
                   view: UIView,
                   delay: TimeInterval = 0,
                   withComplection completion: (() -> Void)! = {}) {
        
        var options: UIViewAnimationOptions = []
        options.insert(.curveEaseIn)
        
        SPAnimationSpring.animate(
            duration, animations: {
                view.alpha = 0
                view.transform = CGAffineTransform(translationX: 0, y: -UIScreen.main.bounds.height / coefLenthForTransition)
            },
            delay: delay,
            options: options,
            withComplection: { finished in
                completion()
                
        })
    }
    
    static func hideList(_ duration: TimeInterval = durationListAnimation,
                       views: [UIView],
                       delayPerItem: TimeInterval = delayPerItem,
                       withComplection completion: (() -> Void)! = {}) {
        
        var del: Double = 0
        for view in views {
            delay(del, closure: {
                if (view == views.last) {
                    SPAnimationUpward.hide(duration, view: view, withComplection: {
                        completion()
                    })
                } else {
                    SPAnimationUpward.hide(duration, view: view)
                }
            })
            del += delayPerItem
        }
        
    }
    
    static func show(_ duration: TimeInterval,
                   view: UIView,
                   delay: TimeInterval = 0,
                   withComplection completion: (() -> Void)! = {}) {
        
        view.alpha = 0
        view.transform = CGAffineTransform(translationX: 0, y: UIScreen.main.bounds.height / coefLenthForTransition)
        
        var options: UIViewAnimationOptions = []
        options.insert(.curveEaseOut)
        
        SPAnimationSpring.animate(
            duration, animations: {
                view.alpha = 1
                view.transform = CGAffineTransform.identity
            },
            delay: delay,
            options: options,
            withComplection: { finished in
                completion()
        })
    }
    
    static func showList(_ duration: TimeInterval = durationListAnimation,
                       views: [UIView],
                       delayPerItem: TimeInterval = delayPerItem,
                       options: UIViewAnimationOptions = [],
                       withComplection completion: (() -> Void)! = {}) {
        
        var del: Double = 0
        for view in views {
            delay(del, closure: {
                if (view == views.last) {
                    SPAnimationUpward.show(duration, view: view, withComplection: {
                        completion()
                    })
                } else {
                    SPAnimationUpward.show(duration, view: view)
                }
            })
            del += delayPerItem
        }
        
    }
}


