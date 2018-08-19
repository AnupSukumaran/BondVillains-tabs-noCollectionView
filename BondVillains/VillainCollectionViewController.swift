//
//  VillainCollectionViewController.swift
//  BondVillains
//
//  Created by Gabrielle Miller-Messner on 2/3/15.
//  Copyright (c) 2015 Udacity. All rights reserved.
//

import Foundation
import UIKit

// MARK: - VillainCollectionViewController: UICollectionViewController

class VillainCollectionViewController: UICollectionViewController {
    
    // MARK: Properties
    
    // Get ahold of some villains, for the table
    // This is an array of Villain instances
    let allVillains = Villain.allVillains
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    fileprivate let sectionInsets = UIEdgeInsets(top: 3.0, left: 3.0, bottom: 3.0, right: 3.0)
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
//        let paddingSpace = sectionInsets.left * (3 + 1)
//        let availableWidth = view.frame.width - paddingSpace
//        let widthPerItem = availableWidth / 3
//
//        flowLayout.minimumInteritemSpacing = sectionInsets.left
//        flowLayout.minimumLineSpacing = sectionInsets.left
//
//        flowLayout.itemSize =  CGSize(width: widthPerItem, height: widthPerItem)
        NotificationCenter.default.addObserver(self, selector: #selector(orientationDidChange), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
      
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func orientationDidChange(notification: NSNotification) {
        collectionView!.collectionViewLayout.invalidateLayout()
        print("check")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
        self.tabBarController?.tabBar.isHidden = false
    }
    
//    override func viewWillLayoutSubviews() {
//        print("viewWillLayoutSubviews")
//        let space:CGFloat = 3.0
//        let dimensionW = (view.frame.size.width - (3 * space)) / 2.0
//        print("D = \(dimensionW)")
//      //  let dimensionH = dimensionW
//
//        flowLayout.minimumInteritemSpacing = space
//        flowLayout.minimumLineSpacing = space
//
//        flowLayout.itemSize = CGSize(width: dimensionW, height: dimensionW)
//        print("flowLayoutCellSize = \(flowLayout.itemSize)")
//        flowLayout.sectionInset = UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
//
//        flowLayout.invalidateLayout()
//
//    }
    
    // MARK: Table View Data Source
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.allVillains.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VillainCollectionViewCell", for: indexPath) as! VillainCollectionViewCell
        let villain = self.allVillains[(indexPath as NSIndexPath).row]
        
        // Set the name and image
        //cell.nameLabel.text = villain.name
        cell.villainImageView?.image = UIImage(named: villain.imageName)
        //cell.schemeLabel.text = "Scheme: \(villain.evilScheme)"
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:IndexPath) {
        
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "VillainDetailViewController") as! VillainDetailViewController
        detailController.villain = self.allVillains[(indexPath as NSIndexPath).row]
        self.navigationController!.pushViewController(detailController, animated: true)
        
    }
    
}

extension VillainCollectionViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print("Calleddddd123123")
        let dimensionW = (view.frame.size.width - (4 * sectionInsets.left)) / 3.0
//        let paddingSpace = sectionInsets.left * (3 + 1)
//        let availableWidth = view.frame.width - paddingSpace
//        let widthPerItem = availableWidth / 3

        return CGSize(width: dimensionW, height: dimensionW)

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
         print("Calleddddd123123")
        return sectionInsets
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
         print("Calleddddd123123")
        return sectionInsets.left
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
         print("Calleddddd123123")
        return sectionInsets.left
    }

}
