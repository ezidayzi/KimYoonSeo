//
//  UIButtonExtension.swift
//  KakaoTalk
//
//  Created by 김윤서 on 2021/04/03.
//

import UIKit

extension UIButton{
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
            UIGraphicsBeginImageContext(CGSize(width: 1.0, height: 1.0))
            guard let context = UIGraphicsGetCurrentContext() else { return }
            context.setFillColor(color.cgColor)
            context.fill(CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0))
            
            let backgroundImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
             
            self.setBackgroundImage(backgroundImage, for: state)
        }
    
    func setRoundCorner(_ radius : CGFloat){
        self.layer.masksToBounds = true
        self.layer.cornerRadius = radius
    }
    
    
}
