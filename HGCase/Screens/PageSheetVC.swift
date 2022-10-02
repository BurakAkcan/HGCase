//
//  SheetVC.swift
//  HGCase
//
//  Created by Burak AKCAN on 5.09.2022.
//

import UIKit

class PageSheetVC: UIViewController {
    
    //MARK: - Views
    let tableView = UITableView()
    
    //MARK: - Properties
    let tableList:[String]    = ["Markalar","Kategori","Kullanım Amacı","Satıcı","Renk"]
    let categoryList:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white //??
        configureTableView()
    }
    
    func configureTableView(){
        view.addSubview(tableView)
        
        tableView.frame      = view.bounds
        tableView.rowHeight  = view.frame.size.height/CGFloat(tableList.count*2)
        tableView.delegate   = self
        tableView.dataSource = self
        tableView.register(PageSheetCell.self, forCellReuseIdentifier: PageSheetCell.reuseId)
    }
    
}

extension PageSheetVC :UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PageSheetCell.reuseId, for: indexPath) as! PageSheetCell
        let item = tableList[indexPath.row]
        cell.set(from: item)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            
            let kategoriVC                     = KategoryVC()
            let navKategory                    = UINavigationController(rootViewController: kategoriVC)
            navKategory.modalPresentationStyle = .fullScreen
            present(navKategory, animated: true)
        }
    }
    
    
}
