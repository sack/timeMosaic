// timeMozaic
// big up to Ben Fry for the grid

int column;
int columnCount;
int lastRow;

int imgWidth = 64;
int imgHeight = 48;

int[] scoot;
File[] myFiles;
int curFileIndex=0;

PImage curImg;


void setup() {
  size(640, 480, P2D);
  column = 0;
  columnCount = width / imgWidth;
  int rowCount = height / imgHeight;
  lastRow = rowCount - 1;
  
  scoot = new int[lastRow*imgHeight * width];
  background(0);
  
  String data = dataPath("");
  myFiles =  listFiles(data);
  
  
}


void draw() {
    if (curFileIndex == myFiles.length){
     curFileIndex=0;
    }
    println(myFiles[curFileIndex].getName());
      curImg = loadImage(myFiles[curFileIndex].getName());
      curImg.resize(imgWidth, imgHeight);
      
    set(curImg.width*column, curImg.height*lastRow, curImg);
    column++;
    if (column == columnCount) {
      loadPixels();
        
      arraycopy(pixels, curImg.height*width, scoot, 0, scoot.length);
      arraycopy(scoot, 0, pixels, 0, scoot.length);

      for (int i = scoot.length; i < width*height; i++) {
        pixels[i] = #000000;
      }
      column = 0;
      updatePixels();
    }
    
    curFileIndex++;
}
