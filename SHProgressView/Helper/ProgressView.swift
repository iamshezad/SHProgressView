//
//  ProgressView.swift
//  SHProgressView
//

import Foundation
import UIKit

class ProgressView: UIView {
    
    private let fillView = UIView(frame: CGRect.zero)
    
    private var coeff:CGFloat = 0.0 {
        didSet {
            updateFillViewFrame()
        }
    }
    
    var inactiveColor: UIColor = UIColor.gray
    var activeColor: UIColor = UIColor.red.withAlphaComponent(0.8)
    var isCircle: Bool = false
    
    
    // Only needed if view isn't created in xib or storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // Only needed if view isn't created in xib or storyboard
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    override func awakeFromNib() {
        setupView()
    }
    
    private func setupView() {
        
        if isCircle{
            layer.cornerRadius = bounds.height/2.0
            layer.masksToBounds = true
        }
       
        backgroundColor = inactiveColor
        
        fillView.backgroundColor = activeColor
        addSubview(fillView)

        updateFillViewFrame()
    }
    
    private func updateFillViewFrame() {
        
        fillView.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height*coeff)
        
    }
    
    func setCoeff(coeff: CGFloat, animated: Bool, completion: @escaping (Bool) -> ()) {
        if animated {
            UIView.animate(withDuration: 0.5, animations: {
                self.coeff = coeff
            }) { (animated) in
                completion(true)
            }
        } else {
            self.coeff = coeff
            completion(true)
        }
    }
    
}
