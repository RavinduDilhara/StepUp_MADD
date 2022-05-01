//
//  MainPageViewController.swift
//  Assignment03
//
//  Created by Ravidu Dilhara on 2022-04-29.
//

import UIKit

class HomeViewController: BaseViewController {
    var featuredProductsArray:[Product] = [
        Product(prodTitle: "Flat shoes", prodPrice: 4.99, prodImage: UIImage(named: "flat_shoes")!, prodCode: "CVP01", availability: 6, prodDesc: "Flat shoes lore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do "),
        
        Product(prodTitle: "Flip flop for men", prodPrice: 7.99, prodImage: UIImage(named: "flip_flop_for_men")!, prodCode: "CVP02", availability: 8, prodDesc: "Flip flop for men lore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do "),
        
        Product(prodTitle: "Flip flop for women", prodPrice: 13.99, prodImage: UIImage(named: "flip_flops_for_women")!, prodCode: "CVP03", availability: 4, prodDesc: "Flip flop for women lore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do "),
        
        Product(prodTitle: "High heels", prodPrice: 3.99, prodImage: UIImage(named: "high_heels")!, prodCode: "CVP04", availability: 12, prodDesc: "High heels lore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do "),
        
        Product(prodTitle: "House Slippers", prodPrice: 17.99, prodImage: UIImage(named: "house_slippers")!, prodCode: "CVP05", availability: 18, prodDesc: "House Slippers lore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do "),
        
        Product(prodTitle: "Indoor Slippers", prodPrice: 6.99, prodImage: UIImage(named: "indoor_slippers")!, prodCode: "CVP06", availability: 3, prodDesc: "Indoor Slippers lore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do "),
        
        Product(prodTitle: "Loafers", prodPrice: 17.99, prodImage: UIImage(named: "loafers")!, prodCode: "CVP07", availability: 7, prodDesc: "Loafers lore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do "),
        
        Product(prodTitle: "Boot for men", prodPrice: 8.99, prodImage: UIImage(named: "boots_for_men")!, prodCode: "CVP08", availability: 13, prodDesc: "Boot for men lore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ")
    ]
    
    var newProductsArray:[Product] = [
        Product(prodTitle: "Boot for women", prodPrice: 23.99, prodImage: UIImage(named: "boots_for_women")!, prodCode: "CNP01", availability: 3, prodDesc: "Boot for women lore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do "),
        
        Product(prodTitle: "Casual for men", prodPrice: 6.99, prodImage: UIImage(named: "casual_shoes_for_mens")!, prodCode: "CNP05", availability: 20, prodDesc: "Casual for men lore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do "),
        
        Product(prodTitle: "Classic heels", prodPrice: 12.99, prodImage: UIImage(named: "classic_heels")!, prodCode: "CNP02", availability: 2, prodDesc: "Classic heels lore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do "),
        
        Product(prodTitle: "Mens sandals", prodPrice: 5.99, prodImage: UIImage(named: "mens_sandls")!, prodCode: "CNP03", availability: 6, prodDesc: "Mens sandals lore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do "),
        
        Product(prodTitle: "womens sandals", prodPrice: 12.99, prodImage: UIImage(named: "women_sandls")!, prodCode: "CNP04", availability: 12, prodDesc: "womens sandals lore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ")
        
    ]
    
    @IBOutlet weak var featuredCollectionView: UICollectionView!
    @IBOutlet weak var newProductCollectionView: UICollectionView!
    @IBOutlet weak var featuredViewAllLabel: UILabel!
    @IBOutlet weak var newViewAllLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionViews()
        // This is an extension I am using instead of UITapGesture Traditional Way Found on StackOverFlow
        featuredViewAllLabel.addTapGestureRecognizer {
            
            let storyBoard = UIStoryboard(name: "Main", bundle: .main)
            guard let productListVC = storyBoard.instantiateViewController(withIdentifier: "product_list_vc") as? ProductListViewController else {
                return
            }
            productListVC.topNavigationTitle = "Featured Products"
            productListVC.productArray = self.featuredProductsArray
            self.navigationController?.pushViewController(productListVC, animated: true)
        }
        newViewAllLabel.addTapGestureRecognizer {
            let storyBoard = UIStoryboard(name: "Main", bundle: .main)
            guard let productListVC = storyBoard.instantiateViewController(withIdentifier: "product_list_vc") as? ProductListViewController else {
                return
            }
            productListVC.topNavigationTitle = "Featured Products"
            productListVC.productArray = self.newProductsArray
            self.navigationController?.pushViewController(productListVC, animated: true)
        }
    }
    
    func setupCollectionViews(){
        featuredCollectionView.delegate = self
        featuredCollectionView.dataSource = self
        newProductCollectionView.delegate = self
        newProductCollectionView.dataSource = self
        featuredCollectionView.register(ProductCollectionViewCell.nib(), forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        newProductCollectionView.register(ProductCollectionViewCell.nib(), forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == featuredCollectionView{
            if featuredProductsArray.count >= 4{
                return 4
            }else{
                return featuredProductsArray.count
            }
        }else{
            if newProductsArray.count >= 4{
                return 4
            }else{
                return newProductsArray.count
            }
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == featuredCollectionView{
            let featuredCell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as! ProductCollectionViewCell
            
            let product = featuredProductsArray[indexPath.row]
            
            featuredCell.configure(with:product)
            
            return featuredCell
        }else{
            let newCell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as! ProductCollectionViewCell
            
            let product = newProductsArray[indexPath.row]
            
            newCell.configure(with:product)
            
            return newCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == featuredCollectionView{
            let product = featuredProductsArray[indexPath.row]
            
            let storyBoard = UIStoryboard(name: "Main", bundle: .main)
            guard let productListVC = storyBoard.instantiateViewController(withIdentifier: "single_product_vc") as? SingleProductViewController else {
                return
            }
            productListVC.product = product
            self.navigationController?.pushViewController(productListVC, animated: true)
            
            
        }else{
            let product = newProductsArray[indexPath.row]
            
            let storyBoard = UIStoryboard(name: "Main", bundle: .main)
            guard let productListVC = storyBoard.instantiateViewController(withIdentifier: "single_product_vc") as? SingleProductViewController else {
                return
            }
            productListVC.product = product
            self.navigationController?.pushViewController(productListVC, animated: true)
            
            
        }
    }
    
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let totalWidth: CGFloat = ((self.view.frame.width / 2))

            print(totalWidth) // this prints 106.666666667

        return CGSize(width:totalWidth, height:195)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 6
        }
}
