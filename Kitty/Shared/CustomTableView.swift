//
//
//  Created by Dinh Van Hoang on 07/04/2023.
//

import Foundation
import UIKit
// BaseTableView sẽ nhận kiểu T như một UITableViewCell
// Thay vì UITableViewCell như trên, BaseTable sẽ nhận BaseCell cùng các kiểu Model được định nghĩa bằng U
class BaseTable<T: BaseCell<U>, U>: UIView, UITableViewDataSource, UITableViewDelegate {
    
    var data = [U]() // Items list được truyền vào BaseTable
    
    private let tb = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        tb.delegate = self
        tb.dataSource = self
        tb.register(T.self, forCellReuseIdentifier: "Cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! T
        cell.item = data[indexPath.row] // Truyền item vào cell, có index dựa vào indexPath
        return cell
    }
    
    private func addView() {
           self.addSubview(tb)
           tb.translatesAutoresizingMaskIntoConstraints = false
           NSLayoutConstraint.activate([
               tb.leadingAnchor.constraint(equalTo: self.leadingAnchor),
               tb.trailingAnchor.constraint(equalTo: self.trailingAnchor),
               tb.topAnchor.constraint(equalTo: self.topAnchor),
               tb.bottomAnchor.constraint(equalTo: self.bottomAnchor)
           ])
       }
       
       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
}

class BaseCell<U>: UITableViewCell {
    var item: U?

}
