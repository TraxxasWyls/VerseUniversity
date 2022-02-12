//
//  CenteringViewer.swift
//  University
//
//  Created by Дмитрий Савинов on 12.02.2022.
//

import SwiftUI

struct CenteringViewer: View {

    @State private var currentScale: CGFloat = 1.0
    @GestureState private var scale: CGFloat = 1.0

    @State private var currentRotation: Double = 0
    @State private var finalRotation: Double = 0

    @State private var currentTranslation: CGSize = .zero
    @State private var newTranslation: CGSize = .zero
    //    private var position: CGRect = .zero

    var body: some View {
        let magnificationGesture = MagnificationGesture()
            .updating($scale, body: { (value, state, _) in
                state = value
            })
            .onEnded{ currentScale *= $0 }
        let rotationGesture = RotationGesture()
            .onChanged { (value) in
                currentRotation = value.degrees
            }
            .onEnded { val in
                currentRotation = .zero
                finalRotation = val.degrees + finalRotation
            }

        let dragGesture = DragGesture()
            .onChanged { value in
                currentTranslation = value.translation
            }
            .onEnded { value in
                currentTranslation = .zero
                newTranslation = CGSize(
                    width: value.translation.width + newTranslation.width,
                    height: value.translation.height + newTranslation.height
                )
            }

        let magnificationRotateDragGesture = dragGesture
            .simultaneously(with: magnificationGesture)
            .simultaneously(with: rotationGesture)

        let sim = SimultaneousGesture(dragGesture, rotationGesture)
        let supsim = SimultaneousGesture(sim, magnificationGesture)

        GeometryReader { geometry in
            Image(systemName: "star.circle.fill")
                .font(.system(size: 200))
                .foregroundColor(Color.red)
                .rotationEffect(Angle(degrees: finalRotation + currentRotation))
                .scaleEffect(currentScale * scale)
                .offset(
                    x: currentTranslation.width + newTranslation.width,
                    y: currentTranslation.height + newTranslation.height
                )
                .gesture(supsim)
                .onTapGesture {
                    let pos = geometry.frame(in: .global)
                    print("originX : \(pos.origin.x + currentTranslation.width + newTranslation.width) originY: \(pos.origin.y + currentTranslation.height + newTranslation.height)")
                    print("width : \(pos.width * currentScale * scale) height: \(pos.height * currentScale * scale)")
                    print("Angle : \(finalRotation + currentRotation)")
                }
        }
    }
}

    struct CenteringViewer_Previews: PreviewProvider {
        static var previews: some View {
            CenteringViewer()
        }
    }
