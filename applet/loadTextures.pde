 final String WORLD_BACKGROUND = "textures/background4.png";
 ArrayList<GLTexture> loadedTextures;


 /**
  * preload all textures into loadedTextures.
  */
public void loadTextures() {
  loadedTextures = new ArrayList<GLTexture>();
  gestureImage = loadImage("gestures.png"); // gesture intro image
  startImage = loadImage("thecreators.png"); // intro image
  
  String texturePath = sketchPath + "/data/textures/";
  File[] fileList = listFiles(texturePath);
  String[] textureNames = new String[fileList.length];

  //println("# of images in folder: " + fileList.length);

  for (int i = 0; i < fileList.length; i++) {
    File fileAtIndex = fileList[i];
   
    // load texture name as string
    if(!fileAtIndex.isHidden()) { // parse out .ds_store etc
      textureNames[i] = texturePath+fileAtIndex.getName();
    }
    //println("Name of texture: " + fileAtIndex.getName());
  }
  
/***** FIX THIS!!! ONLY ONE TEXTURE JUST SO IT LOADS FASTER.
********
*******
*/
//  loadedTextures.add(new GLTexture(ProcessingCanvas, textureNames[0]));
/*** UNCOMMENT THIS FOR PRODUCTION!! ***/
  for(String s : textureNames) {
    loadedTextures.add(new GLTexture(ProcessingCanvas, s));
  }
}


// This function returns all the files in a directory as an array of File objects
public File[] listFiles(String picturePath) {
  File file = new File(picturePath);
  if (file.isDirectory()) {
    File[] files = file.listFiles();
    return files;
  } else {
    // If it's not a directory
    return null;
  }
}
