pragma circom 2.0.0;

/*This circuit template checks that c is the multiplication of a and b.*/                     
 

template Multiplier2 () {  

   // Declaration of signals.  
   signal input A;  
   signal input B;  

   component and = AND();

   // Doing AND on A and B as in Diagram
   and.input1 <== A;
   and.input2 <== B;

   // output of and of A and B is stored in X
   signal X;
   X <== and.out;

   // Doing not of B as in Diagramnpm i 
   component not = NOT();
   not.input1 <== X;


   // output of not of B is stored in Y
   signal Y;
   Y <== not.out;

   // Doing OR on X and Y
   component or = OR();
   or.input1 <== X;
   or.input2 <== Y;
  
   //   This is our final output
   signal output Q;
   Q <== or.out;  
}

// Template for AND gate
template AND() {
  signal input input1;
  signal input input2;
  signal output out;

  out <== input1 * input2;
}

// Template for NOT gate
template NOT() {
  signal input input1;
  signal output out;

  out <== 1 - input1;
}

// Template for OR gate
template OR() {
  signal input input1;
  signal input input2;
  signal output out;

  out <== input1 + input2 - input1 * input2;
}

component main = Multiplier2();