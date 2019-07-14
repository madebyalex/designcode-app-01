//
//  TestimonialViewController.swift
//  DC_Test_app_01
//
//  Created by Alexander on 15.07.2019.
//  Copyright © 2019 Alexander. All rights reserved.
//

import UIKit

class TestimonialViewController: UIViewController {
    
    
    @IBOutlet weak var testimonialCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testimonialCollectionView.delegate = self
        testimonialCollectionView.dataSource = self
    }

}

extension TestimonialViewController: UICollectionViewDelegate, UICollectionViewDataSource  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testimonials.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "testimonialCell", for: indexPath) as! TestimonialCollectionViewCell
        
        let testimonial = testimonials[indexPath.row]
        
        cell.textLabel.text = testimonial["text"]
        cell.nameLabel.text = testimonial["name"]
        cell.jobLabel.text = testimonial["job"]
        cell.avatarImage.image = UIImage(named: testimonial["avatar"]!)
        
        return cell
    }
}
