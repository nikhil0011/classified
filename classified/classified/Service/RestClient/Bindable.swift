//
//  Bindable.swift
//  classified
//
//  Created by Nikhil Nangia on 27/11/21.
//

import Foundation

class Bindable<T> {
    var value: T? {
        didSet {
            observer?(value)
        }
    }

    var observer: ((T?) -> Void)?

    func bind(observer: @escaping (T?) -> Void) {
        self.observer = observer
    }
}

class DualBindable<T, V> {
    var value: T? {
        didSet {
            observer?(value, anotherValue)
        }
    }
    var anotherValue: V? {
        didSet {
            observer?(value, anotherValue)
        }
    }
    var observer: ((T?, V?) -> Void)?
    func bind(observer: @escaping (T?, V?) -> Void) {
        self.observer = observer
    }
}
