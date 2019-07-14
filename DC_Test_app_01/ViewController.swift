//
//  ViewController.swift
//  DC_Test_app_01
//
//  Created by Alexander on 12.07.2019.
//  Copyright © 2019 Alexander. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var deviceImage: UIImageView!
    @IBOutlet weak var playVisualView: UIVisualEffectView!
    
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var detailsView: UIVisualEffectView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var heroView: UIView!
    @IBOutlet weak var bookView: UIView!
    
    @IBOutlet weak var chapterCollectionView: UICollectionView!
    
    @IBAction func playButtonTapped(_ sender: Any) {
        let urlString = "https://player.vimeo.com/external/235468301.hd.mp4?s=e852004d6a46ce569fcf6ef02a7d291ea581358e&profile_id=175"
        
        let url = URL(string: urlString)
        let player = AVPlayer(url: url!)
    
        let playerController = AVPlayerViewController()
        playerController.player = player
        present(playerController, animated: true) {
            player.play()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        chapterCollectionView.delegate = self
        chapterCollectionView.dataSource = self
        
        titleLabel.alpha = 0
        
        UIView.animate(withDuration: 1.5) {
            self.titleLabel.alpha = 1
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sectionCell", for: indexPath) as! SectionCollectionViewCell
        
        let section = sections[indexPath.row]
        cell.titleLabel.text = section["title"]
        cell.captionLabel.text = section["caption"]
        cell.coverImageView.image = UIImage(named: section["image"]!)
        
        return cell
    }
    
    
}

extension ViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        
        if offsetY < 0 {
            heroView.transform = CGAffineTransform(translationX: 0, y: offsetY)
            detailsView.transform = CGAffineTransform(translationX: 0, y: -offsetY/3)
            titleLabel.transform = CGAffineTransform(translationX: 0, y: -offsetY/3)
            deviceImage.transform = CGAffineTransform(translationX: 0, y: -offsetY/4)
            playVisualView.transform = CGAffineTransform(translationX: 0, y: -offsetY/4)
            bgImageView.transform = CGAffineTransform(translationX: 0, y: -offsetY/5)
        }
    }
}

