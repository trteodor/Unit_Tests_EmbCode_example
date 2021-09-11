#ifndef INC_ANOTHERSAMPLEFILE_H_
#define INC_ANOTHERSAMPLEFILE_H_
#include "stdint.h"

#define UNUSED(X) (void)X      /* To avoid gcc/g++ warnings */

typedef enum
{
FakeI2cNotReady,
FakeI2cStateOk,
FakeI2cError,
FakeI2cSampling,
FakeI2cDataReady,
}FakeI2cEnumState;


typedef struct
{
    FakeI2cEnumState State;
    int arg1;
    void (*ReadingDataEndCallBack)(uint16_t);
}FakeStructHanldeI2c;

void FakeUartSendData(uint8_t *Data, uint8_t size);
FakeI2cEnumState FakeI2C_TakeState(FakeStructHanldeI2c *I2cHandler);
FakeI2cEnumState FakeI2cReadData(uint8_t DevAddr, uint8_t RegNum,uint8_t *DataRead, uint8_t size);

#endif /* INC_TSOP2236_T_H_ */