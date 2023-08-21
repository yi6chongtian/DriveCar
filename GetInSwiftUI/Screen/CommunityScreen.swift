//
//  CommunityScreen.swift
//  GetInSwiftUI
//
//  Created by bill on 2023/8/2.
//

import SwiftUI

struct CommunityScreen: View {
    private let titles = ["围场", "地图", "车友圈", "汽车服务"]
    @State var selectIndex = 0
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<titles.count) { index in
                        let title = titles[index]
                        let isSelect = index == selectIndex
                        Text(title).font(.system(size: isSelect ? 22 : 16, weight: isSelect ? .bold : .regular)).foregroundColor(.Color222222)
                            .onTapGesture {
                            selectIndex = index
                        }
                    }
                }.padding()
            }
            switch selectIndex {
            case 0:
                WeichangScreen().frame(maxHeight: .infinity)
            case 1:
                MapScreen().frame(maxHeight: .infinity)
            case 2:
                CarCircleScreen().frame(maxHeight: .infinity)
            case 3:
                CarServiceScreen().frame(maxHeight: .infinity)
            default:
                EmptyView()
            }
        }
    }
}

struct CommunityScreen_Previews: PreviewProvider {
    static var previews: some View {
        CommunityScreen()
    }
}
