//
//  KeychainBootcamp.swift
//  SwiftUI Libraries
//
//  Created by Vuk Knezevic on 04.04.24.
//

import SwiftUI
import KeychainSwift

// MARK: - Keychain je isto sto i UserDefaults ili AppStorage samo sa enkripcijom, pa je zgodan za password, serijski broj, kreditne kartice i druge osetljive podatke, a moze i da se seruje medju uredjajima sa istim AppleID


final class KeychainManager {
    let keychain: KeychainSwift
    
    init() {
        let kc = KeychainSwift()
        kc.synchronizable = true // da se sinhronizuje sa mojim ostalim uredjajima
        self.keychain = kc
    }
    
    func set(_ value: String, key: String) {
        keychain.set(value, forKey: key)
    }
    
    func get(_ key: String) -> String? {
        keychain.get(key)
    }
    
}

struct KeychainManagerKey: EnvironmentKey {
    static var defaultValue: KeychainManager = KeychainManager()
}

extension EnvironmentValues {
    var keychain: KeychainManager {
        get { self[KeychainManagerKey.self] }
        set { self[KeychainManagerKey.self] = newValue }
    }
}


@propertyWrapper
struct KeychainStorage: DynamicProperty {

    @State private var newValue: String
    let key: String
    let keychain: KeychainManager
    
    var wrappedValue: String {
        get { newValue }
        nonmutating set { save(newValue: newValue) }
    }
    
    var projectedValue: Binding<String> {
        Binding {
            wrappedValue
        } set: { newValue in
            wrappedValue = newValue
        }
    }

    init(wrappedValue: String, _ key: String) {
        self.key = key
        self.keychain = KeychainManager()
        newValue = keychain.get(key) ?? ""
        print("SUCCESS READ")
    }
    
    func load() -> String? {
        keychain.get(key)
    }

    func save(newValue: String) {
        keychain.set(newValue, key: key)
        self.newValue = newValue
        print("SUCCESS")
    }
}


struct KeychainBootcamp: View {
    
//    let keychain = KeychainSwift()
//    @Environment(\.keychain) var globalKeychain
    
//    @State private var userPassword: String = ""
    @KeychainStorage("user_password") var userPassword: String = ""
    
    var body: some View {
        Button(userPassword.isEmpty ? "No Password" : userPassword) {
            let password = "abc123!"
//            globalKeychain.keychain.set(password, forKey: "user_password")
//            globalKeychain.set(password, key: "user_password")
            userPassword = password
        }
        .onAppear {
//            userPassword = globalKeychain.keychain.get("user_password") ?? ""
//            userPassword = globalKeychain.get("user_password") ?? ""
            // sad se ovo desava u property wrapperu
        }
    }
}

#Preview {
    KeychainBootcamp()
}
