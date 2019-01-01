//
//  ViewController.swift
//  SHProgressSample
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressTV: SHProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "SHProgressView"
        
        setuProgressView()
    }

    func setuProgressView(){
    
        //Progress cirle active & inactive color
        progressTV.cricleActiveColor = UIColor(red: 0.0/255.0, green: 204.0/255.0, blue: 201.0/255.0, alpha: 1.0)
        progressTV.cricleInactiveColor = UIColor.gray
        
        //Progress line active & inactive color
        progressTV.lineActiveColor = UIColor(red: 0.0/255.0, green: 204.0/255.0, blue: 201.0/255.0, alpha: 1.0)
        progressTV.lineInactiveColor = UIColor.gray
        
        //Text active & inactive color
        progressTV.textActiveColor = UIColor.darkGray
        progressTV.textInactiveColor = UIColor.gray
        
        
        progressTV.items = ["Sample item one","Sample item two","Sample item three","Sample item four","Sample item five"]
        
    }
    
    @IBAction func nextAction(_ sender: UIButton) {
       progressTV.next()
    }
    
    @IBAction func previousAction(_ sender: UIButton) {
      progressTV.previous()
    }
    
}

