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
    var page: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigation()
        setUpCollection()
        requestGetPopularFilm(number: page)
    }
    
    
    //MARK: - LLamada a a la API
    func requestGetPopularFilm(number: Int) {
        APIClient.shared.getPopularFilms(url: MovieLibraryConstants.POPULARFILM + MovieLibraryConstants.APIKEY, number: page) { [weak self] data in
            guard let wSelf = self else {return}
            switch data {
            case .failure(let error):
                print(error)
            case .success(let response):
                wSelf.popularFilms.append(contentsOf: response)
                DispatchQueue.main.async {
                    wSelf.collectionPopularFilms.reloadData()
                }
            }
        }
    }
    
    //MARK: - Prepare Collection
    func setUpCollection() {
        self.collectionPopularFilms.backgroundColor = .black
        self.view.backgroundColor = .black
        collectionPopularFilms.delegate = self
        collectionPopularFilms.dataSource = self
        collectionPopularFilms.register(UINib(nibName:"PopularFilmCollectionViewCell", bundle: nil), forCellWithReuseIdentifier:PopularFilmCollectionViewCell.identifier)
    }
    
    func setUpNavigation() {
        self.title = "Popular"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }

    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let height = scrollView.contentSize.height
        
        if offsetY > height - scrollView.frame.size.height && popularFilms.count > 0 {
            page += 1
            requestGetPopularFilm(number: page)
        }
    }
}
