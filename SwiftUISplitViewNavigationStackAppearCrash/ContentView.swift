//
//  ContentView.swift
//  SwiftUISlitViewAppearGestureCrash
//
//  Created by Simon Nickel on 29.08.23.
//

import SwiftUI
import Observation

@Observable
public class NavState {
	var pathSplitDetail: NavigationPath = NavigationPath()
}

struct ContentView: View {
	
	struct Scene: Identifiable, Hashable {
		let id: UUID = UUID()
		var name: String
	}
	
	private let scenes: [Scene] = [
		Scene(name: "1"),
		Scene(name: "2"),
		Scene(name: "3"),
	]
	
	@State private var navState: NavState = NavState()
	@State private var showSplitView: Bool = true
	
	@State private var selectedInSidebarScene: Scene?
	
	var body: some View {
		
		VStack {
			
			Toggle(isOn: $showSplitView, label: {
				Text("Show SplitView")
			})
			
			if showSplitView {
				NavigationSplitView {
					List(selection: $selectedInSidebarScene) {
						ForEach(scenes) { scene in
							NavigationLink(value: scene) {
								Text(scene.name)
							}
						}
					}
				} detail: {
					NavigationStack(path: $navState.pathSplitDetail) {
						Group {
							if let selected = selectedInSidebarScene {
								ListLoopScreen(title: selected.name)
							} else {
								Text("No groups or items defined.")
							}
						}
						.navigationDestination(for: Scene.self) { scene in
							ListLoopScreen(title: scene.name)
						}
					}
				}
			}
			
		}
		
    }
}

#Preview {
    ContentView()
}
