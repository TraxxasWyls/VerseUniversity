//
//  DownloadableDataEnvironment.swift
//  University
//
//  Created by Дмитрий Савинов on 10.02.2022.
//

import Foundation
import VERSE

// MARK: - RecursiveTreeEnvironment

public struct DownloadableDataEnvironment {

    public let downloadService: DownloadService = DownloadServiceImplementation()

    public let mainQueue: AnySchedulerOf<DispatchQueue> = DispatchQueue.main.eraseToAnyScheduler()
}
