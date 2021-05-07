//
//  Shapes.swift
//  Twitter
//
//  Created by cole cabral on 2021-05-07.
//

import Foundation
import SwiftUI

// https://quassummanus.github.io/SVG-to-SwiftUI/
// Official Twitter verified SVG converted to SwiftUI shape
struct VerifiedShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.9375*width, y: 0.52083*height))
        path.addCurve(to: CGPoint(x: 0.848*width, y: 0.37083*height), control1: CGPoint(x: 0.9375*width, y: 0.455*height), control2: CGPoint(x: 0.90104*width, y: 0.39792*height))
        path.addCurve(to: CGPoint(x: 0.85792*width, y: 0.3125*height), control1: CGPoint(x: 0.85442*width, y: 0.35271*height), control2: CGPoint(x: 0.85792*width, y: 0.33313*height))
        path.addCurve(to: CGPoint(x: 0.69883*width, y: 0.14592*height), control1: CGPoint(x: 0.85792*width, y: 0.22042*height), control2: CGPoint(x: 0.78667*width, y: 0.14592*height))
        path.addCurve(to: CGPoint(x: 0.64317*width, y: 0.15633*height), control1: CGPoint(x: 0.67925*width, y: 0.14592*height), control2: CGPoint(x: 0.6605*width, y: 0.14942*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.0625*height), control1: CGPoint(x: 0.61742*width, y: 0.10063*height), control2: CGPoint(x: 0.56292*width, y: 0.0625*height))
        path.addCurve(to: CGPoint(x: 0.35679*width, y: 0.15625*height), control1: CGPoint(x: 0.43708*width, y: 0.0625*height), control2: CGPoint(x: 0.38267*width, y: 0.10071*height))
        path.addCurve(to: CGPoint(x: 0.30113*width, y: 0.14583*height), control1: CGPoint(x: 0.3395*width, y: 0.14938*height), control2: CGPoint(x: 0.32071*width, y: 0.14583*height))
        path.addCurve(to: CGPoint(x: 0.14204*width, y: 0.3125*height), control1: CGPoint(x: 0.21321*width, y: 0.14583*height), control2: CGPoint(x: 0.14204*width, y: 0.22042*height))
        path.addCurve(to: CGPoint(x: 0.15192*width, y: 0.37083*height), control1: CGPoint(x: 0.14204*width, y: 0.33308*height), control2: CGPoint(x: 0.1455*width, y: 0.35267*height))
        path.addCurve(to: CGPoint(x: 0.06246*width, y: 0.52083*height), control1: CGPoint(x: 0.09892*width, y: 0.39792*height), control2: CGPoint(x: 0.06246*width, y: 0.45492*height))
        path.addCurve(to: CGPoint(x: 0.14338*width, y: 0.66608*height), control1: CGPoint(x: 0.06246*width, y: 0.58313*height), control2: CGPoint(x: 0.09504*width, y: 0.63742*height))
        path.addCurve(to: CGPoint(x: 0.14204*width, y: 0.6875*height), control1: CGPoint(x: 0.14254*width, y: 0.67317*height), control2: CGPoint(x: 0.14204*width, y: 0.68025*height))
        path.addCurve(to: CGPoint(x: 0.30113*width, y: 0.85417*height), control1: CGPoint(x: 0.14204*width, y: 0.77958*height), control2: CGPoint(x: 0.21321*width, y: 0.85417*height))
        path.addCurve(to: CGPoint(x: 0.35675*width, y: 0.84375*height), control1: CGPoint(x: 0.32071*width, y: 0.85417*height), control2: CGPoint(x: 0.33946*width, y: 0.85058*height))
        path.addCurve(to: CGPoint(x: 0.49996*width, y: 0.9375*height), control1: CGPoint(x: 0.38258*width, y: 0.89933*height), control2: CGPoint(x: 0.437*width, y: 0.9375*height))
        path.addCurve(to: CGPoint(x: 0.64317*width, y: 0.84375*height), control1: CGPoint(x: 0.56296*width, y: 0.9375*height), control2: CGPoint(x: 0.61738*width, y: 0.89933*height))
        path.addCurve(to: CGPoint(x: 0.69883*width, y: 0.85408*height), control1: CGPoint(x: 0.66046*width, y: 0.85054*height), control2: CGPoint(x: 0.67921*width, y: 0.85408*height))
        path.addCurve(to: CGPoint(x: 0.85792*width, y: 0.68742*height), control1: CGPoint(x: 0.78675*width, y: 0.85408*height), control2: CGPoint(x: 0.85792*width, y: 0.7795*height))
        path.addCurve(to: CGPoint(x: 0.85654*width, y: 0.66604*height), control1: CGPoint(x: 0.85792*width, y: 0.68017*height), control2: CGPoint(x: 0.85742*width, y: 0.67308*height))
        path.addCurve(to: CGPoint(x: 0.9375*width, y: 0.52088*height), control1: CGPoint(x: 0.90479*width, y: 0.63742*height), control2: CGPoint(x: 0.9375*width, y: 0.58313*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.66183*width, y: 0.38192*height))
        path.addLine(to: CGPoint(x: 0.48125*width, y: 0.65275*height))
        path.addCurve(to: CGPoint(x: 0.45521*width, y: 0.66667*height), control1: CGPoint(x: 0.47521*width, y: 0.66179*height), control2: CGPoint(x: 0.46533*width, y: 0.66667*height))
        path.addCurve(to: CGPoint(x: 0.43788*width, y: 0.66142*height), control1: CGPoint(x: 0.44925*width, y: 0.66667*height), control2: CGPoint(x: 0.44321*width, y: 0.665*height))
        path.addLine(to: CGPoint(x: 0.43308*width, y: 0.6575*height))
        path.addLine(to: CGPoint(x: 0.33246*width, y: 0.55688*height))
        path.addCurve(to: CGPoint(x: 0.33246*width, y: 0.51271*height), control1: CGPoint(x: 0.32025*width, y: 0.54467*height), control2: CGPoint(x: 0.32025*width, y: 0.52488*height))
        path.addCurve(to: CGPoint(x: 0.37662*width, y: 0.51271*height), control1: CGPoint(x: 0.34467*width, y: 0.50054*height), control2: CGPoint(x: 0.36446*width, y: 0.50046*height))
        path.addLine(to: CGPoint(x: 0.45037*width, y: 0.58633*height))
        path.addLine(to: CGPoint(x: 0.60975*width, y: 0.34717*height))
        path.addCurve(to: CGPoint(x: 0.65308*width, y: 0.33854*height), control1: CGPoint(x: 0.61933*width, y: 0.33279*height), control2: CGPoint(x: 0.63875*width, y: 0.329*height))
        path.addCurve(to: CGPoint(x: 0.66183*width, y: 0.38187*height), control1: CGPoint(x: 0.6675*width, y: 0.34813*height), control2: CGPoint(x: 0.67142*width, y: 0.36754*height))
        path.closeSubpath()
        return path
    }
}
