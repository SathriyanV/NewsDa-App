//
//  SignUPView.swift
//  News App Testing
//
//  Created by Sathriyan on 24/06/21.
//

import SwiftUI

struct SignUPView: View {
    
    @State var name : String = ""
    @State var mail : String = ""
    @State var password : String = ""
    
    var body: some View {
        GeometryReader { geo in
            NavigationView {
                VStack {
                    VStack {
                        VStack (spacing : geo.size.height * 0.018){
                            
                            Text("Create New Account")
                                .font(Font.system(size: geo.size.height * 0.04))
                                .fontWeight(.semibold)
                                .frame(maxWidth : .infinity, alignment: .leading)
                                .padding(.top, geo.size.height * 0.1)
                                .padding(.leading, geo.size.width * 0.07)
                            
                            Text("Please enter your Name, Email and Password")
                                .font(Font.system(size: geo.size.height * 0.02))
                                .fontWeight(.semibold)
                                .foregroundColor(Color("DividerColor"))
                                .frame(maxWidth : .infinity, alignment: .leading)
                                .padding(.leading, geo.size.width * 0.07)
                                .padding(.trailing, geo.size.width * 0.2)
                                .lineSpacing(geo.size.height * 0.005)
                        }
                        
                        VStack(spacing : geo.size.height * 0.025){
                            
                            TextField("Name", text: $name)
                                .font(Font.system(size: geo.size.height * 0.022))
                                .disableAutocorrection(true)
                                .padding(.leading, geo.size.width * 0.035)
                                .frame(width : geo.size.width * 0.85, height: geo.size.height * 0.065)
                                .background(Color.white)
                                .cornerRadius(geo.size.width * 0.03)
                                .shadow(radius: 1.2)
                            
                            TextField("Email", text: $mail)
                                .font(Font.system(size: geo.size.height * 0.022))
                                .padding(.leading, geo.size.width * 0.035)
                                .frame(width : geo.size.width * 0.85, height: geo.size.height * 0.065)
                                .background(Color.white)
                                .cornerRadius(geo.size.width * 0.03)
                                .shadow(radius: 1.2)
                            
                            SecureField("Password", text: $password)
                                .font(Font.system(size: geo.size.height * 0.022))
                                .padding(.leading, geo.size.width * 0.035)
                                .frame(width : geo.size.width * 0.85, height: geo.size.height * 0.065)
                                .background(Color.white)
                                .cornerRadius(geo.size.width * 0.03)
                                .shadow(radius: 1.2)
                            
                        }
                        .frame(maxWidth : .infinity, alignment: .leading)
                        .padding(.leading, geo.size.width * 0.07)
                        .padding(.top , geo.size.height * 0.035)
                        
                        VStack(spacing : geo.size.height * 0.04) {
                            
                            Text("Create Account")
                                .font(Font.system(size: geo.size.height * 0.027))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(width : geo.size.width * 0.7, height: geo.size.height * 0.065)
                                .background(Color("ButtonColor"))
                                .cornerRadius(geo.size.width * 0.03)
                                .opacity(0.9)
                            
                            HStack{
                                Rectangle()
                                    .fill(Color("DividerColor"))
                                    .frame(width: geo.size.width * 0.18, height: geo.size.height * 0.004)
                                    .padding(.top, geo.size.height * 0.005)
                                    .opacity(0.65)
                                
                                Text("or")
                                    .font(Font.system(size: geo.size.height * 0.03))
                                    .foregroundColor(Color("DividerColor"))
                                    .fontWeight(.semibold)
                                
                                Rectangle()
                                    .fill(Color("DividerColor"))
                                    .frame(width: geo.size.width * 0.18, height: geo.size.height * 0.004)
                                    .padding(.top, geo.size.height * 0.005)
                                    .opacity(0.65)
                            }
                            
                            VStack(spacing : geo.size.height * 0.05){
                                
                                Text("Connect with your")
                                    .font(Font.system(size: geo.size.height * 0.025))
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color("DividerColor"))
                                
                                HStack(spacing : geo.size.width * 0.1){
                                    ZStack {
                                        
                                        Color.white.opacity(1)
                                            .frame(width: geo.size.width * 0.135, height: geo.size.width * 0.135)
                                            .cornerRadius(geo.size.width * 0.022)
                                            .shadow(radius: 1.2)
                                        
                                        Image("Apple Icon")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: geo.size.width * 0.068, height: geo.size.width * 0.068)
                                            .padding(.bottom , geo.size.height * 0.003)
                                    }
                                    
                                    ZStack {
                                        
                                        Color.white.opacity(1)
                                            .frame(width: geo.size.width * 0.135, height: geo.size.width * 0.135)
                                            .cornerRadius(geo.size.width * 0.022)
                                            .shadow(radius: 1.2)
                                        
                                        Image("Google Icon")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: geo.size.width * 0.06, height: geo.size.width * 0.06)
                                    }
                                    
                                    ZStack {
                                        
                                        Color.white.opacity(1)
                                            .frame(width: geo.size.width * 0.135, height: geo.size.width * 0.135)
                                            .cornerRadius(geo.size.width * 0.022)
                                            .shadow(radius: 1.2)
                                        
                                        Image("Facebook Icon")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: geo.size.width * 0.06, height: geo.size.width * 0.06)
                                    }
                                }
                            }
                           
                        }
                        .padding(.top , geo.size.height * 0.065)
                        
                        VStack{
                            
                            HStack {
                                Text("Already have an account ?")
                                    .font(Font.system(size: geo.size.height * 0.02))
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color("DividerColor"))
                                
                                Text("Sign In")
                                    .font(Font.system(size: geo.size.height * 0.025))
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color("ButtonColor"))
                            }
                            
                        }
                        .padding(.top , geo.size.height * 0.08)
                        .frame(maxWidth : .infinity, alignment: .center)
                    }
                    
                    .navigationBarHidden(false)
                }
                .frame(maxWidth : .infinity, maxHeight: .infinity, alignment: .top)
                .background(Color("BGColor"))
                .edgesIgnoringSafeArea(.all)
                
            }
        }
        .ignoresSafeArea(.keyboard)
    }
}

struct SignUPView_Previews: PreviewProvider {
    static var previews: some View {
        SignUPView()
    }
}
