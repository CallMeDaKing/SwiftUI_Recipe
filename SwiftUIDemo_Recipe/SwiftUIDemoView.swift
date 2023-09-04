//
//  SwiftUIDemoView.swift
//  RecipesSample
//
//  Created by DaKing on 2023/8/3.
//

import SwiftUI
import AVKit
import SpriteKit

// 只能在 iOS 中运行 Mac 编译会报错
struct SwiftUIDemoView: View {
    @State private var completionAmount: CGFloat = 0.0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var amount: CGFloat = 20
    static let dateFromater: DateFormatter = {
        let dataformater = DateFormatter()
        dataformater.dateStyle = .long
        return dataformater
    }()
    
    var body: some View {
        ScrollView {
            Spacer()
            VStack {
                let dudate = Date()
                Text("Hello this is Text date: \(dudate, formatter: Self.dateFromater)").padding()
                
                Text("Change space between characters")
                    .multilineTextAlignment(.center)
                    .font(.headline)
                    .kerning(amount)
                    .padding(.horizontal)
                    .textCase(.lowercase)
                    .padding()
                
                Text("Change space between characters")
                    .multilineTextAlignment(.trailing)
                    .font(.headline)
                    .tracking(amount)
                    .textCase(.lowercase)
                    .padding(.horizontal)
                
                Slider(value: $amount, in: 0...100) {
                    Text("Adjust the amount of spacing")
                }
                
                // Date
                Text(Date().addingTimeInterval(600), style: .time)
                Text(Date().addingTimeInterval(600), style: .date)
                Text(Date().addingTimeInterval(600), style: .relative)
                Text(Date().addingTimeInterval(600), style: .timer)
        
                HStack {
                    Label("Your account", systemImage: "person.crop.circle")
                        .labelStyle(.titleOnly)
                    Label("My Account", systemImage: "person.crop.circle")
                        .font(.title)
                        .labelStyle(.titleAndIcon)
                        .background(Color.gray)
                        .clipShape(Capsule())
                        .multilineTextAlignment(.center)
                }.padding()
                
                VStack {
                  Text("This is regular text.")
                  Text("* This is **bold** text, this is *italic* text, and this is ***bold, italic*** text.")
                  Text("~~A strikethrough example~~")
                  Text("`Monospaced works too`")
                  Text("Visit Apple: [click here](https://apple.com)")
                        .textSelection(.enabled)
                    
                    Image("MushroomTapioca-thumb")
//                        .resizable(resizingMode: .tile)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400, height: 200)
                    
                    Image("PeanutButterTruffles")
                        .resizable(capInsets: EdgeInsets(top: 20, leading: 20, bottom:20, trailing: 20), resizingMode: .tile)
                    
                    Image(systemName: "cloud.heavyrain.fill")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                        .background(Color.gray)
                        .clipShape(Circle())
                    
 // Mark: 三种渐变色方式 线性渐变  半径渐变  角度渐变  。。由于所有三种渐变类型均符合 ShapeStyle 协议，因此可以将它们用于背景，填充和笔触。 例如，这使用我们的彩虹圆锥形渐变作为圆的粗内部笔画：
                    Text("this is placHolder")
                        .font(.title)
                        .redacted(reason: .placeholder)
                        .background( // 背景
                            LinearGradient(gradient: Gradient(colors: [.red, .white,.cyan]), startPoint: .top, endPoint: .bottom)
                        )
//                    Text("thsi is privacy content")
//                        .privacySensitive()
                    Circle()
                        .fill(
                            RadialGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple]), center: .center, startRadius: 50, endRadius: 200)
                        )
                        .frame(width: 200, height: 200)
                } .multilineTextAlignment(.center)
                
            }
            // swiftUI 限制单个组件内不能超过10子组件， 否则会报错 "Extra argument in call"
            VStack {
                Circle()
                    .strokeBorder(   // 笔触
                        AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center, startAngle: .zero, endAngle: .degrees(360)),
                        lineWidth: 5
                    )
                    .frame(width: 200, height: 200)
                
                Circle()
                    .fill(           // 填充
                        AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
                        )
                    .frame(width: 200, height: 200)
                
                Text("Hacking with swift")
                    .font(.system(size: 48))
                    .foregroundColor(.white)
                    .padding(50)
                    .background(
                        Image("MushroomTapioca-thumb")
                            .resizable()
//                        Circle()
//                            .fill(Color.red)
                    )
                Rectangle()
                    .fill(Color.cyan)
                    .frame(width: 300, height: 200)
                // 圆角矩形
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(Color.red)
                    .frame(width: 300, height: 200)
                // 胶囊
                Capsule()
                    .fill(Color.green)
                    .frame(width: 300, height: 200)
                
                Capsule()
                    .strokeBorder(Color.black, lineWidth: 5)
                    .background(
                        Circle().fill(Color.red)
                    )
                    .frame(width: 300, height: 300)
                    
                Circle()
                    .trim(from: 0 ,to: completionAmount)
                    .stroke(Color.red, lineWidth: 10)
                    .frame(width: 200,  height: 200)
                    .rotationEffect(.degrees(-90))
                    .onReceive(timer) { _ in
                        withAnimation {
                            if (completionAmount == 1) {
                                completionAmount = 0;
                            } else {
                                completionAmount += 0.1;
                            }
                        }
                    }
                    .padding()
            }
            
            VStack {
                VideoPlayer(player: AVPlayer(url: URL(string: "https://media.w3.org/2010/05/sintel/trailer.mp4")!)) {
                    Text("Watermark").foregroundColor(.black).background(Color.white.opacity(0.7))
                    Spacer()
                }
                .frame(width: 400, height: 300)
                
                if #available(iOS 15.0, *) {
//                    "https://avatars.githubusercontent.com/u/1680273?v=4"
                    AsyncImage(url: URL(string: "https://avatars.githubusercontent.com/u/1680273?v=4")) { image in
                      image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .padding()
                    } placeholder: {
                        Color.red
                    }
                    .frame(width: 128, height: 128)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                }
                
                //palette 模式 可以根据图层 设置不同颜色
                Image(systemName: "shareplay")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.blue, .red)
                    .font(.system(size: 144))
                // 设置渐变
                Image(systemName: "person.3.sequence.fill")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(
                        .linearGradient(colors: [.red, .cyan], startPoint: .top, endPoint: .bottomTrailing),
                        .linearGradient(colors: [.cyan, .green], startPoint: .top, endPoint: .bottomTrailing)
                    )
                    .font(.system(size: 144))
                    .padding(50)

                Button {
                    print("Button Tapped")
                } label: {
                    Text("Welcome")
                        .frame(minWidth: 0, maxWidth: 200, minHeight: 0, maxHeight: 200)
                        .font(.largeTitle)
                        .background(Color.cyan)
                }
                
                Text("Hello world")
                    .background(Color.red)
                    .ignoresSafeArea()
                
                TossResult().frame(width: 400, height: 100)
                
                //GeometryReader 可以实现具体值约束的设定， 根据屏幕比例，因为swiftUI是无法获取屏幕值的自动布局
                GeometryReader { geometry in
                    HStack(spacing: 0) {
                        Text("Left")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            .frame(width: geometry.size.width * 0.5)
                            .background(Color.yellow)
                        
                        Text("Right")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            .frame(width: geometry.size.width * 0.5)
                            .background(Color.red)

                    }
                }
            }
        }
    }
}

struct SwiftUIDemoView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIDemoView()
    }
}

struct TossResult: View {
    var body: some View {
        if Bool.random() {
            Image("shareplay")
                .resizable()
                .scaledToFit()
        } else {
            Text("Better luck next time")
                .font(.title)
        }
    }
}
