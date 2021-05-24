//
//  UICollectionView.swift
//  UICollectionViewExtandCell
//
//  Created by Jmy on 2021/05/24.
//

import UIKit

extension UICollectionView {
    
    // MARK: - Methods
    
    func register<T: UICollectionViewCell>(_: T.Type) {
        register(T.self, forCellWithReuseIdentifier: T.description)
    }
    
    func registerNib<T: UICollectionViewCell>(_: T.Type) {
        let bundle: Bundle = Bundle(for: T.self)
        let nib: UINib = UINib(nibName: T.description, bundle: bundle)
        
        register(nib, forCellWithReuseIdentifier: T.description)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.description, for: indexPath) as? T else {
            fatalError("Could not dequeue cell: \(T.self) with identifier: \(T.description)")
        }
        return cell
    }
}