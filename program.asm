; Program code for both modes of autoincrement addressing (direct and indirect)
        $ADR 0000h;
        ADI 1;
        STA 0B0Fh;
        LDA 0AF1h;
        ANI 00000001b;
        JZ pryam;
        JNZ kosv;
pryam:  
        LDA 0B01h;
        RRC;
        ANI 01111111b;
        MOV C,A;
        LDA 0B00h;
        ANI 10000000b;
        JZ plus1;
        JNZ minus1;
plus1:  
        LDA 0B00h
        RRC;
        JC carry1;
        JNC nocarry1;
carry1: 
        ANI 01111111b;
        STA 0B04h;
        MOV A,C;
        ORI 10000000b;
        STA 0B05h;
        JMP end;
nocarry1: 
        STA 0B04h;
        MOV A,C;
        STA 0B05h;
        JMP end;
minus1: 
        LDA 0B00h; 
        RRC;
        JC carry2;
        JNC nocarry2;
carry2: 
        STA 0B04h;
        MOV A,C;
        ORI 10000000b;
        STA 0B05h;
        JMP end;
nocarry2: 
        ORI 10000000b;
        STA 0B04h;
        MOV A,C;
        STA 0B05h;
        JMP end;
kosv:   
        LDA 0B00h;
        MOV D,A;
        LDA 0B01h;
        MOV E,A;
        ANI 00000000b;
        ADI 1;
        STA 0B0Dh;
        LDAX D; 
        MOV B,A;
        LDA 0B02h;
        MOV D,A;
        LDA 0B03h;
        MOV E,A;
        ANI 00000000b;
        ADI 00000010b;
        STA 0B0Dh;
        LDAX D; 
        RRC;
        ANI 01111111b;
        MOV C,A;
        MOV A,B;
        ANI 10000000b;
        JZ plus2;
        JNZ minus2;
plus2:  
        MOV A,B;
        RRC;
        JC carry3;
        JNC nocarry3;
carry3: 
        ANI 01111111b;
        STA 0B04h;
        MOV A,C;
        ORI 10000000b;
        STA 0B05h;
        JMP end;
nocarry3: 
        STA 0B04h;
        MOV A,C;
        STA 0B05h;
        JMP end;
minus2: 
        MOV A,B; 
        RRC;
        JC carry4;
        JNC nocarry4;
carry4: 
        STA 0B04h;
        MOV A,C;
        ORI 10000000b;
        STA 0B05h;
        JMP end;
nocarry4: 
        ORI 10000000b;
        STA 0B04h;
        MOV A,C;
        STA 0B05h;
        JMP end;
end:    
        HLT;