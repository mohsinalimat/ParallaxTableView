//
//  SPAnimationSpring.swift
//  reincarnation
//
//  Created by Ivan Vorobei on 6/27/16.
//  Copyright © 2016 Ivan Vorobei. All rights reserved.
//

import UIKit

class SPAnimationSpring {
    
    fileprivate static let spring: CGFloat = 1
    fileprivate static let velocity: CGFloat = 1
    
    static func animate(_ duration: TimeInterval,
                        animations: (() -> Void)!,
                        delay: TimeInterval = 0,
                        spring: CGFloat = spring,
                        velocity: CGFloat = velocity,
                        options: UIViewAnimationOptions = [],
                        withComplection completion: (() -> Void)! = {}) {
        
        UIView.animate(
            withDuration: duration,
            delay: delay,
            usingSpringWithDamping: spring,
            initialSpringVelocity: velocity,
            options: options,
            animations: {
                animations()
            }, completion: { finished in
                completion()
        })
    }
    
    static func animateWithRepeatition(_ duration: TimeInterval,
                                       animations: (() -> Void)!,
                                       delay: TimeInterval = 0,
                                       spring: CGFloat = spring,
                                       velocity: CGFloat = velocity,
                                       options: UIViewAnimationOptions = [],
                                       withComplection completion: (() -> Void)! = {}) {
        
        var optionsWithRepeatition = options
        optionsWithRepeatition.insert([.autoreverse, .repeat])
        
        UIView.animate(
            withDuration: duration,
            delay: delay,
            usingSpringWithDamping: spring,
            initialSpringVelocity: velocity,
            options: optionsWithRepeatition,
            animations: {
                animations()
            }, completion: { finished in
                completion()
        })
    }
}
