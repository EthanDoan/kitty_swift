//
//  ExpenseTableView.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 18/04/2023.
//

import UIKit

class HistoryTableView: UITableView , UITableViewDelegate , UITableViewDataSource {
        
    
    var monthlyData:StatisticMonth?;
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return monthlyData?.listStatisticDay.count ?? 0
    }
    
    
    override var contentSize: CGSize {
               didSet {
                   invalidateIntrinsicContentSize()
                   setNeedsLayout()
               }
       }
       override var intrinsicContentSize: CGSize {
           return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
       }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 12
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect.zero)
        
        headerView.backgroundColor = .none
        return headerView
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : HistoryTableViewCell = (tableView.dequeueReusableCell(withIdentifier:HistoryTableViewCell.identifer,for: indexPath)) as! HistoryTableViewCell
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 5
        cell.layer.borderColor = UIColor(named: AssetColor.borderColor)?.cgColor
        cell.clipsToBounds = true
        cell.configureData(with: monthlyData?.listStatisticDay[indexPath.section])
        
        
        return cell
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: CGRect.zero, style: .plain)
        initTableView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initTableView()
    }
        
    private func initTableView() {
        register(HistoryTableViewCell.nib(), forCellReuseIdentifier: HistoryTableViewCell.identifer)
        delegate = self
        dataSource = self
        separatorStyle = .none
    }
}
