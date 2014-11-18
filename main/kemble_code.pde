



// Kemble test code::
void kemble_code(Mesh M, float animation_s)
{
 

  
  
   strokeWeight(1);
    
    //int c=0;
    
    pt current_vertex_for_corner = M.g(0);
    
   for (int c=0; c<(M.nc - animation_s); c++) 
   { 
        current_vertex_for_corner = M.g(c);  // get vertex of point
     
     
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
        
        int tighten_amount = 4;  // amount to tighten curves
        
        vec N;
        if( c%3 == 0 )
        {
            N = M.getCornerNormal(c,tighten_amount,true); // compute the vertex normal for every other other corner 
        }
        else
        {
            N = M.getCornerNormal(c,tighten_amount,false); // compute the negative vertex normal for every other corner
        }
        
        
        //N.show(A);  // show the normal
      
         A.addVec(N); // push A location up to Normal value
      
        // end of Normal computing code
    
          
          /*  Hide original green blue code
          stroke(green); 
          showEdge(A,C); 
          
          stroke(red); 
          showEdge(A,B); 
          */
      
          vec ux = new vec(3,0,0);  // unit vectors
          vec uy = new vec(0,3,0);
          vec uz = new vec(0,0,3);
      
      
          // now that we have points A,C,B, we'll make a bezier curve from them:
          strokeWeight(1);
          pt current;
          pt previous = B;
          for (float s=0; s<=1.1; s=s+0.1 )
          {
              // Draw ORIGINAL Spine Curves
              current = Bez(B, A, C, s);  
              
              stroke(orange); 
              showEdge(previous,current);
             
              //---------------------------------
              // Draw actra spline lines
             
              stroke(green); 
              previous.addVec(uz);
              current.addVec(uz);
              showEdge(previous,current);
             
              stroke(red); 
              previous.addVec(ux);
              current.addVec(ux);
              showEdge(previous,current);
              
              stroke(blue); 
              previous.addVec(uy);
              current.addVec(uy);
              showEdge(previous,current);

              // revert points back to previous states
              previous.subVec(uz);
              current.subVec(uz);
              
              previous.subVec(ux);
              current.subVec(ux);
              
              previous.subVec(uy);
              current.subVec(uy);
              
              //////////////////----------------
              
              previous = current; 
          }
      
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

  int path_length = 1000;
  
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



// bezier function calls

pt Bez(pt A, pt B, pt C, float s)
{
  pt ret = new pt();
  
  pt L1 = L(A,s,B);
  pt L2 = L(B,s,C);
  
  ret = L(L1,s,L2);
  
  return ret;
}



pt Bez(pt A, pt B, pt C, pt D, float s)
{
  pt ret = new pt();
  
  pt L1 = Bez(A,B,C,s); // use the three param bez
  pt L2 = Bez(B,C,D,s);
  
  ret = L(L1,s,L2);
  
  return ret;
}



pt Bez(pt A, pt B, pt C, pt D, pt E, float s)
{
  pt ret = new pt();
  
  pt L1 = Bez(A,B,C,D,s); // use the four param bez
  pt L2 = Bez(B,C,D,E,s);
  
  ret = L(L1,s,L2);
  
  return ret;
}
