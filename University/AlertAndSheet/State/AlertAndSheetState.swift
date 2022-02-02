//
//  AlertAndSheetState.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation
import VERSE

public struct AlertAndSheetState: Equatable {

    var actionSheet: ActionSheetState<AlertAndSheetAction>?

    var alert: AlertState<AlertAndSheetAction>?

    var count = 0
}
