#ifndef UNCONTENDED_H
#define UNCONTENDED_H

//UNCONTENDED RAM

unsigned char multiply2numbers (unsigned char A, unsigned char B)
{
	return A * B;
}

void enable_interupts (void)
{
    __asm
    ei
    __endasm
}

void disable_interupts (void)
{
    __asm
    di
    __endasm
}

void ZX0_decompress (unsigned int destination, unsigned int source)
{
    //  HL: source address (compressed data)
    //  DE: destination address (decompressing)
    zx0_destination = destination;
    zx0_source = source;
    dzx0_turbo();
}

void key_test (void)
{
    if (in_key_pressed( IN_KEY_SCANCODE_1 ))
    {
        disable_interupts();
        PLY_AKG_STOP();
        akg_song = 0;//choose song 0
        ARKOS2_Setup();//attention new
        enable_interupts();
    }
    if (in_key_pressed( IN_KEY_SCANCODE_2 ))
    {
        disable_interupts();
        PLY_AKG_STOP();
        akg_song = 1;//choose song 1
        ARKOS2_Setup();//attention new
        enable_interupts();
    }

}

void pauseLoop (unsigned long length)//attention changed
{
    for(pauseTemp = 0; pauseTemp < length; pauseTemp++)
    {
        key_test();
    }
}

void showScreen1(void)
{
    //attention new
    disable_interupts();
    bank_switch (1);//attention new
    ZX0_decompress (16384, &screen1);
    bank_switch (0);//attention new
    enable_interupts();
    pauseLoop (100000);
}

void showScreen2(void)
{
    //attention new
    disable_interupts();
    bank_switch (1);//attention new
    ZX0_decompress (16384, &screen2);
    bank_switch (0);//attention new
    enable_interupts();
    pauseLoop (100000);
}

void showScreen3(void)
{
    //attention new
    disable_interupts();
    bank_switch (1);//attention new
    ZX0_decompress (16384, &screen3);
    bank_switch (0);//attention new
    enable_interupts();
    pauseLoop (100000);
}

void showScreen4(void)
{
    //attention new
    disable_interupts();
    bank_switch (1);//attention new
    ZX0_decompress (16384, &screen4);
    bank_switch (0);//attention new
    enable_interupts();
    pauseLoop (100000);
}

void showScreen5(void)
{
    //attention new
    disable_interupts();
    bank_switch (3);//attention new
    ZX0_decompress (16384, &screen5);
    bank_switch (0);//attention new
    enable_interupts();
    pauseLoop (100000);
}
}

void showScreen6(void)
{
    //attention new
    disable_interupts();
    bank_switch (4);//attention new
    ZX0_decompress (16384, &screen6);
    bank_switch (0);//attention new
    enable_interupts();
    pauseLoop (100000);
}

void showScreen7(void)
{
    //attention new
    disable_interupts();
    bank_switch (6);//attention new
    ZX0_decompress (16384, &screen7);
    bank_switch (0);//attention new
    enable_interupts();
    pauseLoop (100000);
}


#endif
