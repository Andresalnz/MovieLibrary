//
//  ListPopularFilmsViewController.swift
//  MovieLibrary
//
//  Created by Andres Aleu on 9/2/23.
//

import UIKit

class ListPopularFilmsViewController: UIViewController {
    @IBOutlet weak var collectionPopularFilms: UICollectionView!
    
    
//MARK: - Variables
    var popularFilms: [Outcome] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestGetPopularFilm()
    }
    
    
    //MARK: - LLamada a a la API
    func requestGetPopularFilm() {
        APIClient.shared.getPopularFilms(url: MovieLibraryConstants.POPULARFILM + MovieLibraryConstants.APIKEY) { [weak self] data in
            guard let wSelf = self else {return}
            switch data {
            case .failure(let error):
                print(error)
            case .success(let response):
                wSelf.popularFilms = response
            }
        }
    }
    
    
    
    

}
