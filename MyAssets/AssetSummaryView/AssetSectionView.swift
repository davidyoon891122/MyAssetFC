//
//  AssetSectionView.swift
//  MyAssets
//
//  Created by David Yoon on 2021/12/14.
//

import SwiftUI

struct AssetSectionView: View {
    @ObservedObject var assetSection: Asset
    var body: some View {
        VStack(spacing: 20) {
            AssetSectionHeaderView(title: assetSection.type.title)
            ForEach(assetSection.data) { asset in
                HStack {
                    Text(asset.title)
                        .font(.title)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text(asset.amount)
                        .font(.title2)
                        .foregroundColor(.primary)
                }
                Divider()
            }
        }
        .padding()
    }
}

struct AssetSectionView_Previews: PreviewProvider {
    static var previews: some View {
        let asset = Asset(id: 0, type: .bankAccount, data: [
            AssetData(id: 0, title: "신한은행", amount: "5,300,000원"),
            AssetData(id: 1, title: "국민은행", amount: "1,300,000원"),
            AssetData(id: 2, title: "우리은행", amount: "2,300,000원"),
            AssetData(id: 3, title: "하나은행", amount: "3,300,000원"),
        ])
        AssetSectionView(assetSection: asset)
    }
}
