void
setup()
{
	size(800, 800, OPENGL);
	smooth();
}

void
draw()
{
	float sec = float(millis()) / 1000;

	background(0, 0, 0, 255);
	translate(width*0.5, height*0.5, -100);

	// orbs
	pushMatrix();
	rotateX((sec*0.5 + sin(sec*0.34)*0.25) * 0.6*PI);
	rotateY((sec*0.5 + sin(sec*0.3)*0.25) * 2*PI);
	float u = sec/60 * 2*PI;
	noStroke();
	fill(255);
	for(int i = 0; i < 7; i++){
		pushMatrix();
		rotateY((1+i) * u);
		translate(0, 0, -170);
		sphere(10);
		popMatrix();
	}
	popMatrix();

	// crystals
	rotateY(u);
	stroke(50, 50, 255);
	noFill();
	float v = 2 * PI/12;
	for(int i = 0; i < 12; i++){
		pushMatrix();
		rotateX(i * v);
		translate(0, 300, 0);
		box(40, 200, 40);
		popMatrix();
	}
}
