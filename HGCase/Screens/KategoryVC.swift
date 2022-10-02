//
//  KategoryVC.swift
//  HGCase
//
//  Created by Burak AKCAN on 5.09.2022.
//

import UIKit


class KategoryVC: UIViewController {
    
    //MARK: - Views
    var tableView    = UITableView()
    let filterButton = HGButton(backgroundColor: Colors.filterButtonColor, title: "Filtrele", radius: 26)
    
    //MARK: - Properties
    
    var categoryListSet       = Set<String>()
    var categoryList:[String] = []
    var productList:Products  = []
    var selectIndex:Int?
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureNavigation()
        getCategoryList()
        configureTableView()
        setTableViewUI()
        setFilterButton()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
   
    
    func configureNavigation(){
       
        title                            = "Kategoriler"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "multiply"), style: .plain, target: self, action: #selector(cancelButton))
        
    }
    
    func getCategoryList(){
        NetworkManager.shared.getProducts { [weak self] (result) in
            guard let self = self else{return}
            switch result {
            case .failure(let error):
                self.presentHGAlertOnMainThread(title: "Hata", message: error.localizedDescription, buttonTitle: "Ok")
            case .success(let products):
                self.productList = products
                
                for i in products{
                    self.categoryListSet.update(with:i.category.rawValue)
                }
                for i in self.categoryListSet{
                    self.categoryList.append(i.capitalized)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    
                }
            }
        }
    }
    
    func configureTableView(){
        view.addSubview(tableView)
        
       
        tableView.rowHeight  = view.frame.size.height*0.09 // ?? değiş
        tableView.delegate   = self
        tableView.dataSource = self
        tableView.register(CategoryCell.self, forCellReuseIdentifier: CategoryCell.reuseId)
        
    }
    
    
   
    
    func setTableViewUI(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant:  -view.frame.size.height*0.31),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func setFilterButton(){
        view.addSubview(filterButton)
        filterButton.translatesAutoresizingMaskIntoConstraints = false
        filterButton.addTarget(self, action: #selector(clickFilterButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            filterButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.frame.size.height*0.045),
            filterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            filterButton.widthAnchor.constraint(equalToConstant: view.frame.size.width*0.6),
            filterButton.heightAnchor.constraint(equalToConstant: view.frame.size.height*0.07)
            
        ])
        
    }
    
    @objc func cancelButton(){
         dismiss(animated: true)
     }
    
    @objc func clickFilterButton(){
        guard let selectedIndex = selectIndex else {
            presentHGAlertOnMainThread(title: "Hata", message: "Lütfen Bir Kategori Seçiniz", buttonTitle: "Tamam")
            return
        }
        
        let homeVC               = HomeVC()
        homeVC.isCategory        = true
        homeVC.updateProductList = productList.filter({ value in
            value.category.rawValue.lowercased() == categoryList[selectedIndex].lowercased()
        })
        navigationController?.pushViewController(homeVC, animated: true)
        
    }
    
}

extension KategoryVC:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryCell.reuseId, for: indexPath) as! CategoryCell
        let item = categoryList[indexPath.row]
        cell.set(from: item)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectIndex = indexPath.row
        
    }
}


