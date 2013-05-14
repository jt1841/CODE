//===============================================================
//
// THE GLOVES PROJECT - PROCESSING BRIDGE
//
// Receives and displays all glove messages
// Adapt to use the gloves with your own code
//
// Requirements: the oscP5 library (http://www.sojamo.de/libraries/oscP5/)
//
//===============================================================

// create GlovesData object to interpret osc messages
GlovesData gloves;
PrintWriter output;
int counter = 0;

String filename = "thumbsUpR.txt";

//==================================================
// setup function
void setup() {
  size(400, 400);

  // initialise GloveData object
  gloves = new GlovesData();
  output = createWriter(filename);
}

//==================================================
// draw function
void draw()
{
  background(40);
  textSize(22);
  text("Logging to " + filename, 20,30);
  textSize(72);
  text(counter,width/2,height/2);
  
  textSize(22);
  text("'space' to log, 's' to save and quit", 20,height-50);
}


// when the mouse is pressed
void keyPressed()
{
  if (key == 32)
  {
    for (int i = 0;i < 3;i++)
    {
      output.print(gloves.flexR[i]);
      output.print(",");
    }
    output.println(gloves.flexR[3]);
  }

  if (key == 's')
  {
    output.flush();  // Writes the remaining data to the file
    output.close();  // Finishes the file
    exit();  // Stops the program
  }
  counter++;
}

