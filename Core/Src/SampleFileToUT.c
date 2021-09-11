#include "AnotherSampleFile.h"
#include "SampleFileToUT.h"


void FakeUartPrintInfo(uint8_t a, char* c)
{
   if(a==2)
   {
       uint8_t DataSend[]="A is Equal 2";
       FakeUartSendData(DataSend, sizeof(DataSend));
   }
   else
   {
       c[0]=1;
       FakeUartSendData((uint8_t*)c, sizeof(c));
   }

}

void FakeI2cInit(FakeStructHanldeI2c *I2cHandler, void (*ReadingDataEndCallB)(uint16_t))
{
    if( FakeI2C_TakeState(I2cHandler) == FakeI2cNotReady)
    {
        I2cHandler->ReadingDataEndCallBack=ReadingDataEndCallB;
        I2cHandler->State= FakeI2cStateOk;
    }
    else
    {
        I2cHandler->State = FakeI2cError;
    }
}

void ReadI2cSlaveDataRegister(FakeStructHanldeI2c *I2cHandler, uint8_t *RegNum, uint8_t *DataRead)
{
    if( FakeI2C_TakeState(I2cHandler)== FakeI2cStateOk)
    {
      FakeI2cReadData( (0x26 << 1 ), *RegNum, DataRead, 4);
    }
}

int validateData(FakeStructHanldeI2c *I2cHandler, uint8_t *Data, uint8_t len)
{
    UNUSED(I2cHandler);
    uint8_t *lData=Data;
    for(int i=0; i<len; i++)
    {
    lData[i]= *(lData+1);
    }
    return 1;
}