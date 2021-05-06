//
//  CustomProgressBar.swift
//  HSData_Coding_Assessment
//
//  Created by Gregory Keeley on 5/6/21.
//

import UIKit

class CustomProgressBar: UIView {
    //MARK:- Variables
    private var backgroundLayer: CAShapeLayer!
    private var foregroundLayer: CAShapeLayer!
    private var textLayer: CATextLayer!
    private var gradientLayer: CAGradientLayer!
    public var progress: CGFloat = 0 {
        didSet {
            didUpdateProgress()
        }
    }
    
    override func draw(_ rect: CGRect) {
        let width = rect.width
        let height = rect.height
        let lineWidth = 0.10 * min(width, height)
        backgroundLayer = createCircularLayer(strokeColor: UIColor.lightGray.cgColor, fillColor: UIColor.clear.cgColor, lineWidth: lineWidth)
        foregroundLayer = createCircularLayer(strokeColor: AppColors.primaryLiteBlue.cgColor, fillColor: UIColor.clear.cgColor, lineWidth: lineWidth)
        foregroundLayer.strokeEnd = progress
        gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.colors = [AppColors.primaryDarkBlue.cgColor, AppColors.primaryDarkBlue.cgColor]
        gradientLayer.frame = rect
        gradientLayer.mask = foregroundLayer
        layer.addSublayer(backgroundLayer)
        layer.addSublayer(gradientLayer)
    }
    private func createCircularLayer(strokeColor: CGColor, fillColor: CGColor, lineWidth: CGFloat) -> CAShapeLayer {
        let startAngle = CGFloat.pi
        let endAngle = CGFloat.pi + startAngle
        let width = frame.size.width
        let height = frame.size.height
        let center = CGPoint(x: width / 2, y: height / 2)
        let radius = (min(width, height) - lineWidth) / 2
        let circularPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = strokeColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.fillColor = fillColor
        shapeLayer.lineCap = .round
        return shapeLayer
    }
//    private func createTextLayer(textColor: UIColor) -> CATextLayer {
//        let width = frame.size.width
//        let height = frame.size.height
//        let fontSize = min(width, height) / 4 - 5
//        let offset = min(width, height) * 0.1
//        let layer = CATextLayer()
//        layer.string = "\(Int(progress * 100))"
//        layer.backgroundColor = AppColors.complimentaryBackgroundColor.cgColor // UIColor.clear.cgColor
//        layer.foregroundColor = textColor.cgColor
//        layer.fontSize = fontSize
//        layer.frame = CGRect(x: 0, y: (height - fontSize - offset) / 2, width: width, height: height)
//        layer.alignmentMode = .center
//        return layer
//    }
    private func didUpdateProgress() {
        textLayer?.string = "\(Int(progress * 100))" // ??
        foregroundLayer?.strokeEnd = progress
    }
}
