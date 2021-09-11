#include "AnotherSampleFile.h"

void FakeUartSendData(uint8_t *Data, uint8_t size)
{
        UNUSED(Data);
        UNUSED(size);
}

FakeI2cEnumState FakeI2C_TakeState(FakeStructHanldeI2c *I2cHandler)
{
    UNUSED(I2cHandler);
    return FakeI2cNotReady;
}

FakeI2cEnumState FakeI2cReadData(uint8_t DevAddr, uint8_t RegNum,uint8_t *DataRead, uint8_t size)
{
    UNUSED(DevAddr);
    UNUSED(RegNum);
    UNUSED(DataRead);
    UNUSED(size);

    return FakeI2cStateOk;
}