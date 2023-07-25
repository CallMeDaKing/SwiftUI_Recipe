//
//  File.swift
//  SwiftUIDemo_Recipe
//
//  Created by DaKing on 2023/7/21.
//

import SwiftUI

func load <T: Decodable> (_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file) 
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}


final class ImageStore {
    typealias _imageDictionary = [String : Image]
    fileprivate var images: _imageDictionary = [:]
    fileprivate  static var scale = 2
    static var shared = ImageStore()
    
    func image(name: String) -> Image {
        let index = _guaranteeImage(name: name)
        return images.values[index]
    }
    
    func add(_ image: Image, with name: String) {
        images[name] = image
    }
    
    static func loadImage(name: String) -> Image {
        guard
            let url = Bundle.main.url(forResource: name, withExtension: "jpg"),
            let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
            let cgImage = CGImageSourceCreateImageAtIndex(imageSource, 0, nil) else {
            return Image("placeholder")
        }
        return Image(cgImage, scale: CGFloat(ImageStore.scale), label: Text(""))
    }
    
    fileprivate func _guaranteeImage(name: String) -> _imageDictionary.Index {
        if let index = images.index(forKey: name) { return index }
        
        images[name] = ImageStore.loadImage(name: name)
        return images.index(forKey: name)!
    }
}
