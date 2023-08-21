//
//  WeichangScreen.swift
//  GetInSwiftUI
//
//  Created by bill on 2023/8/2.
//

import SwiftUI

struct WeichangScreen: View {
    var body: some View {
        List(Range(1...2)) { _index in
            WeiChangCellView().background {
                NavigationLink(destination: DynamicDetailScreen().hiddenTabBar) {
                    Text("")
                }
            }
        }.listStyle(.plain)
            //.navigationTitle("围场").navigationBarTitleDisplayMode(.inline)
            .showTabBar
        
    }
}

struct FoodDetailSheetHeightKey: PreferenceKey {
    static var defaultValue: CGFloat = 100
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct WeiChangCellView: View {
    
    @State var imgH = 100.0
    var body: some View {
        HStack(alignment: .top) {
            Image.myDefault.resizable().aspectRatio(contentMode: .fit).frame(width: 40, height: 40).clipShape(Circle())
            
                VStack(alignment: .leading, spacing: 8) {
                    Text("宜人勿近").setFontAndColor(size: 14, weight: .medium, txtColor: Color.fromHexString(hexString: "#323232"))
                    Text("1小时前发布 · 广州长隆欢乐谷 · 15.9km").setFontAndColor(size: 12, txtColor: .Color999999)
                                    
                    ExpandableText(text: "美景美人观不够，应似漫游画壁。豪富难长，浮名无用，煦日融冰雪。百花凋落，明年犹争发。美景美人观不够，应似漫游画壁。豪富难长，浮名无用，煦日融冰雪。百花凋落，明年犹争发。美景美人观不够，应似漫游画壁。豪富难长，浮名无用，煦日融冰雪。百花凋落，明年犹争发。美景美人观不够，应似漫游画壁。豪富难长，浮名无用，煦日融冰雪。百花凋落，明年犹争发。美景美人观不够，应似漫游画壁。豪富难长，浮名无用，煦日融冰雪。百花凋落，明年犹争发。美景美人观不够，应似漫游画壁。豪富难长，浮名无用，煦日融冰雪。百花凋落，明年犹争发。").lineLimit(3).expandButton(TextSet(text: "展开", font: .system(size: 12), color: .Color999999!))
                        .collapseButton(TextSet(text: "收起", font: .system(size: 12), color: .Color999999!))
                    
//                    ExpandableText(text:"美景美人观不够，应似漫游画壁。豪富难长，浮名无用，煦日融冰雪。百花凋落，明年犹争发。美景美人观不够，应似漫游画壁。豪富难长，浮名无用，煦日融冰雪。百花凋落，明年犹争发。美景美人观不够，应似漫游画壁。豪富难长，浮名无用，煦日融冰雪。百花凋落，明年犹争发。美景美人观不够，应似漫游画壁。豪富难长，浮名无用，煦日融冰雪。百花凋落，明年犹争发。美景美人观不够，应似漫游画壁。豪富难长，浮名无用，煦日融冰雪。百花凋落，明年犹争发。美景美人观不够，应似漫游画壁。豪富难长，浮名无用，煦日融冰雪。百花凋落，明年犹争发。")
                    
                    WeichangImgListView(firstImgW: imgH).frame(minHeight: imgH)
                        .background(RoundedRectangle(cornerRadius: 10.0))
                }.readGeometry(\.size.width, key: FoodDetailSheetHeightKey.self)
                .onPreferenceChange(FoodDetailSheetHeightKey.self) { h in
                    imgH = (h - 2.0) * 0.333 * 2.0
                }
            
        }
    }
    
}

struct WeichangImgListView: View {
    private var firstImg: Image = .myDefault
    private var secondImg: Image = .myDefault
    private var threeImg: Image = .myDefault
    
    private let firstImgW: Double
    
    init(firstImgW: Double) {
        self.firstImgW = firstImgW
    }
    
    var body: some View {
        let maxImgW = firstImgW
        let minImgW = (maxImgW - 2.0) * 0.5
        ZStack(alignment: .topLeading) {
            firstImg.resizable().aspectRatio(contentMode: .fill).frame(width: maxImgW, height: maxImgW)
            secondImg.resizable().aspectRatio(contentMode: .fit).frame(width: minImgW, height: minImgW).offset(x: maxImgW + 2.0, y: 0)
            threeImg.resizable().aspectRatio(contentMode: .fit).frame(width: minImgW, height: minImgW).offset(x: maxImgW + 2.0, y: minImgW + 2.0)
        }
    }
}

struct WeichangScreen_Previews: PreviewProvider {
    static var previews: some View {
        WeichangScreen()
    }
}
