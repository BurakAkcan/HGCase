//
//  HGTabbarController.swift
//  HGCase
//
//  Created by Burak AKCAN on 2.09.2022.
//

import UIKit

class HGTabbarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabbar()
        viewControllers = [createHome(),createCatagory(),createTag(),createSettings()]
    }
    
    func configureTabbar(){
        UITabBar.appearance().tintColor       = .systemYellow
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    
    //MARK: - Create Navigation Controllers
    
    func createHome()->UINavigationController{
        let homeVC        = HomeVC()
        homeVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: SFSymbols.home), tag: 0)
        return UINavigationController(rootViewController: homeVC)
    }
    
    func createCatagory()->UIViewController{
        let categoryVC        = ListVC()
        categoryVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: SFSymbols.category), tag: 1)
        return UINavigationController(rootViewController: categoryVC)
    }
    
    func createTag()->UIViewController{
        let tagVC        = TagVC()
        tagVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: SFSymbols.tag), tag: 2)
        return UINavigationController(rootViewController: tagVC)
    }
    
    func createSettings()->UIViewController{
        let userVC        = UserVC()
        userVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: SFSymbols.user), tag: 3)
        return UINavigationController(rootViewController: userVC)
    }
    

}
