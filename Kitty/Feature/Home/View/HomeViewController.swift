//
//  HomeViewController.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 17/04/2023.
//

import UIKit

class HomeViewController: UIViewController {
    var homeViewModel  = HomeViewModel()
    @IBOutlet weak var incomeStatView: ItemHomeStatView!
    @IBOutlet weak var balanceStatView: ItemHomeStatView!
    @IBOutlet weak var paymentStatView: ItemHomeStatView!
    @IBOutlet weak var homeStatStackView: UIStackView!
    @IBOutlet weak var calendarView: UIView!
    @IBOutlet weak var historyTableView: HistoryTableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
//        configCalendarView()
        configHomeStatView()
        configHistoryTableView()
        
        
        // Do any additional setup after loading the view.
    }
}
extension HomeViewController {
    private func configHomeStatView(){
     
        paymentStatView.config(with: ItemHomeStatViewModel(icon: AssetIcon.icPayment, value: String(-(homeViewModel.listStatisticMonth?.monthExpense ?? 0)), title: "Expenses",valueColor: UIColor(named: AssetColor.red)))
        
        balanceStatView.config(with: ItemHomeStatViewModel(icon: AssetIcon.icWallet, value: String(homeViewModel.listStatisticMonth?.monthBalance ?? 0 ), title: "Balance",valueColor: UIColor(named: AssetColor.gray)))
       
        incomeStatView.config(with: ItemHomeStatViewModel(icon: AssetIcon.icBank, value: String(homeViewModel.listStatisticMonth?.monthIncome ?? 0), title: "Income",valueColor: UIColor(named: AssetColor.PrimaryTextColor)))
    }
    private func configHistoryTableView(){
        historyTableView.monthlyData = homeViewModel.listStatisticMonth
        historyTableView.bounces = false
        historyTableView.rowHeight = UITableView.automaticDimension
        historyTableView.estimatedRowHeight = 300
        historyTableView.sizeToFit()
    }
}
