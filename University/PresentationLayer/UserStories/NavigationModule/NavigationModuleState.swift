//
//  NavigationModuleState.swift
//  University
//
//  Created by Дмитрий Савинов on 31.01.2022.
//

import Foundation

// MARK: - NavigationModuleState

public struct NavigationModuleState: Equatable {
    public var counter: CounterState = CounterState()
    public var analyzableCounter: AnalyzableCounterState = AnalyzableCounterState()
    public var fibonacciCounter: FibonacciCounterState = FibonacciCounterState()
    public var megaCounter: MegaCounterState = MegaCounterState()
    public var alertAndActionSheet: AlertAndSheetState = AlertAndSheetState()
    public var simpleBinding: SimpleBindingState = SimpleBindingState()
    public var flexibleBinding: FlexibleBindingState = FlexibleBindingState()
    public var justEffect: JustEffectState = JustEffectState()
    public var scrambler: ScramblerState = ScramblerState()
    public var animatedTimers: AnimatedTimersState = AnimatedTimersState()
    public var betterAnimatedTimers: BetterAnimatedTimersState = BetterAnimatedTimersState()
    public var listInstantTransition: ListInstantTransitionState = ListInstantTransitionState()
}
