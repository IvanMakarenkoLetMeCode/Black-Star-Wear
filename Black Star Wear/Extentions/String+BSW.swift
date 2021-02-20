//
//  String+BSW.swift
//  Black Star Wear
//
//  Created by Ivan on 09.02.2021.
//

import UIKit

extension String {
    
    func localized(comment: String = "") -> String {
        
        return NSLocalizedString(self, comment: comment)
    }
    
    func priceFormate() -> String {
        
        var formatedPrice = self
        let priceNumber = NumberFormatter().number(from: formatedPrice)
        let formater = NumberFormatter()
        formater.numberStyle = .currency
        formater.locale = Locale(identifier: "ru_RU")
        formatedPrice = formater.string(from: priceNumber ?? 0) ?? ""
        return formatedPrice
        
    }
    
    func convertHTMLStringToAttributed(fontName: String? = nil,
                                       fontSize: CGFloat? = nil) -> NSMutableAttributedString? {
        var htmlString = self
        if let fontName = fontName, let fontSize = fontSize {
            htmlString = String(
                format: "<span style=\"font-family: '\(fontName)'; font-size: \(fontSize)\">%@</span>",
                self
            )
        }
        let options = [
            NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html,
            NSAttributedString.DocumentReadingOptionKey.characterEncoding: String.Encoding.utf8.rawValue
            ] as [NSAttributedString.DocumentReadingOptionKey: Any]
        if let htmlData = htmlString.data(using: .unicode, allowLossyConversion: true) {
            let attributedString = try? NSMutableAttributedString(data: htmlData,
                                                                  options: options,
                                                                  documentAttributes: nil)
            return attributedString
        }
        return nil
    }
    
}
