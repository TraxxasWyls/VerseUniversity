//
//  TimerCounterReducer.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation
import VERSE

typealias TimerCounterReducer = Reducer<TimerCounterState, TimerCounterAction, TimerCounterEnvironment>

let timerCounterReducer = TimerCounterReducer.init{ state, action, environment in

    func cancelAndGetScrumble() -> Effect<TimerCounterAction, Never> {
        .concatenate(
            .cancel(id: ScrumbleCancellationId()),
            .init(value: .generateButtonTapped)
        )
    }

    struct ScrumbleCancellationId: Hashable {
    }

    switch action {
    case .minusButtonTapped:
        state.scrumbleLenght -= 1
        return cancelAndGetScrumble()
    case .plusButtonTapped:
        state.scrumbleLenght += 1
        return cancelAndGetScrumble()
    case .scrumbleResponse(.success(let scrumble)):
        state.isScrumbleRequestInFlight = false
        state.scrumble = scrumble
    case .generateButtonTapped:
        state.isScrumbleRequestInFlight = true
        state.scrumble = nil
        return environment
            .scrumbleGenerator
            .scrumble(lenght: state.scrumbleLenght)
            .receive(on: environment.mainQueue)
            .catchToEffect(TimerCounterAction.scrumbleResponse)
            .cancellable(id: ScrumbleCancellationId())
    default:
        return .none
    }
    return .none
}
