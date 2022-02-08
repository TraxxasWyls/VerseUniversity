//
//  NavigationModuleAction.swift
//  University
//
//  Created by Дмитрий Савинов on 31.01.2022.
//

import Foundation

// MARK: - NavigationModuleAction

public enum NavigationModuleAction: Equatable {
    case counter(CounterAction)
    case analyzableCounter(AnalyzableCounterAction)
    case fibonacciCounter(FibonacciCounterAction)
    case megaCounter(MegaCounterAction)
    case alertAndActionSheet(AlertAndSheetAction)
    case simpleBinding(SimpleBindingAction)
    case flexibleBinding(FlexibleBindingAction)
    case justEffect(JustEffectAction)
    case scrambler(ScramblerAction)
    case animatedTimers(AnimatedTimersAction)
    case betterAnimatedTimers(BetterAnimatedTimersAction)
    case listInstantTransition(ListInstantTransitionAction)
}
