//
//  UIimageView+Extension.swift
//  MovieLibrary
//
//  Created by Andres Aleu on 23/2/23.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImges(withUrl url: String) {
        DispatchQueue.global().async { [weak self] in
            let url = URL(string: url)
            if let imageData = try? Data(contentsOf: url!) {
                if let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
