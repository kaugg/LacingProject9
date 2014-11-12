







 // Kemble test code::
void kemble_code(Mesh M)
{
 
   strokeWeight(1);
    
    for (int c=0; c<M.nc; c++) 
    { 
        // Basic weave crossing points
        pt A = M.ccg(c);            //  compute offset corner location
        pt C = M.ccg(M.s(M.n(c)));  //  compute offset corner location
        pt B = M.ccg(M.n(M.s(c)));  //  compute offset corner location
      
      
        // beginning of normal computing code
        
        //M.showCornerAndNormal(c,2);
        int r = 2;
        pt cPt = midPt(M.g(c),midPt(M.g(c),M.triCenter(M.t(c))));  
        noStroke(); 
        // cPt.show(r);  hide ball 
        stroke(magenta); 
        
        vec N = M.Nt[M.t(c)].make(); 
        N.makeUnit();  
        
        if( c%3==0 )
        {
          N.mul(10*r);
        }
        else
        {
          N.mul(-10*r);  // every other normal is negative
        }  
        //N.show(A);  // show the normal
      
        A.addVec(N);
      
        // end of Normal computing code
      
      
       stroke(orange); 
        bezier(A.x, A.y, A.z, N.x, N.y, N.z, B.x, B.y, B.z, C.x, C.y, C.z);

      
      
      
      //A.show(4);B.show(4);C.show(4);
      
      stroke(green); 
      showEdge(A,C); 
      
      stroke(red); 
      showEdge(A,B); 
     }
      
    // bend curves so that red edges goes below the blue edge and green goes above it
    // trace curves and assign a different color to each (computed when 'w' is pressed)
    // show curves as flat ribbons (Quad strips), toggle when 'q' is pressed
    // show curves as 4-sided tubes with minimal twist, toggle when 't' is pressed
    // change wiring to have a single loop
    // animate weaving invasion (for example: bottom up, along loop, from selected corner...)
    // animate fly through the path of a loop
    
    
    
    
    
    strokeWeight(1);
  
  
}


/*
  // OLD CODE

 int path_length = 431;
  
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

*/
