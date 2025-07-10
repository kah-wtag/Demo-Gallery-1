//
//  MovieCollectionViewCell.swift
//  demo gallery 1
//
//  Created by Md. Kamrul Hasan on 15/6/25.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var movieImageView: UIImageView!
    @IBOutlet var movieTitle: UILabel!
    
    func setup(with movie: Movie) {
        movieImageView.image = movie.image
        movieTitle.text = movie.title
    }
}


/// Project creation - locally
///  Git repo creation
///  connect - local project & git repo
///  create a branch
///  create a pr / mr
///  review
///  merge
