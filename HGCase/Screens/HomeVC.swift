//
//  HomeVC.swift
//  HGCase
//
//  Created by Burak AKCAN on 2.09.2022.
//

import UIKit

class HomeVC: UIViewController {
    
    enum Section{
        case main
    }
    
    //MARK: -Views
    
   
    var collectionView:UICollectionView!
    var dataSource:UICollectionViewDiffableDataSource<Section,Product>!
    
    
    
    let roundedView     = RoundedView()
    let filterIcon      = UIImageView()
    let sortIcon        = UIImageView()
    let sortLabel       = HGBodyLabel(textAlign: .center, fontSize: 16)
    let filterLabel     = HGBodyLabel(textAlign: .center, fontSize: 16)
    let stackViewSort   = UIStackView()
    let stackViewFilter = UIStackView()
    
    
    //MARK: - Properties
    
    var isSearching:Bool           = false
    var products:Products          = []
    var filteredProducts:Products  = []
    var updateProductList:Products = []
    var isCategory:Bool            = false
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.setToolbarHidden(false, animated: true)
       
        configureSearchController()
        configureRounded()
        configureSortStackView()
        configureFilterStackView()
        addGesture()
        getProducts()
        configureCollectionView()
        configureDataSource()
        configureCollectionViewUI()
    }
    

    
    
    func addGesture(){
        let gestureSortStack                     = UITapGestureRecognizer(target: self, action: #selector(sortTapped))
        stackViewSort.isUserInteractionEnabled   = true
        let gestureFilterStack                   = UITapGestureRecognizer(target: self, action: #selector(filterTapped))
        stackViewFilter.isUserInteractionEnabled = true
        stackViewFilter.addGestureRecognizer(gestureFilterStack)
        stackViewSort.addGestureRecognizer(gestureSortStack)
        
    }
    
    func configureCollectionView(){
        collectionView = UICollectionView(frame: view.bounds,collectionViewLayout: UIHelpers.createTwoColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.delegate        = self
        collectionView.backgroundColor = .white
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.reuseID)
    }
    
    func updateData(listProduct:Products){
        var snapshot = NSDiffableDataSourceSnapshot<Section,Product>()
        snapshot.appendSections([.main])
        isCategory == true ? snapshot.appendItems(updateProductList) : snapshot.appendItems(listProduct)

        DispatchQueue.main.async {
            self.dataSource.apply(snapshot,animatingDifferences: true)
        }
    }
    
    func getProducts(){
        NetworkManager.shared.getProducts { [weak self] (result) in
            guard let self = self else{return}
            switch result {
            case .failure(let error):
                self.presentHGAlertOnMainThread(title: "Hata", message: error.localizedDescription, buttonTitle: "Ok")
            case .success(let products):
                self.products.append(contentsOf: products)
                self.updateData(listProduct: products)
              
            }
        }
    }
    
    func configureDataSource(){
        dataSource = UICollectionViewDiffableDataSource<Section,Product>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, itemIdentifier)->UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.reuseID, for: indexPath) as! ProductCell
            cell.set(product: itemIdentifier)
            return cell
        })
    }
    
    
    
    func configureSearchController(){
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Kategori veya ürün ara"
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        
    }
    
    func configureRounded(){
        
        view.addSubview(roundedView)
        roundedView.translatesAutoresizingMaskIntoConstraints = false
        roundedView.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            roundedView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor,constant:view.frame.size.height*0.01),
           
           roundedView.heightAnchor.constraint(equalToConstant: 50),
            roundedView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            roundedView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            
        ])
        
    }
    

    
  func configureSortStackView(){
        stackViewSort.axis         = .horizontal
        stackViewSort.distribution = .fillEqually
        sortLabel.text             = "Sırala"
        sortIcon.image             = Images.sortImage
        sortIcon.tintColor         = Colors.textColor
        sortIcon.contentMode       = .scaleAspectFit
        sortIcon.translatesAutoresizingMaskIntoConstraints = false
        sortLabel.translatesAutoresizingMaskIntoConstraints = false

        stackViewSort.addArrangedSubview(sortIcon)
        stackViewSort.addArrangedSubview(sortLabel)


        roundedView.addSubview(stackViewSort)
        stackViewSort.translatesAutoresizingMaskIntoConstraints = false
      
         NSLayoutConstraint.activate([
            stackViewSort.leadingAnchor.constraint(equalTo: roundedView.leadingAnchor,constant: view.frame.size.width*0.12),
            stackViewSort.centerYAnchor.constraint(equalTo: roundedView.centerYAnchor),
         ]) }
    
    func configureFilterStackView(){
        stackViewFilter.axis         = .horizontal
        stackViewFilter.distribution = .fillEqually
        filterLabel.text             = "Filtre"
        filterIcon.image             = Images.filterImage
        filterIcon.tintColor         = Colors.textColor
        filterIcon.contentMode       = .scaleAspectFit
        
        filterIcon.translatesAutoresizingMaskIntoConstraints  = false
        filterLabel.translatesAutoresizingMaskIntoConstraints = false

        stackViewFilter.addArrangedSubview(filterIcon)
        stackViewFilter.addArrangedSubview(filterLabel)


        roundedView.addSubview(stackViewFilter)
        stackViewFilter.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            stackViewFilter.trailingAnchor.constraint(equalTo: roundedView.trailingAnchor,constant:-view.frame.size.width*0.12),
            stackViewFilter.centerYAnchor.constraint(equalTo: roundedView.centerYAnchor),

        ]) }
    
    func configureCollectionViewUI(){
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: roundedView.bottomAnchor, constant: view.frame.size.height*0.04),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
        
}
    
extension HomeVC:UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
        guard let filter = searchController.searchBar.text,
              !filter.isEmpty else{
            filteredProducts.removeAll()
            isSearching = false
            updateData(listProduct: products)
            return
        }
        isSearching = true
        filteredProducts = products.filter({ $0.title.lowercased().contains(filter.lowercased())})
        print(filteredProducts.count)
        updateData(listProduct: filteredProducts)
        
    }
}

extension HomeVC:UICollectionViewDelegate{
    @objc func sortTapped(){
        print("Test edildi")
    }
    
    @objc func filterTapped(){
        let sheetViewController = PageSheetVC(nibName: nil, bundle: nil)
        sheetViewController.modalPresentationStyle = .pageSheet
        
        if let sheet = sheetViewController.sheetPresentationController{
            sheet.detents = [.medium()]
            sheet.prefersScrollingExpandsWhenScrolledToEdge = true
        }
        
        present(sheetViewController, animated: true)
    }
  
}

    
    

