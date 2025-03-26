//
//  ContentViewSnapshotTests.swift
//  Example
//
//  Created by Nick Trienens on 3/25/25.
//


import PreviewSnapshotsTesting
import XCTest

@testable import Example

final class FailingContentViewSnapshotTests: XCTestCase {
    func test_snapshots() {
        FailingContentView_Previews.snapshots.assertSnapshots(as: .image(layout: .device(config: .iPhone13Pro)))
    }
}

final class ContentViewSnapshotTests: XCTestCase {
    func test_snapshots() {
        ContentView_Previews.snapshots.assertSnapshots(as: .image(layout: .device(config: .iPhone13Pro)), named: "framed")
    }
}

final class TsgsViewSnapshotTests: XCTestCase {
    func test_snapshots() {
        RemovableTagsView_Previews.snapshots.assertSnapshots(as: .image(layout: .device(config: .iPhone13Pro)))
        
        RemovableTagsView_Previews.snapshots.assertSnapshots(as: .image(layout: .device(config: .iPhone13Pro(.landscape))), named: "landscape")
        
    }
}
