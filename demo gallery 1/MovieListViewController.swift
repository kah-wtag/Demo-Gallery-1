//
//  MovieListViewController.swift
//  demo gallery 1
//
//  Created by Md. Kamrul Hasan on 6/7/25.
//

import UIKit

class MovieListViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    
    // TODO: remove data from vc
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
    
}

extension MovieListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:120, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MovieDataProvider.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        cell.setup(with: MovieDataProvider.movies[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        detailVC.movies = MovieDataProvider.movies
        detailVC.currentIndex = indexPath.row
        detailVC.delegate = self
        
       
        UIBarButtonItem().title = ""
        navigationItem.backBarButtonItem = UIBarButtonItem()
        
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
    
extension MovieListViewController: DetailViewControllerDelegate {
    // TODO: put these delegates in a separate extensions
    
    // TODO: use seaprate extensions for implemented delegates
    func didDeleteMovie(at index: Int) {
        guard index < MovieDataProvider.movies.count else { return }
        MovieDataProvider.movies.remove(at: index)
        collectionView.reloadData()
    }
}
