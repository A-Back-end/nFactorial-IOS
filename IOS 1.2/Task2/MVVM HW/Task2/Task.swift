import SwiftUI

struct User {
    var FirstName = ""
    var Password = ""
}

struct view2: View {
    @State private var user = User()
    @State var selected = 0

    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                VStack {
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                    
                    TextField("Name:", text: $user.FirstName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Password:", text: $user.Password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button("Log in") {
                    }
                        .foregroundColor(.white)
                        .bold()
                        .padding(10)
                        .padding(.horizontal, 20)
                        .background(Color.blue)
                        .cornerRadius(10)
                    
                NavigationLink("Register", destination: view3())
                    .padding(.top, 90)
                    .foregroundColor(.black)
                    .overlay(
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.black),
                        alignment: .bottom
                    )
                    
                    Spacer()
                }
                .padding(50)
                .padding(.vertical, 350)
                
                
                HStack {
                    Button(action: {
                        self.selected = 0
                    }) {
                        Image(systemName: "house.fill")
                            .foregroundColor(self.selected == 0 ? .black : .white)
                        Spacer().frame(width: 60)
                    }
                    
                    Button(action: {
                        self.selected = 1
                    }) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(self.selected == 1 ? .black : .white)
                        Spacer().frame(width: 80)
                        
                    }
                    
                    Button(action: {
                        self.selected = 2
                    }) {
                        Image(systemName: "person")
                            .foregroundColor(self.selected == 2 ? .black : .white)
                        Spacer().frame(width: 50)
                    }
                    
                    Button(action: {
                        self.selected = 3
                    }) {
                        Image(systemName: "text.justify")
                            .foregroundColor(self.selected == 3 ? .black : .white)
                        Spacer().frame(width: 0)
                    }
                }
                .padding()
                .padding(.horizontal, 50)
                .background(Color.blue)
                .padding(.vertical, 150)
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}


struct view3: View{
        @State private var user = User()
        
        var body: some View{
            VStack(){
                Text("Registeration")
                    .font(.largeTitle)
                    .bold()
                
                TextField("Name:", text:$user.FirstName).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("SecondName:", text:$user.FirstName).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Password:", text: $user.Password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Register") {
                   
                }
                .foregroundColor(.white)
                .bold()
                .padding(10)
                .padding(.horizontal, 20)
                .background(Color.blue)
                .cornerRadius(10)
            }.padding(40)
            .navigationTitle("Profile")
        }
}

#Preview {
    view2()
}

