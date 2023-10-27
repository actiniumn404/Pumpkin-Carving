var image__windowsBG, img__chrome, img__pumpkin;
var WIDTH = 640;
var HEIGHT = 360;
var state = "WINDOWS";
var timer = 0;
var arg = "";
var after = "";

void setup(){
    size(WIDTH, HEIGHT);
    loop();

    image__windowsBG = loadImage('assets/windowsBG.png');
    img__chrome = loadImage('assets/chrome.png');
    img__pumpkin = loadImage('assets/pumpkin.png');

}

void draw__windows() {
    image(image__windowsBG, 0, 0, WIDTH, HEIGHT);

    fill(255, 255, 120);

    if (10 <= mouseX && mouseX <= 50 && 10 <= mouseY && mouseY <= 50){
        ellipse(30, 30, 45, 45);
    }else if (10 <= mouseX && mouseX <= 50 && 55 <= mouseY && mouseY <= 95){
        ellipse(30, 75, 45, 45);
    }

    image(img__chrome, 10, 10, 40, 40);
    image(img__pumpkin, 10, 55, 40, 40);
}


void click__windows(){
    if (10 <= mouseX && mouseX <= 50 && 55 <= mouseY && mouseY <= 95){
        timer = 10;
        state = "OPENING";
        arg = draw__pumpkin;
        after = "PUMPKIN"
    }
}

void draw__pumpkin(){
    var pumpkinY = 232;
    var pumpkinHeight = 250;

    fill(0, 0, 0);
    rect(0, 0, WIDTH, HEIGHT); // background

    fill(255, 153, 0);
    stroke(255, 119, 0);
    ellipse(width/2-pumpkinHeight/3, pumpkinY+10, pumpkinHeight/3, pumpkinHeight*0.8);
    ellipse(width/2+pumpkinHeight/3, pumpkinY+10, pumpkinHeight/3, pumpkinHeight*0.8);
    ellipse(width/2+pumpkinHeight/5, pumpkinY+5, pumpkinHeight/3, pumpkinHeight*0.9);
    ellipse(width/2-pumpkinHeight/5, pumpkinY+5, pumpkinHeight/3, pumpkinHeight*0.9);
    ellipse(width/2, pumpkinY+7, pumpkinHeight/2, pumpkinHeight*0.95);
}

void draw() {
    background(0, 0, 0);
    noStroke();

    if (state == "WINDOWS"){
        draw__windows();
    }else if (state == "OPENING"){
        scale(1);
        draw__windows();
        if (timer >= 50){
            state = after;
        }
        scale(timer/50)
        arg();
        timer += timer/7;
        if (timer >= 50){
            timer = 50;
        }
    }else if (state == "PUMPKIN"){
        draw__pumpkin();
    }

}

void mousePressed() {
    if (state == "WINDOWS"){
        click__windows();
    }
}
