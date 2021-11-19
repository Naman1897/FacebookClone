//
//  ContentView.swift
//  FacebookClone
//
//  Created by Naman Singh on 10/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @Binding var text: String
    
    let stories = ["story1", "story2", "story3", "story4", "story5", "story6"]
    
    let logoColor = UIColor(red: 23/255.0,
                            green: 120/255.0,
                            blue: 242/255.0,
                            alpha: 1)
    
    var body: some View {
        VStack {
            HStack {
                    Text("facebook")
                        .font(.system(size: 45, weight: .bold, design: .default))
                        .foregroundColor(Color(logoColor))
                
                Spacer()
                
                Image(systemName: "bell.fill")
                    .resizable()
                    .frame(width: 35, height: 35, alignment: .center)
                    .foregroundColor(Color(.systemGray))
                
                Image("m-logo")
                    .resizable()
                    .frame(width: 35, height: 35, alignment: .center)
                    .foregroundColor(Color(.secondaryLabel))
            }
            .padding()
            
            TextField("Search", text: $text)
                .padding(7)
                .background(Color(.systemGray5))
                .cornerRadius(12.5)
                .padding(.horizontal, 5)
            
            ZStack {
                Color(.secondarySystemBackground)
                
                ScrollView(.vertical) {
                    VStack {
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 3) {
                                ForEach(stories, id: \.self) { name in
                                    Image(name)
                                        .resizable()
                                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                        .frame(width: 140, height: 200, alignment: .center)
                                        .background(Color.green)
                                        .clipped()
                                }
                            }
                            .padding()
                        }
                        
                        FBPost(accountName: "Cristiano Ronaldo",
                               feedPost: "Welcome to Manchester United. Forza Juve.",
                               profilePic: "p-1")
                        Spacer()
                        
                        FBPost(accountName: "Lewis Hamilton",
                               feedPost: "I am 7 times F1 Champion.",
                               profilePic: "p-2")
                        Spacer()
                        
                        FBPost(accountName: "Virat Kohli",
                               feedPost: "India will win 2022/23 World Cups.",
                               profilePic: "p-3")
                        Spacer()
                        
                    }
                }
            }
            
            Spacer()
        }
    }
}

struct FBPost: View {
    
    @State var postLikedPressed: Bool = false
    
    let accountName: String
    let feedPost: String
    let profilePic: String
    
    var body: some View {
        VStack {
            HStack {
                Image(profilePic)
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(25)
                VStack {
                    HStack {
                        Text(accountName)
                            .foregroundColor(Color.blue)
                            .font(.system(size: 18, weight: .semibold, design: .default))
                        Spacer()
                    }
                    
                    HStack {
                        Text("3 hours ago")
                            .foregroundColor(Color(.secondaryLabel))
                        Spacer()
                    }
                }
                Spacer()
            }
            Spacer()
            
            HStack {
                Text(feedPost)
                    .font(.system(size: 22, weight: .regular, design: .default))
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            Spacer()
            HStack {
                Button(action: {
                    postLikedPressed.toggle()
                }, label: {
                    Text(postLikedPressed ? "Liked" : "Like")
                })
                Spacer()
                Button(action: {
                }, label: {
                    Text("Comment")
                })
                Spacer()
                Button(action: {
                }, label: {
                    Text("Share")
                })
            }
            .padding()
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(8)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(text: .constant(""))
    }
}
