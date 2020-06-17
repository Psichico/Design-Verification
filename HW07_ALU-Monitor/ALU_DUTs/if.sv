
interface alu_if(input logic clk, input logic rst); //not a good practice, but lets see what happens

logic pushin,ci; //inputs here
logic stopout; //output

logic [1:0] ctl; 
logic [7:0] a;
logic [7:0] b;

logic ci;
logic pushout; //output
logic cout; //output
logic [7:0] z; //output
logic stopin;



endinterface : alu_if
