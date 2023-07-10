//
//  ContentView.swift
//  EyeDa V2
//
//  Created by Sandeep on 7/7/23.
//

import SwiftUI
import CoreGraphics

let screenSize: CGRect = UIScreen.main.bounds // Define variable to retrieve screen width and height
//init violet: (Color.init(red:146, green:94, blue:209))

struct RoundedRectangleView: View {
    var height: CGFloat
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color(red: 146/255, green: 94/255, blue: 209/255))
            .frame(width: screenSize.width, height: height)
    }
}

struct SleepTimeView: View {
    var hours: Int
    var minutes: Int
    var height: CGFloat
    var width: CGFloat
    
    var body: some View {
        HStack(spacing: 4) {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(red: 245/255, green: 245/255, blue: 220/255)) // Give the background a creme color
                .frame(width: width, height: height)
                .overlay(
                    Text(String(format: "%02d", hours))
                        .foregroundColor(Color(red: 148/255, green: 0/255, blue: 211/255))
                        .font(.system(size: 80, weight: .bold)) // Make text bold and change the size to 80
                )
            
            Text(":").foregroundColor(Color(red: 245/255, green: 245/255, blue: 220/255))
                .font(.system(size: 80, weight: .bold))
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(red: 245/255, green: 245/255, blue: 220/255))
                .frame(width: width, height: height)
                .overlay(
                    Text(String(format: "%02d", minutes))
                        .foregroundColor(Color(red: 148/255, green: 0/255, blue: 211/255))
                        .font(.system(size: 80, weight: .bold))
                )
        }
        .edgesIgnoringSafeArea(.all) // Ignore safe area for background color
    }
}

struct WeeklyChallengesView: View {
    var body: some View {
        Button(action: {}) {
                    ZStack {
                        Image("CartoonLandscape")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: screenSize.width - 20, height: 150)
                            .cornerRadius(10)
                        
                        HStack {
                            Image("medal")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                            
                            Text("Weekly Challenges")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Color(red: 146/255, green: 94/255, blue: 209/255))
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .frame(height: 0.0)
                                .font(.title)
                                .foregroundColor(Color(red: 146/255, green: 94/255, blue: 209/255))
                        }
                        .padding()
                    }
                }
    }
}

struct TopInfoBar: View {
    var body: some View {
        HStack {
            Spacer().frame(width:2.0)
            
            Text("9:41")
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
            
            Spacer()
            
            Image(systemName: "wifi")
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
            
            Text("100%")
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
            
            Spacer()
                .frame(width: 2.0)
        }
        .padding()
        //.edgesIgnoringSafeArea(.top)
    }
}

struct ProgressBarView: View {
    var progress: CGFloat
    var text: String
    var _height: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 4) {
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .shadow(color: .black.opacity(0.2), radius: 3, x: 0, y: 2)
                        .frame(height: _height)
                    HStack {
                        Text(text)
                            .font(.headline)
                            .foregroundColor(.purple)
                            .padding(.leading,10)
                            .position(x:geometry.size.width/10, y:geometry.size.height/10 * 4)
                        
                        //Spacer().frame(width:275)
                        
                        Image(systemName: "chevron.right")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.purple)
                            .padding(.trailing, 10)
                            .position(x:geometry.size.width/10 * 4, y:geometry.size.height/10 * 4)
                        
                        
                    }
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.purple)
                            .frame(height: 30)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.6), .clear]), startPoint: .trailing, endPoint: .leading))
                                    .frame(width: 200 * progress, height: 30)
                            )
                            .position(x:geometry.size.width/2 - 15, y:geometry.size.height/10 * 5.5)
                    }
                    .padding(.vertical, 5)
                }
            }
            .padding()
        }
    }
}


struct ContentView: View {
    var body: some View {
        ZStack { // ZStack allows for structures to be place on top of one another
            RoundedRectangleView(height:300).position(x:screenSize.width/2, y:20)
            SleepTimeView(hours: 7, minutes: 30, height:100, width:screenSize.width/3).position(x:screenSize.width/2, y:90)
            WeeklyChallengesView().position(x:screenSize.width/2, y:250)
            VStack{
                ProgressBarView(progress: 0.6, text: "Progress 1", _height: 75.0)
                ProgressBarView(progress: 0.2, text: "Progress 2", _height: 75.0)
                ProgressBarView(progress: 0.8, text: "Progress 3", _height: 75.0)
            }.position(x:screenSize.width/2, y: 450)
            TopInfoBar().position(x:screenSize.width/2, y: -25)

        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
