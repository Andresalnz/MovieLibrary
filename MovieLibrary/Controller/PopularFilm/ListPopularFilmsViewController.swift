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
    var fetchingBool: Bool = false
    
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
        
        if offsetY > height - scrollView.frame.size.height {
            if !fetchingBool {
                beginBatchFetch()
            }
        }
    }
    
    func beginBatchFetch() {
        fetchingBool = true
        page += 1
        DispatchQueue.main.async {
            self.requestGetPopularFilm(number: self.page)
            self.fetchingBool = false
            self.collectionPopularFilms.reloadData()
        }
    }
}
