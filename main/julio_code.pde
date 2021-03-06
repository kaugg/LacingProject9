 // Kemble test code::
void julio_code(Mesh M)
{
  int path_length = 531;
  
  int[] corner_path = new int[path_length];
  
  int current_corner =  M.firstCorner;
  
  int three_step = 0; // counter that goes to 4 to make ribbon paths
  
  // Add in path of corners
  for(int i = 0; i<path_length; i++)
  {
      
    
      if((three_step == 0))
       {
          current_corner = M.n(current_corner);
       }
       else if((three_step == 1) || (three_step == 2))
       {
           current_corner = M.u(current_corner);
       }
       
      
       three_step++;
       
       if(three_step==3)
       {
          three_step=0;
       }
       corner_path[i] = current_corner;
  }
  
  
  // Display corners within path
  for(int i = 0; i<path_length; i++)
  {
    M.showCorner( corner_path[i], 4);
  }
  
  
  // display lines
  stroke(red);
  pt A;
  pt B;
    // Display corners within path
  for(int i = 0; i<path_length-2; i++)
  {
      A = M.g( corner_path[i] );
      B = M.g( corner_path[i+1] );
      
      show(A,B);
  }
  
  
  //Test Bezier here
  
  
  //First corner to test Bezier
  int startBezier = M.firstCorner;
  //calculate normal for starting point here
  
  
  //Last corner to test Bezier
  int endBezier = M.s(M.n(startBezier));
  //calculate normal for end bezier here
  
  //call bezier for both normal control points here should generate a bezier curve to observe
  //bezier();
  
 }


