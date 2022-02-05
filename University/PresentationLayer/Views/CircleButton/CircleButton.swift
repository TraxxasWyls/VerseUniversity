//
//  CircleButton.swift
//  University
//
//  Created by Дмитрий Савинов on 05.02.2022.
//

import Foundation

import SwiftUI

struct CircleButtonContentView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("Background"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            CircleButton(image: .init(systemName: "plus"), gradient: [.init(color: .red, location: 0), .init(color: .blue, location: 1)])
        }
    }
}

struct CircleButtonContentView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonContentView()
    }
}

struct CircleButton: View {

    @State var circleTapped = false
    @State var circlePressed = false

    public let image: Image
    public let gradient: [Gradient.Stop]
    public let action: (() -> ())?

    public init(
        image: Image,
        gradient: [Gradient.Stop],
        _ action: (() -> ())? = nil
    ) {
        self.image = image
        self.gradient = gradient
        self.action = action
    }

    var body: some View {
        ZStack {
            image
                .font(.system(size: 40, weight: .light))
                .offset(x: circlePressed ? -90 : 0, y: circlePressed ? -90 : 0)
                .rotation3DEffect(Angle(degrees: circlePressed ? 20 : 0),
                                  axis: (x: 10, y: -10, z: 0))
                .imageScale(Image.Scale.small)
        }
        .frame(width: 55, height: 55)
        .background(
            ZStack {
                Circle()
                    .fill(.ellipticalGradient(stops: gradient))
                    .frame(width: 55, height: 55)//Button Size.
                    .shadow(color: .gray.opacity(0.2), radius: 8, x: -8, y: -8)
                    .shadow(color: .gray.opacity(0.4), radius: 8, x: 8, y: 8)
            }
        )
        .scaleEffect(circleTapped ? 1.03 : 1)
        .onTapGesture {
            self.circleTapped.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.circleTapped = false
            }
            action?()
        }
    }
}
