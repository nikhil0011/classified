//
//  Color.swift
//  classified
//
//  Created by Nikhil Nangia on 26/11/21.
//
import UIKit

public protocol Color {
    var primary : UIColor {get}
    var primary10 : UIColor {get}
    var secondary : UIColor {get}
    var surface : UIColor {get}
    var info : UIColor {get}
    var positive : UIColor {get}
    var negative : UIColor {get}
    var warning : UIColor {get}
}
