//
//  HomeList.swift
//  DesignCode-SwiftUIApp
//
//  Created by Alter Ego on 11/1/19.
//  Copyright © 2019 Yihwan Kim. All rights reserved.
//

import SwiftUI

struct HomeList: View {
    @State var showContent = false
    var courses = coursesData
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Courses")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    
                    Text("22 courses")
                        .foregroundColor(.gray)
                }
                
                Spacer()
            }
            .padding(.leading, 70)
            .padding(.bottom, 30)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    ForEach(courses) { course in
                        Button(action: { self.showContent.toggle() }) {
                            CourseView(
                                title: course.title,
                                image: course.image,
                                color: course.color,
                                shadowColor: course.shadowColor
                            )
                                .sheet(isPresented: self.$showContent) { ContentView() }
                        }
                    }
                }
                .padding(.leading, 40)
                .padding(.bottom, 60)
                
            Spacer()
            }
        }
        .padding(.top, 78)
    }
}

struct HomeList_Previews: PreviewProvider {
    static var previews: some View {
        HomeList()
    }
}

struct CourseView: View {
    var title = "Build an app with SwiftUI"
    var image = "Illustration1"
    var color = Color.white
    var shadowColor = Color.black
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(30)
                .lineLimit(4)
                .padding(.trailing, 50)
            
            Spacer()
            Image(image)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 246, height: 150)
                .padding(.bottom, 30)
        }
        .background(color)
        .cornerRadius(30)
        .frame(width: 246, height: 360)
        .shadow(color: shadowColor, radius: 20, x: 0, y: 20)
    }
}

struct Course: Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var color: Color
    var shadowColor: Color
}

let coursesData = [
    Course(title: "Build an app with SwiftUI",
           image: "Illustration1",
           color: Color("background3"),
           shadowColor: Color("backgroundShadow3")),
    Course(title: "Design Course",
           image: "Illustration2",
           color: Color("background4"),
           shadowColor: Color("backgroundShadow4"))
]
