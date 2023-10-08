import processing.sound.*;
SoundFile sound; // Variable para el archivo de sonido
PImage img; // Variable para la imagen
int soundBaseRate = 1; // Tasa base de reproducción del sonido (1.0 = velocidad normal)

void setup() {
  size(800, 600);
  img = loadImage("imagen.jpg"); // Cambia "imagen.jpg" al nombre de tu archivo de imagen
  sound = new SoundFile(this, "tusonido.wav"); // Cambia "tusonido.wav" al nombre de tu archivo de sonido
  sound.amp(0.5); // Ajusta el volumen del sonido (de 0 a 1)
  sound.loop();
}

void draw() {
  background(255);
  image(img, 0, 0, width, height);

  // Calcula la posición relativa del mouse en la imagen
  float mouseXPercent = constrain(map(mouseX, 0, width, 0, 1), 0, 1);

  // Calcula la tasa de reproducción del sonido en función de la posición horizontal del mouse
  float rate = soundBaseRate + (mouseXPercent * 2); // Cambia 2 para ajustar la variación de la tasa de reproducción

  // Establece la tasa de reproducción del sonido
  sound.rate(rate);

  // Dibuja un indicador visual de la tasa de reproducción del sonido
  fill(255, 0, 0);
  noStroke();
  ellipse(mouseX, height - 50, 20, 20);
}
