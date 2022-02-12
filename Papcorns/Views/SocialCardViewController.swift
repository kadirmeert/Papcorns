//
//  SocialCardViewController.swift
//  Papcorns
//
//  Created by MERT on 11.02.2022.
//

import Foundation
import UIKit

class SocialCardViewController : UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var socialCollectionView: UICollectionView!
    @IBOutlet weak var socialTableView: UITableView!
    @IBOutlet weak var homeButton: UIImageView!
    
    @IBOutlet weak var socialButton: UIImageView!
    
    
//    private var socialCardListViewModel : SocialListViewModel!
    private var socialCardTableViewModel : SocialTableViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        socialTableView.dataSource = self
        socialTableView.delegate = self
        self.socialButton.image = UIImage(named: "searchOn")
        self.homeButton.image = UIImage(named: "homeOff")
        getData()
    }
    func getData() {
        let url = URL( string: "http://www.mocky.io/v2/5dea8d843000001d442b09da")!
        WebService().downloadSocials(url: url) { (socials) in
            if let socials = socials{
                self.socialCardTableViewModel = SocialTableViewModel(socialList: socials)
                DispatchQueue.main.async {
                    self.socialTableView.reloadData()
                    
                }
            }
        }
    }
    
    @IBAction func homeBtnPressed(_ sender: Any) {
        self.homeButton.image = UIImage(named: "homeOn")
        self.socialButton.image = UIImage(named: "search")
        self.performSegue(withIdentifier: "home", sender: self)
    }
    @IBAction func socialBtnPressed(_ sender: Any) {
        self.homeButton.image = UIImage(named: "homeOff")
        self.socialButton.image = UIImage(named: "searchOn")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = socialCollectionView.dequeueReusableCell(withReuseIdentifier: "socialCard", for: indexPath) as! SocialCollectionViewCell
       // let socialCardViewModel = self.socialCardListViewModel.movieAtIndex(indexPath.row)
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.socialCardTableViewModel == nil ? 0 : self.socialCardTableViewModel.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = socialTableView.dequeueReusableCell(withIdentifier: "socialCardCell", for: indexPath) as! SocialTableViewCell
        
        let socialCard = self.socialCardTableViewModel.socialAtIndex(indexPath.row)
        cell.nameTitle.text = socialCard.name
        cell.dateTitle.text = "\(socialCard.date)"
        if let data = try? Data(contentsOf: URL(string: socialCard.image)!){
            cell.movieImage.image = UIImage(data: data)
        }
        return cell
    }
}
