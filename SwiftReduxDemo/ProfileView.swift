//
//  Profile.swift
//  SwiftReduxDemo
//
//  Created by Josue Lubaki on 2024-04-01.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var store : Store
    
    struct Props {
        let counter : Int
    }
    
    var body: some View {
        
        let props = Props(counter: store.state.counter)
        
        Text("Counter : \(props.counter)")
    }
}

fileprivate struct ProfilePreviews : View {
    private let store = Store(reducer: reducer)
    
    var body: some View {
        ProfileView().environmentObject(store)
    }
}

#Preview {
    ProfilePreviews()
}
