//
//  DetailViewController.swift
//  demo gallery 1
//
//  Created by Md. Kamrul Hasan on 15/6/25.
//

import UIKit

protocol DetailViewControllerDelegate: AnyObject {
    func didDeleteMovie(at index: Int)
}

class DetailViewController: UIViewController {
    
    
    @IBOutlet var detailVCImageView: UIImageView!
    @IBOutlet var detailVCMovieTitle: UILabel!
    @IBOutlet var nextMovieButton: UIBarButtonItem!
    @IBOutlet var previousMovieButton: UIBarButtonItem!
    @IBOutlet var deleteMovieButton: UIBarButtonItem!
    
    var nameToPassDetailVC:String?
    var imageToPassDetailVC:UIImage?
    var movies: [Movie] = []
    var currentIndex: Int = 0
    weak var delegate: DetailViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateMovieView()
    }
    
    @IBAction func deleteMovieAction(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(
            title: "Delete Movie",
            message: "Are you sure you want to delete this movie?",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
            self.deleteCurrentMovie()
        }))
        
        present(alert, animated: true)
    }
    @IBAction func nextMovieShift(_ sender: UIBarButtonItem) {
        currentIndex += 1
        if currentIndex >= movies.count {
            currentIndex = 0
        }
        updateMovieView()
    }
    @IBAction func previousMovieShift(_ sender: UIBarButtonItem) {
        currentIndex -= 1
        if currentIndex < 0 {
            currentIndex = movies.count - 1
        }
        updateMovieView()
    }
    
    
    
    func updateMovieView() {
        
        let movie = movies[currentIndex]
        detailVCImageView.image = movie.image
        detailVCImageView.contentMode = .scaleAspectFit
        //        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        detailVCMovieTitle.text = movie.title
        
        deleteMovieButton.isEnabled = movies.count > 1
        nextMovieButton.isEnabled = movies.count > 1
        previousMovieButton.isEnabled = movies.count > 1
    }
    
    func deleteCurrentMovie() {
        guard !movies.isEmpty else { return }
        
        delegate?.didDeleteMovie(at: currentIndex)
        
        movies.remove(at: currentIndex)
        
        if movies.isEmpty {
            detailVCImageView.image = nil
            detailVCMovieTitle.text = "No more movies"
        } else {
            if currentIndex >= movies.count {
                currentIndex = max(movies.count - 1, 0)
            }
            updateMovieView()
        }
    }
    
    
}
