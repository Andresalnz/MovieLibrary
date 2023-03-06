//
//  ListPopularFilmsViewController+Extension.swift
//  MovieLibrary
//
//  Created by Andres Aleu on 23/2/23.
//

import Foundation
import UIKit

extension ListPopularFilmsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popularFilms.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionPopularFilms.dequeueReusableCell(withReuseIdentifier: PopularFilmCollectionViewCell.identifier, for: indexPath) as? PopularFilmCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.dataCell(data: popularFilms[indexPath.row])
        
        
        return cell
    }
    
    //Cambiar tamaño
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize = UIScreen.main.bounds
        let widthValue = (screenSize.width - 15) / 2
        let heightVelue = (screenSize.height - 20) / 3
        
        return CGSize (width: widthValue, height: heightVelue)
    }
    
    //espaciado entre lineas
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    //espaciado entre items
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
}
