//
//  ContentView.swift
//  Demo
//
//  Created by Yuki Kuwashima on 2025/02/14.
//

import SwiftUI
import P5View

struct ContentView: View {

    @State var words: [String] = ["ありがとう", "天才", "wow"]

    var generatedWordString: String {
        words.map { "\"\($0)\"" }.joined(separator: ",")
    }

    var body: some View {
        P5View(p5Source:
            """
            const words = [\(generatedWordString)];
            const nodes = []; 

            let img;
            
            function preload() {
                img = loadImage("\(P5View.createBase64Image(image: UIImage(named: "test.jpg")!)!)");
            }
            
            function setup() {
                createCanvas(windowWidth, windowHeight);
                textAlign(CENTER, CENTER);
                textSize(64);
                colorMode(HSB, 360, 100, 100, 100);
            
                words.forEach((txt, i) => {
                    nodes.push({ txt, base: (TWO_PI * i) / words.length });
                });
            }
            
              function draw() {
                background(0, 0, 0, 12);      // 少し残像を残す
                translate(width / 2, height / 2);
                
                image(img, 0, 0);
            
                const t = millis() * 0.0005;  // 時間パラメータ
            
                nodes.forEach((n, i) => {
                  // 角度を時間で回転させる
                  const ang = n.base + t;
                  // 半径をゆらゆらさせる
                  const radius = 200 + 50 * sin(t * 2 + i);
                  const x = radius * cos(ang);
                  const y = radius * sin(ang);
            
                  push();
                  translate(x, y);
                  rotate(ang + HALF_PI);      // 進行方向に向けて回転
                  fill((ang * 180 / PI) % 360, 80, 100); // 色相を回転に合わせて変化
                  noStroke();
                  text(n.txt, 0, 0);
                  pop();
                });
            }
            """,
               baseURL: Bundle.main.resourceURL!
        )
        .ignoresSafeArea()

        Button("add") {
            words.append(UUID().uuidString)
        }
    }
}

#Preview {
    ContentView()
}
