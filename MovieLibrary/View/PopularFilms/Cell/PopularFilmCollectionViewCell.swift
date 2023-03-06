//
//  PopularFilmCollectionViewCell.swift
//  MovieLibrary
//
//  Created by Andres Aleu on 23/2/23.
//

import UIKit

class PopularFilmCollectionViewCell: UICollectionViewCell {
    //MARK: - IBOutlet
    
    //image Film
    @IBOutlet weak var viewImageFilm: UIView!
    @IBOutlet weak var imageFilm: UIImageView!
    
    //information
    @IBOutlet weak var viewInformationFilm: UIView!
    @IBOutlet weak var lblTitleFilm: UILabel!
    @IBOutlet weak var lblYearFilm: UILabel!
    @IBOutlet weak var lblLengthFilm: UILabel!
    @IBOutlet weak var lblVoteAverage: UILabel!
    
    //overview
    @IBOutlet weak var lblOverviewFilm: UILabel!
    @IBOutlet weak var viewOverview: UIView!
    
    
    //MARK: - Variables
    static let identifier: String = "PopularCell"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
   
    
    //MARK: - Draw information
    func dataCell(data: Outcome) {
       
        if let image = data.posterPath {
            self.imageFilm.loadImges(withUrl: "https://image.tmdb.org/t/p/w200\(image)")
            print("https://image.tmdb.org/t/p/w200\(image)")
        } else {
            print("Error al cargar la imagen")
        }
      
        
      
        
       
        
        
    }

}

