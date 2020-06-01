//
//  ViewController.swift
//  HW29(Animation_2)
//
//  Created by Macintosh HD on 5/28/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        cv.register(UICollectionView.self, forCellWithReuseIdentifier: "myCVCell")
        cv.backgroundColor = .black
        layout.scrollDirection = .horizontal
        return cv
    }()
    
    @IBOutlet weak var tableView: UITableView!
    var iconArray = [#imageLiteral(resourceName: "walter-white"),#imageLiteral(resourceName: "ninja-head"),#imageLiteral(resourceName: "walter-white"),#imageLiteral(resourceName: "ninja-head")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(myCell.nib(), forCellReuseIdentifier: myCell.ID)
        tableView.dataSource = self
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
            ])
    }

    @IBAction func onAddCellTap(_ sender: UIBarButtonItem) {
        print("AAAA")
        createCollectionView()
    }
    func createCollectionView(){
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)

            ])
        
    }
    
}
extension ViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
}
extension ViewController:UICollectionViewDelegate{
    
}





extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return iconArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: myCell.ID, for: indexPath) as! myCell
        cell.icon.image = iconArray[indexPath.row]
        
        return cell
    }
    
    
}

