/***************************************
// Vanshika Tanwar
//Test Bench : tb_dvsd_cmp.v
//***************************************
`timescale 1ns / 1ps

module tb_dvsd_cmp;

    // Inputs
    reg [3:0] A_in;
    reg [3:0] B_in;

    // Outputs
    //Declarations of internal wire
    wire less_than;    
    wire equal_to;
    wire greater_than;

    // Instantiate the Unit Under Test (UUT)
    dvsd_cmp uut (
        .A_in(A_in),
        .B_in(B_in),
        .less_than(less_than),
        .equal_to(equal_to),
        .greater_than(greater_than)
    );

    initial begin
    //dump file
    $dumpfile("tb_dvsd_cmp.vcd");                                        
    $dumpvars(0,tb_dvsd_cmp);
    //Applying input values
        A_in = 1000;    
        B_in = 1001;    
        #100;

        A_in = 0010;    
        B_in = 1110;    
        #100;

        A_in = 1010;    
        B_in = 1010;      
        #100;

        A_in = 0111;      
        B_in = 0110;      
        #100;

        A_in = 1011;        
        B_in = 1111;          
        #100;

        A_in = 0011;        
        B_in = 1101;        
        #100;

        A_in = 1111;        
        B_in = 1111;          
        #100;

        A_in = 0001;          
        B_in = 1100;          
        #100;

        A_in = 0101;            
        B_in = 0100;                      
        #100;

        A_in = 0110;            
        B_in = 1001;                      
        #100;

        A_in = 0000;            
        B_in = 0000;                      
        #100;

        A_in = 1100;            
        B_in = 0011;                      
        #100;
        
        A_in = 1000;    
        B_in = 1001;    
        #100;

        A_in = 0010;    
        B_in = 1110;    
        #100;

        A_in = 1010;    
        B_in = 1010;      
        #100;

        A_in = 0111;      
        B_in = 0110;      
        #100;

        A_in = 1011;        
        B_in = 1111;          
        #100;

        A_in = 0011;        
        B_in = 1101;        
        #100;

        A_in = 1111;        
        B_in = 1111;          
        #100;

        A_in = 0001;          
        B_in = 1100;          
        #100;

        A_in = 0101;            
        B_in = 0100;                      
        #100;

        A_in = 0110;            
        B_in = 1001;                      
        #100;

        A_in = 0000;            
        B_in = 0000;                      
        #100;

        A_in = 1100;            
        B_in = 0011;                      
        #100;
        
        A_in = 1000;    
        B_in = 1001;    
        #100;

        A_in = 0010;    
        B_in = 1110;    
        #100;

        A_in = 1010;    
        B_in = 1010;      
        #100;

        A_in = 0111;      
        B_in = 0110;      
        #100;

        A_in = 1011;        
        B_in = 1111;          
        #100;

        A_in = 0011;        
        B_in = 1101;        
        #100;

        A_in = 1111;        
        B_in = 1111;          
        #100;

        A_in = 0001;          
        B_in = 1100;          
        #100;

        A_in = 0101;            
        B_in = 0100;                      
        #100;

        A_in = 0110;            
        B_in = 1001;                      
        #100;

        A_in = 0000;            
        B_in = 0000;                      
        #100;

        A_in = 1100;            
        B_in = 0011;                      
        #100;
        
        A_in = 1000;    
        B_in = 1001;    
        #100;

        A_in = 0010;    
        B_in = 1110;    
        #100;

        A_in = 1010;    
        B_in = 1010;      
        #100;

        A_in = 0111;      
        B_in = 0110;      
        #100;

        A_in = 1011;        
        B_in = 1111;          
        #100;

        A_in = 0011;        
        B_in = 1101;        
        #100;

        A_in = 1111;        
        B_in = 1111;          
        #100;

        A_in = 0001;          
        B_in = 1100;          
        #100;

        A_in = 0101;            
        B_in = 0100;                      
        #100;

        A_in = 0110;            
        B_in = 1001;                      
        #100;

        A_in = 0000;            
        B_in = 0000;                      
        #100;

        A_in = 1100;            
        B_in = 0011;                      
        #100;
        
        A_in = 1000;    
        B_in = 1001;    
        #100;

        A_in = 0010;    
        B_in = 1110;    
        #100;

        A_in = 1010;    
        B_in = 1010;      
        #100;

        A_in = 0111;      
        B_in = 0110;      
        #100;

        A_in = 1011;        
        B_in = 1111;          
        #100;

        A_in = 0011;        
        B_in = 1101;        
        #100;

        A_in = 1111;        
        B_in = 1111;          
        #100;

        A_in = 0001;          
        B_in = 1100;          
        #100;

        A_in = 0101;            
        B_in = 0100;                      
        #100;

        A_in = 0110;            
        B_in = 1001;                      
        #100;

        A_in = 0000;            
        B_in = 0000;                      
        #100;

        A_in = 1100;            
        B_in = 0011;                      
        #100;
        
        A_in = 1000;    
        B_in = 1001;    
        #100;

        A_in = 0010;    
        B_in = 1110;    
        #100;

        A_in = 1010;    
        B_in = 1010;      
        #100;

        A_in = 0111;      
        B_in = 0110;      
        #100;

        A_in = 1011;        
        B_in = 1111;          
        #100;

        A_in = 0011;        
        B_in = 1101;        
        #100;

        A_in = 1111;        
        B_in = 1111;          
        #100;

        A_in = 0001;          
        B_in = 1100;          
        #100;

        A_in = 0101;            
        B_in = 0100;                      
        #100;

        A_in = 0110;            
        B_in = 1001;                      
        #100;

        A_in = 0000;            
        B_in = 0000;                      
        #100;

        A_in = 1100;            
        B_in = 0011;                      
        #100;
    end
     
endmodule
