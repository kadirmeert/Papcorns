//
//  MainViewController.swift
//  Papcorns
//
//  Created by MERT on 9.02.2022.
//

import UIKit

class MainViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    @IBOutlet weak var topcollectionView: UICollectionView!
    @IBOutlet weak var bottomCollectionView: UICollectionView!
    @IBOutlet weak var homeButton: UIImageView!
    @IBOutlet weak var socialCardButton: UIImageView!
    
    private var movieListViewModel : MovieListViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        topcollectionView.delegate = self
        topcollectionView.dataSource = self
        bottomCollectionView.delegate = self
        bottomCollectionView.dataSource = self
        self.homeButton.image = UIImage(named: "homeOn")
        getData()
    }
    //    override func viewWillDisappear(_ animated: Bool) {
    //        super.viewWillDisappear(animated)
    //
    //    }
    func getData() {
        let url = URL( string: "http://www.mocky.io/v2/5dea8bf6300000d23f2b09d0")!
        WebService().downloadMovies(url: url) { (movies) in
            if let movies = movies{
                self.movieListViewModel = MovieListViewModel(movieList: movies)
                DispatchQueue.main.async {
                    self.topcollectionView.reloadData()
                    self.bottomCollectionView.reloadData()
                }
            }
        }
    }
    
    @IBAction func homeBtnPressed(_ sender: Any) {
        self.homeButton.image = UIImage(named: "homeOn")
        self.socialCardButton.image = UIImage(named: "search")
    }
    @IBAction func socialCardBtnPressed(_ sender: Any) {
        self.homeButton.image = UIImage(named: "homeOff")
        self.socialCardButton.image = UIImage(named: "searchOn")
        self.performSegue(withIdentifier: "socialCard", sender: self)

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movieListViewModel == nil ? 0 : self.movieListViewModel.numberOfRowSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       // var return_cell: UICollectionViewCell
        
        
        let cell = topcollectionView.dequeueReusableCell(withReuseIdentifier: "TopMovieCell", for: indexPath) as! TopCollectionViewCell
        
        let topMovieViewModel = self.movieListViewModel.movieAtIndex(indexPath.row)
        cell.TopmovieName.text = topMovieViewModel.name
        cell.TopmovieDate.text = topMovieViewModel.date
        cell.TopMovieClass.text = "\(topMovieViewModel.like)"
        if let data = try? Data(contentsOf: URL(string: topMovieViewModel.image)!){
            cell.TopmovieImage.image = UIImage(data: data)
        }
        
        let cellBottom = bottomCollectionView.dequeueReusableCell(withReuseIdentifier: "BottomMovieCell", for: indexPath) as! BottomCollectionViewCell
        
        let bottomMovieViewModel = self.movieListViewModel.movieAtIndex(indexPath.row)
       
        if topMovieViewModel.like > 0 {
        cellBottom.bottomName.text = bottomMovieViewModel.name
        cellBottom.bottomDate.text = bottomMovieViewModel.date
        if let data = try? Data(contentsOf: URL(string: bottomMovieViewModel.image)!) {
            cellBottom.bottomImage.image = UIImage(data: data)
        }
        }
        return cell
        
//        if collectionView == topcollectionView {
//            return_cell = cell
//        } else  {
//            return_cell = cellBottom
//        }
//        return return_cell
   }
}



