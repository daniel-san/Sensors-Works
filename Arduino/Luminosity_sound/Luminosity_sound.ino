int lum_A = 2;
int lum_D = 4;
int sound_A = 3;
int sound_D = 5;

int lum_analog_value = 0;
int lum_digital_value = 0;
int sound_analog_value = 0;
int sound_digital_value = 0;

void setup() {
  Serial.begin(115200);
  Serial.println("Testing luminosity and sound sensors");
  pinMode(lum_A, INPUT);
  pinMode(lum_D, INPUT);
  pinMode(sound_A, INPUT);
  pinMode(sound_D, INPUT);
}

void loop() {
  lum_analog_value = analogRead(lum_A);
  lum_digital_value = digitalRead(lum_D);
  sound_analog_value = analogRead(sound_A);
  sound_digital_value = digitalRead(sound_D);
  Serial.print("Luminosity Analog Value: ");
  Serial.println(lum_analog_value);
  Serial.print("Luminosity Digital Value: ");
  Serial.println(lum_digital_value);
  Serial.print("Sound Analog Value: ");
  Serial.println(sound_analog_value);
  Serial.print("Sound Digital Value: ");
  Serial.println(sound_digital_value);
  Serial.println("-------------------------------------\n");
  delay(1000);
}
