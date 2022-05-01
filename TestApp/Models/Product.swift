//
//  Product.swift
//  Assignment03
//
//  Created by Ravidu Dilhara on 2022-04-29.
//

import Foundation
import UIKit

class Product:NSObject{
    var prodTitle:String?
    var prodPrice:Double?
    var prodImage:UIImage
    var prodCode:String?
    var availability:Int?
    var prodDesc:String?
    
    init(prodTitle: String, prodPrice: Double, prodImage: UIImage, prodCode: String, availability: Int, prodDesc: String) {
        self.prodTitle = prodTitle
        self.prodPrice = prodPrice
        self.prodImage = prodImage
        self.prodCode = prodCode
        self.availability = availability
        self.prodDesc = prodDesc
    }
}
