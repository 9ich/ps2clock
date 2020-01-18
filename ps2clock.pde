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
	rotateY((sec*0.5 + sin(sec*0.3)*0.25) * TWO_PI);
	float u = sec/60 * TWO_PI;
	noStroke();
	fill(255);
	for(int i = 0; i < 7; i++){
		pushMatrix();
		rotateY((1+i) * u);
		translate(0, 0, -130);
		sphere(7);
		popMatrix();
	}
	popMatrix();

	// crystals
	rotateX(u);
	rotateY(PI*0.5 + u);
	stroke(50, 50, 255);
	noFill();
	float v = TWO_PI/12;
	for(int i = 0; i < 12; i++){
		pushMatrix();
		rotateX(i * v);
		translate(0, 140, 0);
		rotateY(-sec*0.0625 * TWO_PI);
		cylinder(20, 200, 6);
		popMatrix();
	}
}

void
cylinder(float r, float h, int sides)
{
	float u = TWO_PI/sides;
	beginShape(QUAD_STRIP);
	for(int i = 0; i <= sides; i++){
		float p = i*u, cp = r*cos(p), sp = r*sin(p);
		vertex(cp, 0, sp);
		vertex(cp, h, sp);
	}
	endShape();
}
