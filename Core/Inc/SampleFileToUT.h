#ifndef INC_SAMPLEFILETOUT_H_
#define INC_SAMPLEFILETOUT_H_

#include "stdint.h"
#include "AnotherSampleFile.h"

void FakeUartPrintInfo(uint8_t a, char* c);
void FakeI2cInit(FakeStructHanldeI2c *I2cHandler, void (*ReadingDataEndCB)(uint16_t));
void ReadI2cSlaveDataRegister(FakeStructHanldeI2c *I2cHandler, uint8_t *RegNum, uint8_t *DataRead);
int validateData(FakeStructHanldeI2c *I2cHandler, uint8_t *Data, uint8_t len);

#endif /* INC_TSOP2236_T_H_ */