//
//  NavigationModuleReducer.swift
//  University
//
//  Created by Дмитрий Савинов on 31.01.2022.
//

import Foundation
import VERSE

// MARK: - Aliases

public typealias NavigationModuleReducer = Reducer<NavigationModuleState, NavigationModuleAction, NavigationModuleEnvironment>

// MARK: - CounterReducer

public let navigationModuleReducer = NavigationModuleReducer.combine(
    counterReducer.pullback(
        state: \.counter,
        action: /NavigationModuleAction.counter,
        environment: CounterEnvironment()
    ),
    fibonacciCounterReducer.pullback(
            state: \.fibonacciCounter,
            action: /NavigationModuleAction.fibonacciCounter,
            environment: FibonacciCounterEnvironment()
        ),
    analyzableCounterReducer.pullback(
            state: \.analyzableCounter,
            action: /NavigationModuleAction.analyzableCounter,
            environment: AnalyzableCounterEnvironment()
        ),
    megaCounterReducer.pullback(
            state: \.megaCounter,
            action: /NavigationModuleAction.megaCounter,
            environment: MegaCounterEnvironment()
        ),
    alertSheetReducer.pullback(
        state: \.alertAndActionSheet,
        action: /NavigationModuleAction.alertAndActionSheet,
        environment: AlertAndSheetEnvironment()
    ),
    simpleBindingReducer.pullback(
        state: \.simpleBinding,
        action: /NavigationModuleAction.simpleBinding,
        environment: SimpleBindingEnvironment()
    ),
    flexibleBindingReducer.pullback(
        state: \.flexibleBinding,
        action: /NavigationModuleAction.flexibleBinding,
        environment: FlexibleBindingEnvironment()
    ),
    justEffectReducer.pullback(
        state: \.justEffect,
        action: /NavigationModuleAction.justEffect,
        environment: JustEffectEnvironment()
    ),
    .init { _, _, _ in
        return .none
    }
)
