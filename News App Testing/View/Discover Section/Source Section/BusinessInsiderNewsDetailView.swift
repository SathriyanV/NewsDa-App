//
//  BusinessInsiderNewsDetailView.swift
//  News App Testing
//
//  Created by Sathriyan on 25/06/21.
//

import SwiftUI

struct BusinessInsiderNewsDetailView: View {
    
    @ObservedObject var newsViewModel = NewsViewModel()
    
    @ObservedObject var dateTimeDisplay = DateTimeDisplay()
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
      
        NavigationView {
            GeometryReader { geometry in
                if newsViewModel.isLoading {

                    ProgressView()
                        .scaleEffect(2)
                        .padding(.top, geometry.size.height * 0.5)
                        .padding(.leading, geometry.size.width * 0.5)
                }
                
                // MARK:- Header section
                
            VStack {
                
                Button(action: {self.presentationMode.wrappedValue.dismiss()}, label: {
                    HStack {
                        Image(systemName : "chevron.backward")
                        Text("Discover")
                    }
                    .frame(maxWidth : .infinity, alignment : .leading)
                    .padding(.leading, 15)
                    .padding(.top, 55)
                    
                })
                
                Divider()
                
                Text("Business Insider")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal, 18)
                    .padding(.top, 5)
                    .frame(maxWidth: .infinity, alignment : .leading)
                
                
                    ScrollView(showsIndicators: false){
                        
                        ForEach(newsViewModel.newsData) {item in
                            
                            // MARK:- Detail view section
                            
                            NavigationLink(
                                destination:
                                    VStack {
                                        
                                        UrlImageViewDetailView(urlString: item.urlToImage)
                                            
                                        newsViewModel.displayNewsDetailView(title: item.title, description: item.description ?? "No description is available", url: item.url)
                                        
                                    }
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                                    .navigationBarHidden(false)
                                    .navigationBarTitleDisplayMode(.inline)
                                    
                                    .toolbar(content: {
                                        
                                        ToolbarItemGroup(placement : .navigationBarTrailing) {
                                            Button(action: {
                                                
                                                newsViewModel.saveNewsOffline(title: item.title, description: item.description ?? "No description Available", image: item.urlToImage ?? "no url value", url: item.url, timeAt: item.publishedAt)
                                                
                                            }, label: {
                                                Image(systemName: "bookmark")
                                            })
                                            
                                            Spacer()
                                            
                                            Button(action: {
                                                
                                                newsViewModel.shareNews(news: item.url)
                                                
                                            }, label: {
                                                Image(systemName: "square.and.arrow.up")
                                            })
                                        }
                                    }),
                                
                                // MARK:- Body Scetion
                                
                                label: {
                                    HStack(alignment : .center){
                                        VStack(alignment : .leading, spacing : 0){
                                            Text(item.title)
                                                .foregroundColor(.black)
                                                .font(Font.system(size: 16))
                                                .fontWeight(.semibold)
                                                .lineSpacing(2.5)
                                                .frame(maxWidth : .infinity, maxHeight : .infinity, alignment : .leading)
                                                .padding(.vertical, 15)
                                                .padding(.leading, 15)
                                            
                                            HStack{
                                                
                                                Image(systemName : "calendar")
                                                    .resizable()
                                                    .foregroundColor(.black)
                                                    .frame(width : 11, height : 11)
                                                
                                                Spacer()
                                                    .frame(width : 8)
                                                
                                                Text(dateTimeDisplay.DateTimePrint(fullString : item.publishedAt))
                                                    .font(.footnote)
                                                    .foregroundColor(.black)
                                            }
                                            .padding(.horizontal)
                                            .padding(.bottom)
                                        }
                                        UrlImageViewMainView(urlString: item.urlToImage)
                                    }
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .shadow(radius: 1.5)
                                    .padding()
                                    .padding(.vertical, -10)
                                })
                        }
                        .navigationBarHidden(true)
                    }
                    .onAppear(perform: {
                        
                        newsViewModel.startLoadingScreen()
                    })
                }
            }
            .background(Color(hue: 0.509, saturation: 0.0, brightness: 0.96))
            .edgesIgnoringSafeArea(.top)
            
            .onAppear(perform: {
                newsViewModel.LoadBusinessInsiderDetailData()
            })
        }
    }
}

struct BusinessInsiderNewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessInsiderNewsDetailView()
    }
}
