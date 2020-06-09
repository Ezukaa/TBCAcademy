//
//  ViewController.swift
//  HW36
//
//  Created by Macintosh HD on 6/8/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var tmpX: Int = 0
    
    var pages = [Pages]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        
        setupPages()
    }
    private func setupPages() {
        let page1 = Pages(imageNamed: "first_image", title: "Online shopping", text: "Women Fashion Shopping Online - Shop from a huge range of latest women clothing, shoes, makeup Kits, Watches, footwear and more for women at best price")
        
        let page2 = Pages(imageNamed: "second_image", title: "Add to cart", text: "Add to cart button works on product pages. The customizations in this section  compatible with dynamic checkout buttons")
        
        let page3 = Pages(imageNamed: "third_image", title: "Payment Successful", text: "Your payment has been successfully completed. You will receive a confirmation email within a few minutes. ")
        
        self.pages.append(page1)
        self.pages.append(page2)
        self.pages.append(page3)
        
        
        pageController.numberOfPages = self.pages.count
    }

    @IBAction func onSkipTap(_ sender: UIButton) {
    }
    var currentPage = 0
    @IBAction func onNextTap(_ sender: UIButton) {
        if currentPage == 2 {return}
        currentPage += 1
        let index = IndexPath(item: currentPage, section: 0)
        collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        pageController.currentPage = currentPage
    }
    
}
extension ViewController:UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! myCell
        cell.desc.text = pages[indexPath.row].text
        cell.title.text = pages[indexPath.row].title
        cell.image.image = pages[indexPath.row].image
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let offset = targetContentOffset.pointee
        let x = offset.x
        
        let pageIndex = x / collectionView.frame.width
        pageController.currentPage = Int(pageIndex)
    }

}




