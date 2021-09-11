

SRC+= unit-tests/AnotherSampleFileToUT/test_ASFile.c   
SRC+= unit-tests/AnotherSampleFileToUT/test_runnerASFile.c 
SRC+= unit-tests/AnotherSampleFileToUT/test_main.c 


SRC+= Core/Src/AnotherSampleFile.c


INC_DIR+= -ICore/Inc/ 

 

COVERAGE_SOURCEDIR :=
COVERAGE_SOURCEDIR +=Core/Src/


MOCKED_HEADER +=  Core/Inc/AnotherSampleFile.h
MOCKED_HEADER +=  Core/Inc/SampleFileToUT.h


MOCKED_SOURCE +=  build/UnitTests/cmock/mock_SampleFileToUT.c


SRC+= $(MOCKED_SOURCE)
