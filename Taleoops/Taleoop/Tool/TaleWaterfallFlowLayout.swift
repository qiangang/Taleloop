//
//  TaleWaterfallFlowLayout.swift
//  Taleoop
//
//  Created by Ben on 30/5/2025.
//

import UIKit
 
class TaleWaterfallFlowLayout: UICollectionViewFlowLayout {
    private var layoutAttributes = [UICollectionViewLayoutAttributes]()
    private var contentWidth: CGFloat = 0
    private var contentHeight: CGFloat = 0
    
    override func prepare() {
        super.prepare()
        guard let collectionView = collectionView else { return }
        
        layoutAttributes.removeAll()
        contentWidth = 0
        contentHeight = collectionView.bounds.height
        
        let itemHeight: CGFloat = 25
        let rowCount = 2
        var xOffsets = [CGFloat](repeating: sectionInset.left, count: rowCount)
        var yOffsets = [CGFloat]()
        
        for row in 0..<rowCount {
            yOffsets.append(CGFloat(row) * (itemHeight + minimumLineSpacing))
        }
        
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            let text = (collectionView.dataSource as? TaleDiscoverTopicCell)?.dataSource[indexPath.item] as? TaleBeModel
            
            let itemWidth = min(calculateTextWidth(text: text?.polarisable ?? "") + 29 + 30,200)
            
            
            let row = item % rowCount
            
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = CGRect(x: xOffsets[row],
                                    y: yOffsets[row],
                                    width: itemWidth,
                                    height: itemHeight)
            layoutAttributes.append(attributes)
            
            xOffsets[row] += itemWidth + minimumInteritemSpacing
        }
        
        contentWidth = xOffsets.max()! - minimumInteritemSpacing + sectionInset.right
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return layoutAttributes.filter { $0.frame.intersects(rect) }
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    private func calculateTextWidth(text: String) -> CGFloat {
        let font = UIFont.systemFont(ofSize: 15)
        let size = (text as NSString).size(withAttributes: [.font: font])
        return size.width
    }
}

