//
//  SHCell.swift
//  SHProgressView
//


import UIKit

class SHCell: UITableViewCell {

    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var circleView: ProgressView!
    @IBOutlet weak var topView: ProgressView!
    @IBOutlet weak var bottomView: ProgressView!
    
    var progress: ProgressData?{
        didSet{
            contentLabel.text = progress?.item ?? ""
            
            
            circleView.inactiveColor = progress?.inactiveCirleColor ?? UIColor.gray
            circleView.activeColor = progress?.activeCircleColor ?? UIColor.black
            circleView.isCircle = true
            circleView.awakeFromNib()
            
            topView.inactiveColor = progress?.inactiveLineColor ?? UIColor.gray
            topView.activeColor = progress?.activeLineColor ?? UIColor.black
            topView.awakeFromNib()
            
            bottomView.inactiveColor = progress?.inactiveLineColor ?? UIColor.gray
            bottomView.activeColor = progress?.activeLineColor ?? UIColor.black
            bottomView.awakeFromNib()
            
            if (progress?.animate ?? false){
                topView.setCoeff(coeff: 1.0, animated: true) { (animated) in
                    self.circleView.setCoeff(coeff: 1.0, animated: true) { (animated) in
                        self.bottomView.setCoeff(coeff: 1.0, animated: true) { (animated) in
                            if (self.progress?.animate ?? false){
                                self.contentLabel.textColor = self.progress?.activeTextColor ?? UIColor.black
                            }else{
                                self.contentLabel.textColor = self.progress?.inactiveTextColor ?? UIColor.gray
                            }
                        }
                    }
                }
            }else{
                bottomView.setCoeff(coeff: 0.0, animated: true) { (animated) in
                    self.circleView.setCoeff(coeff: 0.0, animated: true) { (animated) in
                        self.topView.setCoeff(coeff: 0.0, animated: true) { (animated) in
                            if (self.progress?.animate ?? false){
                                self.contentLabel.textColor = self.progress?.activeTextColor ?? UIColor.black
                            }else{
                                self.contentLabel.textColor = self.progress?.inactiveTextColor ?? UIColor.gray
                            }
                        }
                    }
                }
            }
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func setProgress(activeColor:UIColor,inactiveColor:UIColor,animated:Bool){
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
