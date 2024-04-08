//
//  SwiftfulRoutingBootcamp.swift
//  SwiftUI Libraries
//
//  Created by Vuk Knezevic on 05.04.24.
//

import SwiftUI
import SwiftfulRouting

struct SwiftfulRoutingBootcamp: View {
    var body: some View {
        RouterView { router in
            MyHomeView(router: router)
        }
    }
}

struct MyHomeView: View {
    
//    @Environment(\.router) var router
    let router: AnyRouter
    
    var body: some View {
        
        let route: AnyRoute = AnyRoute(.push) {
            print("Action to be done on dissmiss")
        } destination: { _ in
            MyThirdScreen()
        }

        
        VStack(spacing: 20) {
            Button("CLICK ME") {
                router.showScreen(.push, onDismiss: {
                    print("Action to be done on dissmiss")
                }) { router in
                    MyThirdScreen()
                }
            }
            
            Button("CLICK ROUTE") {
                router.showScreen(route)
            }
            
            Button("CLICK ALERT") {
                router.showAlert(.alert, title: "Alert") {
                    Button("OK") {
                        print("Vuk")
                    }
                    
                    Button("Cancel") {
                        print("Vuk")
                    }
                }
            }
            
            Button("CLICK MODEL") {
                router.showBasicModal {
                    Text("Vuk")
                }
            }
            
        }
        .navigationTitle("Vuk")
    }
}

struct MyThirdScreen: View {
    
    @Environment(\.router) var router
    
    var body: some View {
        Button("CLIKCK ME") {
//            router.dismissScreen()
//            router.dismissScreenStack() // dismisuje sve ekrane koji su isto route-ovani, npr. sve ekrane koji su pushovani, ali ce da stane kod onog koji je modalno prezentovan
            router.dismissEnvironment() // ovim se dismisuje sve bez obzira na tip route-ovanja 
        }
        .navigationTitle("Third screen")
    }
}

#Preview {
    SwiftfulRoutingBootcamp()
}
