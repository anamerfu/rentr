//
//  ViewController.swift
//  rentr
//
//  Created by Ana Merfu on 2016-12-04.
//  Copyright © 2016 Ana Merfu. All rights reserved.
//

import UIKit

let cellId = "cellId"

class ResultsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    
    
    
    let resultsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red:247/255, green:247/255, blue:247/255, alpha:1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }() 
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "RENTR"
        
        collectionView?.alwaysBounceVertical = true
        
        
        collectionView?.backgroundColor = UIColor(white:0.95, alpha: 1)
        
        collectionView?.register(ResultCell.self, forCellWithReuseIdentifier: cellId)

        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target:self, action: #selector(handleLogout))
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width , height: 60)
        
    }
    func handleLogout () {
        let loginController = LoginController()
        present(loginController, animated:true, completion:nil)
    }
    



}

class ResultCell: UICollectionViewCell {
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        
        let attributedText = NSMutableAttributedString(string: "Mark Zuckerberg", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14)])
        
        attributedText.append(NSAttributedString(string:"\nlocation", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 12), NSForegroundColorAttributeName: UIColor(red: 155/255, green: 161/255, blue: 171/255, alpha:1)]))
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        
        attributedText.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, attributedText.string.characters.count))
        
        
            
            
        label.attributedText = attributedText
       // label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = UIColor.red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    func setupViews() {
        backgroundColor = UIColor.white
        
        addSubview(nameLabel)
        addSubview(profileImageView)
        
        addConstraintsWithFormat(format: "H:|-8-[v0(44)]-8-[v1]|", views: profileImageView, nameLabel)
        addConstraintsWithFormat(format: "V:|[v0]|", views: nameLabel)
        addConstraintsWithFormat(format: "V:|-8-[v0(44)]|", views: profileImageView)
        
        
    }
    
}

extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary  = [String: UIView]()
        for (index, view) in views.enumerated(){
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }

}

