//
//  ObservableObject.swift
//  BoubyanTechAssesment
//
//  Created by elsaid yousif on 01/02/2022.
//

import Foundation
//declare generic observable object 
final class ObservableObject<T> {
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    private var listener: ((T) -> Void)?
    
    init(_ value: T)  {
        self.value = value
    }
    
    func bind(_ listener: @escaping(T) -> Void) {
        listener(value)
        self.listener = listener
    }
}
