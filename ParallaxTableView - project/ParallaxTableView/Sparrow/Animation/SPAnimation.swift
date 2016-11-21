//
//  Animation.swift
//  PreloaderPhst
//
//  Created by Ivan Vorobei on 6/19/16.
//  Copyright © 2016 Ivan Vorobei. All rights reserved.
//

import UIKit

class SPAnimation {
    
    static func animate(_ duration: TimeInterval,
                        animations: (() -> Void)!,
                        delay: TimeInterval = 0,
                        options: UIViewAnimationOptions = [],
                        withComplection completion: (() -> Void)! = {}) {
        
        UIView.animate(
            withDuration: duration,
            delay: delay,
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
                                       options: UIViewAnimationOptions = [],
                                       withComplection completion: (() -> Void)! = {}) {
        
        var optionsWithRepeatition = options
        optionsWithRepeatition.insert([.autoreverse, .repeat])
        
        self.animate(
            duration,
            animations: {
                animations()
            },
            delay:  delay,
            options: optionsWithRepeatition,
            withComplection: { finished in
                completion()
        })
    }
}


