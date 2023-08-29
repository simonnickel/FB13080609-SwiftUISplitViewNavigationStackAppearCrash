//
//  ListLoopScreen.swift
//  SwiftUISlitViewAppearGestureCrash
//
//  Created by Simon Nickel on 29.08.23.
//

import SwiftUI

struct ListLoopScreen: View {
	
	let title: String
	
	struct ListItem: Identifiable, Hashable, Codable {
		var id: UUID = UUID()
		let title: String
	}
	
	var body: some View {
		ListScreen(item: ListItem(title: "Loop \(title)"))
			.navigationDestination(for: ListItem.self) { selected in
				ListScreen(item: selected)
			}
	}
	
	struct ListScreen: View {
		let item: ListItem
		
		var body: some View {
			let items: [ListItem] = (0..<50).map({ ListItem(title: "Item \($0)") })
			List(items) { item in
				NavigationLink(value: item) {
					Text(item.title)
				}
			}
			.navigationTitle(item.title)
		}
	}
	
}
