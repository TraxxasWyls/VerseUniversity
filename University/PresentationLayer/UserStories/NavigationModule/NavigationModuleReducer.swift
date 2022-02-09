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
    scramblerReducer.pullback(
        state: \.scrambler,
        action: /NavigationModuleAction.scrambler,
        environment: ScramblerEnvironment()
    ),
    animatedTimersReducer.pullback(
        state: \.animatedTimers,
        action: /NavigationModuleAction.animatedTimers,
        environment: AnimatedTimersEnvironment()
    ),
    betterAnimatedTimersReducer.pullback(
        state: \.betterAnimatedTimers,
        action: /NavigationModuleAction.betterAnimatedTimers,
        environment: BetterAnimatedTimersEnvironment()
    ),
    listInstantTransitionReducer.pullback(
        state: \.listInstantTransition,
        action: /NavigationModuleAction.listInstantTransition,
        environment: ListInstantTransitionEnvironment()
    ),
    listDeferedTransitionReducer.pullback(
        state: \.listDeferedTransition,
        action: /NavigationModuleAction.listDeferedTransition,
        environment: ListDeferedTransitionEnvironment()
    ),
    recursiveTreeReducer.pullback(
        state: \.recursiveTree,
        action: /NavigationModuleAction.recursiveTree,
        environment: RecursiveTreeEnvironment()
    ),
    downloadingReducer.pullback(
        state: \.downloading,
        action: /NavigationModuleAction.downloading,
        environment: DownloadingEnvironment()
    ),
    .init { _, _, _ in
        return .none
    }
)
