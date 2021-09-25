//***************************************
// Vanshika Tanwar
//Verilog file: dvsd_cmp.v
//***************************************
module dvsd_cmp(
        //Input A        
A_in,                                                                                      
        //Input B
B_in,                                                      
        //When A is less than B, it is high
less_than,                                                                                                                                  
        //When A is equal to B, it is high
equal_to,
        //When A is greater than B, it is high
greater_than                                                                                                                                                                                                                                                      
);
        //Declaration of Input Ports.
    input [3:0] A_in;
    input [3:0] B_in;
        //Declarations of Output Ports.
    output less_than;
    output equal_to;
    output greater_than ;
        //Internal variables
        //reg declarations
     reg less_than;
     reg equal_to;
     reg greater_than;
        //When the inputs  A or B are changed then execute this block
    always @(A_in or B_in)
 begin
        //This block checks if A is Greater than B, Greater than is high
       if(A_in > B_in)                              
           begin                                        
                      less_than = 4'b0;      
                      equal_to =4'b0;
                      greater_than = 4'b1;    
           end
        //This block checks if A is equal to B, Equal to is high
       else if(A_in == B_in)                    
           begin                            
                      less_than = 4'b0;
                      equal_to = 4'b1;
                      greater_than = 4'b0;    
           end
        //Otherwise -This block checks for A less than B, Less than is high          
       else                                                  
           begin                                                  
                      less_than = 4'b1;
                      equal_to = 4'b0;
                      greater_than =4'b0;
        end
end
        //End of a module
endmodule
