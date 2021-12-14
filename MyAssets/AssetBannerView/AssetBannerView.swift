//
//  AssetBannerView.swift
//  MyAssets
//
//  Created by David Yoon on 2021/12/14.
//

import SwiftUI

struct AssetBannerView: View {
    let bannerList: [AssetBanner] = [
        AssetBanner(title: "공지사항", description: "추가된 공지사항을 확인하세요.", backgroundColor: .systemRed),
        AssetBanner(title: "주말 이벤트", description: "주말 이벤트 놓치지 마세요", backgroundColor: .yellow),
        AssetBanner(title: "깜짝 이벤트", description: "깜짝 이벤트를 확인해 보세요!!", backgroundColor: .blue),
        AssetBanner(title: "금강원 공지사항", description: "소비자 금융법에 관련된 금강원 공지사항을 확인하세요", backgroundColor: .brown),
    ]
    @State private var currentPage = 0
    
    var body: some View {
        let bannerCards = bannerList.map {
            BannerCard(banner: $0)
        }
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: bannerCards, currentPage: $currentPage)
            PageControl(numberOfPages: bannerList.count, currentPage: $currentPage)
                .frame(width: CGFloat(bannerCards.count * 18))
                .padding(.trailing)
        }
        
    }
}

struct AssetBannerView_Previews: PreviewProvider {
    static var previews: some View {
        AssetBannerView()
            .aspectRatio(5/2, contentMode: .fit)
    }
}
