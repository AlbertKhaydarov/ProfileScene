//
//  ContentView.swift
//  ProfileScene
//
//  Created by Альберт Хайдаров on 23.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var date = Date()
    
    @State private var gender: Gender = .male
    @State private var isOn = false
    @State private var isNewsOn = false
    @State private var isFriendsOn = false
    @State private var isShowingDialog = false
    
    
    enum Gender: String, CaseIterable, Identifiable {
        
        case male, female
        var id: Self {self}
    }
    
    var body: some View {
        
        NavigationView(content: {
            List {
                Section(header: Text("Личные данные")) {
                    TextField("Имя",
                              text: $firstName,
                              prompt: Text("Имя"))
                    TextField("Фамилия",
                              text: $lastName,
                              prompt: Text("Имя"))
                    
                    DatePicker("Дата рождения",
                               selection: $date,
                               displayedComponents: [.date])
                    
                    Picker("Пол",
                           selection: $gender) {
                        Text(Gender.male.rawValue.capitalized).tag(Gender.male)
                        Text(Gender.female.rawValue.capitalized).tag(Gender.female)
                    }
                           .pickerStyle(.navigationLink)
                }
                Section(header: Text("Получать нотификации")) {
                    Toggle("Push enabled", isOn: $isOn)
                    if isOn {
                            Toggle("Новости", isOn: $isNewsOn)
                            Toggle("Обновления друзей", isOn: $isFriendsOn)
                    }
                }
                Section(header: Text("Личная информация")) {
                    Button("Документы") {
                        print("Документы")
                    }
                    Button("Условия использования") {
                        print("Условия использования")
                    }
                }
                Section(header: Text("Личная информация")) {
                    Button("Выход") {
                        isShowingDialog = true
                    }
                 
                    .foregroundColor(.red)
                    
                    .alert("Выход",
                           isPresented: $isShowingDialog) {
                        Button("Выйти",
                               role: .destructive) {
                            print("logout")
                        }
                        Button("Отмена",
                               role: .cancel) {
                            isShowingDialog = false
                        }
                    } message: {
                        Text("Вы уверены, что хотите выйти?")
                    }
                }
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
