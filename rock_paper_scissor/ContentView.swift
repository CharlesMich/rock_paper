//
//  ContentView.swift
//  rock_paper_scissor
//
//  Created by Charles Michael on 1/5/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var playerChoice = ""
    @State private var appChoice = ""
    @State private var result = ""
    
    
    let choices = ["rock", "paper", "scissor"]
    
    func whoWon(){
        if playerChoice == "rock"{
            if appChoice == "rock"{
                result = "tie"
            }
            else if appChoice == "paper" {
                result = "lose"
            } else if appChoice == "scissor" {
                result = "win"
            } else {
                return
            }
        }
        if playerChoice == "paper"{
            if appChoice == "rock"{
                result = "win"
            }
            else if appChoice == "paper" {
                result = "tie"
            } else if appChoice == "scissor" {
                result = "lose"
            } else {
                return
            }
        }
        if playerChoice == "scissor"{
            if appChoice == "rock"{
                result = "lose"
            }
            else if appChoice == "paper" {
                result = "win"
            } else if appChoice == "scissor" {
                result = "tie"
            } else {
                return
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                ForEach (choices, id:\.self){ choice in
                    Button {
                        playerChoice = choice
                        appChoice = choices[Int.random(in: 0..<choices.count)]
                        whoWon()
                    } label: {
                        VStack{
                            Text(choice)
                                .foregroundStyle(.white)
                                .frame(width: 300, height: 50)
                        }
                        .background(Color.red)
                       
                        .clipShape(.capsule)
                      
                           
                    }
                }
                Spacer()
                Text(playerChoice == "" ? "" : "You chose \(playerChoice) and the app chose \(appChoice)")
                Text(result == "" ? "" : "you \(result)")
                Spacer()
                Button {
                    appChoice = ""
                    playerChoice = ""
                    result = ""
                } label: {
                    Text("Reset")
                }
            }
            .padding()
            .navigationTitle("Rock, Paper, Scissor")
        }
       
    }
}

#Preview {
    ContentView()
}
