void graph(){
  int graphHeight = 800;
 if (globalValues.length <= maxNumberOfSensors && globalValues.length > 0) {
      for (int i = 0; i < globalValues.length; i++) {

        // map the incoming values (0 to  1023) to an appropriate
        // graphing range (0 to window height/number of values):
        float ypos = map(globalValues[i], 0, 1023, 0, graphHeight/globalValues.length);

        // figure out the y position for this particular graph:
        float graphBottom = i * height/globalValues.length;
        ypos = ypos + graphBottom;

        // make a black block to erase the previous text:
        noStroke();
        fill(0);
        rect(10, graphBottom+1, 110, 20);

        // print the sensor numbers to the screen:
        fill(255);
        int textPos = int(graphBottom) + 14;

        text("Sensor " + i + ":" + globalValues[i], 10, textPos);
        // draw a line at the bottom of each graph:
        stroke(127);
        line(0, graphBottom, width, graphBottom);
        stroke(64*i, 32*i, 255);
        line(xpos, previousValue[i], xpos+1, ypos);
        previousValue[i] = ypos;
      }
   }

    if (xpos >= width) {
      xpos = 0;
      background(0);
    } 
    else {
      xpos++;
    }
}