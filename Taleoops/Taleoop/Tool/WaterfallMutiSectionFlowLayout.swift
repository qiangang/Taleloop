//
//  WaterfallMutiSectionFlowLayout.swift
//  gymbo
//
//  Created by drogan Zheng on 2020/5/7.
//  Copyright © 2020 Gymbo.co. All rights reserved.
//

import UIKit

@objc protocol WaterfallMutiSectionDelegate: NSObjectProtocol {
    
    func heightForRowAtIndexPath(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, indexPath: IndexPath, itemWidth: CGFloat) -> CGFloat
    
    
    @objc optional func columnNumber(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> Int
    
    
    @objc optional func referenceSizeForHeader(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> CGSize
    
    
    @objc optional func referenceSizeForFooter(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> CGSize
    
    
    @objc optional func insetForSection(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> UIEdgeInsets
    
    
    @objc optional func lineSpacing(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> CGFloat
    
    
    @objc optional func interitemSpacing(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> CGFloat
    
    
    @objc optional func spacingWithLastSection(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> CGFloat
}

class WaterfallMutiSectionFlowLayout: UICollectionViewFlowLayout {
    weak var delegate: WaterfallMutiSectionDelegate?
    
    private var sectionInsets: UIEdgeInsets = .zero
    private var columnCount: Int = 2
    private var lineSpacing: CGFloat = 0
    private var interitemSpacing: CGFloat = 0
    private var headerSize: CGSize = .zero
    private var footerSize: CGSize = .zero
    
    
    private var attrsArray: [UICollectionViewLayoutAttributes] = []
    
    private var columnHeights: [CGFloat] = []
    
    private var contentHeight: CGFloat = 0
    
    private var lastContentHeight: CGFloat = 0
    
    private var spacingWithLastSection: CGFloat = 0
    
    
    override func prepare() {
        super.prepare()
        self.contentHeight = 0
        self.lastContentHeight = 0
        self.spacingWithLastSection = 0
        self.lineSpacing = 0
        self.sectionInsets = .zero
        self.headerSize = .zero
        self.footerSize = .zero
        self.columnHeights.removeAll()
        self.attrsArray.removeAll()
        
        let sectionCount = self.collectionView!.numberOfSections
        
        for idx in 0..<sectionCount {
            let indexPath = IndexPath(item: 0, section: idx)
            if let columnCount = self.delegate?.columnNumber?(collectionView: self.collectionView!, layout: self, section: indexPath.section) {
                self.columnCount = columnCount
            }
            if let inset = self.delegate?.insetForSection?(collectionView: self.collectionView!, layout: self, section: indexPath.section) {
                self.sectionInsets = inset
            }
            if let spacingLastSection = self.delegate?.spacingWithLastSection?(collectionView: self.collectionView!, layout: self, section: indexPath.section) {
                self.spacingWithLastSection = spacingLastSection
            }
            
            let itemCount = self.collectionView!.numberOfItems(inSection: idx)
            let headerAttri = self.layoutAttributesForSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, at: indexPath)
            if let header = headerAttri {
                self.attrsArray.append(header)
                self.columnHeights.removeAll()
            }
            self.lastContentHeight = self.contentHeight
            
            for _ in 0..<self.columnCount {
                self.columnHeights.append(self.contentHeight)
            }
            
            for item in 0..<itemCount {
                let indexPat = IndexPath(item: item, section: idx)
                let attri = self.layoutAttributesForItem(at: indexPat)
                if let attri = attri {
                    self.attrsArray.append(attri)
                }
            }
            
            
            let footerAttri = self.layoutAttributesForSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, at: indexPath)
            if let footer = footerAttri {
                self.attrsArray.append(footer)
            }
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return self.attrsArray
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        if let column = self.delegate?.columnNumber?(collectionView: self.collectionView!, layout: self, section: indexPath.section) {
            self.columnCount = column
        }
        if let lineSpacing = self.delegate?.lineSpacing?(collectionView: self.collectionView!, layout: self, section: indexPath.section) {
            self.lineSpacing = lineSpacing
        }
        if let interitem = self.delegate?.interitemSpacing?(collectionView: self.collectionView!, layout: self, section: indexPath.section) {
            self.interitemSpacing = interitem
        }
        
        let attri = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        let weight = self.collectionView!.frame.size.width
        let itemSpacing = CGFloat(self.columnCount - 1) * self.interitemSpacing
        let allWeight = weight - self.sectionInsets.left - self.sectionInsets.right - itemSpacing
        let cellWeight = allWeight / CGFloat(self.columnCount)
        let cellHeight: CGFloat = (self.delegate?.heightForRowAtIndexPath(collectionView: self.collectionView!, layout: self, indexPath: indexPath, itemWidth: cellWeight))!
        
        var tmpMinColumn = 0
        var minColumnHeight = self.columnHeights[0]
        for i in 0..<self.columnCount {
            let columnH = self.columnHeights[i]
            if minColumnHeight > columnH {
                minColumnHeight = columnH
                tmpMinColumn = i
            }
        }
        let cellX = self.sectionInsets.left + CGFloat(tmpMinColumn) * (cellWeight + self.interitemSpacing)
        var cellY: CGFloat = 0
        cellY = minColumnHeight
        if cellY != self.lastContentHeight {
            cellY += self.lineSpacing
        }
        
        if self.contentHeight < minColumnHeight {
            self.contentHeight = minColumnHeight
        }
        
        attri.frame = CGRect(x: cellX, y: cellY, width: cellWeight, height: cellHeight)
        self.columnHeights[tmpMinColumn] = attri.frame.maxY
        
        for i in 0..<self.columnHeights.count {
            if self.contentHeight < self.columnHeights[i] {
                self.contentHeight = self.columnHeights[i]
            }
        }
        
        return attri
    }
    override func layoutAttributesForSupplementaryView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attri = UICollectionViewLayoutAttributes(forSupplementaryViewOfKind: elementKind, with: indexPath)
        if elementKind == UICollectionView.elementKindSectionHeader {
            if let headerSize = self.delegate?.referenceSizeForHeader?(collectionView: self.collectionView!, layout: self, section: indexPath.section) {
                self.headerSize = headerSize
            }
            self.contentHeight += self.spacingWithLastSection
            attri.frame = CGRect(x: 0, y: self.contentHeight, width: self.headerSize.width, height: self.headerSize.height)
            self.contentHeight += self.headerSize.height
            self.contentHeight += self.sectionInsets.top
        } else if elementKind == UICollectionView.elementKindSectionFooter {
            if let footerSize = self.delegate?.referenceSizeForFooter?(collectionView: self.collectionView!, layout: self, section: indexPath.section) {
                self.footerSize = footerSize
            }
            self.contentHeight += self.sectionInsets.bottom
            attri.frame = CGRect(x: 0, y: self.contentHeight, width: self.footerSize.width, height: self.footerSize.height)
            self.contentHeight += self.footerSize.height
        }
        return attri
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: self.collectionView!.frame.size.width, height: self.contentHeight)
    }
}
