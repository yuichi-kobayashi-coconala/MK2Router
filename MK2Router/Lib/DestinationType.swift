//
//  DestinationType.swift
//  MK2Router
//
//  Created by k2o on 2016/05/12.
//  Copyright © 2016年 Yuichi Kobayashi. All rights reserved.
//

import UIKit

/// Routerをサポートする遷移先.
protocol DestinationType: class
{
    associatedtype Context
    var context: Context! { get }
}

extension DestinationType where Self: UIViewController {
    var context: Context! {
        return Router.shared.context(for: self)
    }
}
