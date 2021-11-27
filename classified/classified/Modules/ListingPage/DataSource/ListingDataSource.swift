//
//  ListingDataSource.swift
//  classified
//
//  Created by Nikhil Nangia on 26/11/21.
//

import UIKit
class ListingDataSource: CollectionArrayDataSource<ItemListingViewModel, ListingProductsCollectionViewCell> {
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        guard let item = provider.item(at: indexPath) else {
            return UICollectionViewCell()
        }
        switch item.section {
        case .products:
            let cell: ListingProductsCollectionViewCell = collectionView.dequeue(for: indexPath)
            let respresentedId = item.product?.uid
            cell.respresntedIndentifier = respresentedId ?? ""
            cell.configure(item, at: indexPath)
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let item = provider.item(at: indexPath) else { return collectionView.defaultReusableview(indexPath) }
            switch item.section {
            case .products:
                guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: TitleOnlyHeader.reuseIdentifier, for: indexPath) as? TitleOnlyHeader else {
                    return collectionView.defaultReusableview(indexPath)
                }
                headerView.configure()
                return headerView
            default:
                return collectionView.defaultReusableview(indexPath)
            }
        default:
            fatalError("Could not find supplementary view of \(kind)!")
        }
    }
}

extension ListingDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let item = provider.item(at: indexPath) else { return CGSize.zero }
        let width = collectionView.frame.width - (item.sectionInset.left + item.sectionInset.right)
        return .init(width: width, height: item.itemHeight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        guard let item = provider.item(at: IndexPath(item: 0, section: section)) else { return .zero }
        return .init(width: collectionView.frame.width, height: item.sectionHeaderHeigt)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        guard let item = provider.item(at: IndexPath(item: 0, section: section)) else { return .zero }
        return item.interItemSpacing
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        guard let item = provider.item(at: IndexPath(item: 0, section: section)) else { return .zero }
        return item.sectionInset
    }
}

