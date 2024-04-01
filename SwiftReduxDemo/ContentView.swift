//
//  ContentView.swift
//  SwiftReduxDemo
//
//  Created by Josue Lubaki on 2024-04-01.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var store : Store
    
    struct Props {
        let counter : Int
        let onIncrement: () -> Void
        let onDecrement: () -> Void
        let onAdd: (Int) -> Void
    }
    
    private func map(state : State) -> Props {
        Props(
            counter: state.counter,
            onIncrement: {
                store.dispatch(action: IncrementAction())
            },
            onDecrement: {
                store.dispatch(action: DecrementAction())
            },
            onAdd: { value in
                store.dispatch(action: AddAction(value: value))
            }
        )
    }
    
    var body: some View {
        
        let props = map(state: store.state)
        
        VStack {
            Text("\(props.counter)")
                .padding()
            
            Button("Increment"){
                props.onIncrement()
            }
            
            Button("Decrement"){
                props.onDecrement()
            }
            
            Button("OnAdd"){
                props.onAdd(50)
            }
        }
    }
}

fileprivate struct ContentViewPreviews : View {
    
    let store = Store(reducer: reducer)
    
    var body : some View {
        ContentView().environmentObject(store)
    }
}

#Preview {
    ContentViewPreviews()
}
