module DSP48A1_directed_tb();

reg [17:0] A, B, D, BCIN;
reg [47:0] PCIN, C;
reg [7:0] OPMODE;
reg clk, CARRYIN;
reg RSTA, RSTB, RSTM, RSTP, RSTC, RSTD, RSTCARRYIN, RSTOPMODE;
reg CEA, CEB, CEM, CEP, CEC, CED, CECARRYIN, CEOPMODE;

wire [17:0] BCOUT;
wire [47:0] PCOUT, P;
wire [35:0] M;
wire CARRYOUT, CARRYOUTF;

DSP48A1 dut (
    .A(A), .B(B), .D(D), .C(C), .clk(clk), .CARRYIN(CARRYIN), .OPMODE(OPMODE), .BCIN(BCIN), .PCIN(PCIN),
    .RSTA(RSTA), .RSTB(RSTB), .RSTM(RSTM), .RSTP(RSTP), .RSTC(RSTC), .RSTD(RSTD), .RSTCARRYIN(RSTCARRYIN), .RSTOPMODE(RSTOPMODE),
    .CEA(CEA), .CEB(CEB), .CEM(CEM), .CEP(CEP), .CEC(CEC), .CED(CED), .CECARRYIN(CECARRYIN), .CEOPMODE(CEOPMODE),
    .BCOUT(BCOUT), .PCOUT(PCOUT), .P(P), .M(M), .CARRYOUT(CARRYOUT), .CARRYOUTF(CARRYOUTF)
);

initial begin
    clk=0;
    
    forever

    #1 clk=~clk;
end



initial begin
    // Initialize inputs
    A = 18'b101010101010101010;
    B = 18'b110011001100110011;
    D = 18'b111100001111000011;
    BCIN = 18'b010101010101010101;
    PCIN = 48'b001100110011001100110011001100110011001100110011;
    C = 48'b101010101010101010101010101010101010101010101010101;
    OPMODE = 8'b01010101;
    CARRYIN = 1;
    CEA = 1; CEB = 1; CEM = 1; CEP = 1; CEC = 1; CED = 1; CECARRYIN = 1; CEOPMODE = 1;

    // Apply reset
     RSTA = 1;
     RSTB = 1;
     RSTM = 1;
     RSTP = 1;
     RSTC = 1;
     RSTD = 1;
     RSTCARRYIN = 1;
     RSTOPMODE = 1;

     #100;

    // Release reset
     RSTA = 0;
     RSTB = 0;
     RSTM = 0;
     RSTP = 0;
     RSTC = 0;
     RSTD = 0;
     RSTCARRYIN = 0;
     RSTOPMODE = 0;

    #50; 

    // Test 1: Basic Addition
     A = 18'b111100001111000011;
     B = 18'b010101010101010101;
     OPMODE = 8'b00000001;
     $display("Test 1: Basic Addition");
     $display("A = %b, B = %b, OPMODE = %b, BCOUT = %b", A, B, OPMODE, BCOUT);
    
    #10;

    // Test 2: Basic Subtraction
     A = 18'b110011001100110011;
     B = 18'b001100110011001100;
     OPMODE = 8'b00000001;
     $display("Test 2: Basic Subtraction");
     $display("A = %b, B = %b, OPMODE = %b, BCOUT = %b", A, B, OPMODE, BCOUT);
    
    #10;

    // Test 3: Multiplication
     A = 18'b101010101010101010;
     B = 18'b010101010101010101;
     OPMODE = 8'b00001000;
     $display("Test 3: Multiplication");
     $display("A = %b, B = %b, OPMODE = %b, M = %b", A, B, OPMODE, M);
    
    #10;
 $stop;
end
endmodule