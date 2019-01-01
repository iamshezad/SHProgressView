//
//  SHProgressView.swift
//  SHProgressView
//

import UIKit

class SHProgressView: UITableView,UITableViewDataSource,UITableViewDelegate{
    
    var items = [String](){
        didSet{
            for item in items{
                progressItems.append(ProgressData.init(item: item, inactiveCirleColor: self.cricleInactiveColor, activeCircleColor: self.cricleActiveColor, inactiveLineColor: self.lineInactiveColor, activeLineColor: self.lineActiveColor, inactiveTextColor: self.textInactiveColor, activeTextColor: self.textActiveColor))
            }
        }
    }
    
    private var progressItems = [ProgressData]()
    
    var cricleActiveColor: UIColor = UIColor.red.withAlphaComponent(0.8)
    var cricleInactiveColor: UIColor = UIColor.gray
    
    var lineActiveColor: UIColor = UIColor.darkGray
    var lineInactiveColor: UIColor = UIColor.gray

    var textActiveColor: UIColor = UIColor.black
    var textInactiveColor: UIColor = UIColor.gray
    
    private var activeIndex: Int = -1{
        didSet{
            self.reloadData()
        }
    }
    
    private var activeCells: [Int] = []
  
    override func awakeFromNib() {
        self.register(UINib(nibName: "SHCell", bundle: nil), forCellReuseIdentifier: "SHCell")
        self.delegate = self
        self.dataSource = self
        self.tableFooterView = UIView()
        self.separatorStyle = .none
    }
    
    func next(){
        if activeIndex != (items.count-1) {
            activeCells.append(min(items.count-1, activeIndex+1))
            activeIndex = min(items.count-1, activeIndex+1)
           
        }
    }
    
    func previous(){
        if activeIndex != -1{
            activeCells.removeLast()
            activeIndex = max(-1, activeIndex-1)
        }
    }
    
    // MARK: TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return progressItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.dequeueReusableCell(withIdentifier: "SHCell", for: indexPath) as! SHCell
        
        if activeCells.contains(indexPath.row){
             progressItems[indexPath.row].animate = true
        }else{
             progressItems[indexPath.row].animate = false
        }
       
        cell.progress = progressItems[indexPath.row]
        return cell
        
    }
    
}

struct ProgressData{
    
    var item: String
    var inactiveCirleColor: UIColor
    var activeCircleColor: UIColor
    var inactiveLineColor: UIColor
    var activeLineColor: UIColor
    var activeTextColor: UIColor
    var inactiveTextColor: UIColor
    var animate: Bool
    
    init(item:String, inactiveCirleColor:UIColor, activeCircleColor:UIColor, inactiveLineColor:UIColor, activeLineColor:UIColor, inactiveTextColor:UIColor, activeTextColor:UIColor, animate: Bool = false) {
        self.item = item
        
        self.inactiveCirleColor = inactiveCirleColor
        self.activeCircleColor = activeCircleColor
        
        self.inactiveLineColor = inactiveLineColor
        self.activeLineColor = activeLineColor
        
        self.inactiveTextColor = inactiveTextColor
        self.activeTextColor = activeTextColor
        
        self.animate = animate
    }
    
}
