#include "unity.h"
#include "mathematicFunc.h"

volatile uint8_t value = 0;

void setUp(void)
{
	value = 1;
	printf("\nsetUpStart\n");
}

void addFuntion_Test_CheckIfProperResponse(void)
{
  TEST_ASSERT_EQUAL(8, addFunction(2, 5));
  TEST_ASSERT_EQUAL(13, addFunction(5, 8));
}

void multiplicationFunction_Test_CheckIfProperResponse(void)
{
  TEST_ASSERT_EQUAL(4, multiplicationFunction(2, 2));
  TEST_ASSERT_EQUAL(64, multiplicationFunction(8, 8));
}

void gpioPinSet_Test_CheckIfProperPinSet(void)
{
	setLedsOnBoard(GPIO_PIN_SET);
	TEST_ASSERT_TRUE(HAL_GPIO_ReadPin(GPIOD, GPIO_PIN_12) == GPIO_PIN_SET);
	TEST_ASSERT_TRUE(HAL_GPIO_ReadPin(GPIOD, GPIO_PIN_13) == GPIO_PIN_SET);
	TEST_ASSERT_TRUE(HAL_GPIO_ReadPin(GPIOD, GPIO_PIN_14) == GPIO_PIN_SET);
	TEST_ASSERT_TRUE(HAL_GPIO_ReadPin(GPIOD, GPIO_PIN_15) == GPIO_PIN_SET);
}

void gpioPinSet_Test_CheckIfProperPinReset(void)
{
	setLedsOnBoard(GPIO_PIN_RESET);
	TEST_ASSERT_TRUE(HAL_GPIO_ReadPin(GPIOD, GPIO_PIN_12) == GPIO_PIN_RESET);
	TEST_ASSERT_TRUE(HAL_GPIO_ReadPin(GPIOD, GPIO_PIN_13) == GPIO_PIN_RESET);
	TEST_ASSERT_TRUE(HAL_GPIO_ReadPin(GPIOD, GPIO_PIN_14) == GPIO_PIN_RESET);
	TEST_ASSERT_TRUE(HAL_GPIO_ReadPin(GPIOD, GPIO_PIN_15) == GPIO_PIN_RESET);
}

void tearDown(void)
{
	value = 0;
	printf("\nsetUpTearDown\n");
}
