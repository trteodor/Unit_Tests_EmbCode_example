**_To download this repository tap in your command line:_**
* git clone --recursive https://github.com/trteodor/UnitTest_InEmbedded_Ex_OnSTM32F103RB_Unity_non-recmake
## Hello,
This project/ example was made for educational purposes. I wanted to learn how to use the "Unity" framework for unit testing. After completing this project / example, I know how to run unit tests, also in embedded systems! :) When I completed this project, I also got to know the makefile syntax a bit.

*http://www.throwtheswitch.org/unity


**_Video in which I explain a little more in a practical way about this project:_**

"Link"

In this video, I speak in Polish language

After familiarizing myself with the "makefile" syntax, **_I created my own build system_** for Unit Tests with "Unity"
* In my opinion, the created building system is very easy and convenient

Why I decide create my own build system? When I was able to use Ceedlink..
* I  wanted to get to know the makefile syntax and Ceedlink is not intuitive for me(Or I just got to know him too little). 

## Created compilation system, uses a non-recursive makefile and is fully independent
* Evry one tested file may be compilated totally independent! :) 
	* It may be benefits
* Support for Coverage report with gcovr

Now you can start your adventure! :) 


To compile this project i used:
* GNU Make 3.81
* ruby 2.7.4p191
* gcovr 5.0
* gcc 6.3.0
	* These programs obviously had to be in the ("PATH") path of environment variables
		* It means that it was possible to use this programs directly from the console

 **_Call "make" in this example project at him location to show this information:_**

	Call: make help    -show this information
	How Use it:
	1. call: make all    -To compile output files for Microcontroller
	Its default target generated by CubeMX so was Decided to dont modify it
	------------------------------------
	2. Call: make test-ra       -To start compilation or fully recompilation all unit-test
	3. Call: make test-s        -Only to rebuild source files and start unit tests
	4. Call: make coverage      -To refresh coverage report
	------------------------------------
	5. call: make clean-test    -To delete all test result
	6. call: make clean-docs    -Remove Docs Folder (currently contain only unit-tests coverage report)
	6. call: make clean         -Remove build Folder (Carefully)


The root of the makefile is obviously GNUmakefile. I used this name because CubeMX generates a "Makefile" and make start reading the GNUmakefile first (before "MakeFile") if exist (ref.[3] Chapter 3.2).

# Summary

The build system I have prepared may need to be modified. As I mentioned, this example was prepared solely for educational purposes

In this example i used STM32CubeMX to generate project template for STM32F103
* Of course, it is not necessary to use STM32CubeMX **_the build system for unit tests is independent._** STM32CubeMX was used only to create template project for microcontroller.

With "Unity" we can also Testing hardware it is also **very easy!** Inaf just redirect correctly the printf function. But prepared example by me (this repo) don't presentation this function. I added only examples files from [4] "stm32F4_UnitTest_HW_Example" to this repository, if you trying run unit test on Hardware it may help you :) But you can always refer to [1], everything is very well described there. In Unity repository are examples.. also in CMock repository we can find few examples.

* Everything takes time up free time ... :( ;)

# Sources:
* [1] http://www.throwtheswitch.org/unity
* [2] https://stackoverflow.com/questions/32532999/double-foreach-in-makepp/32535737#32535737
* [3] https://www.gnu.org/software/make/manual/make.pdf
* [4] https://elektronika327.blogspot.com/2019/07/stm32f4-unit-test-unity.html - Simple example how to do Tests directly on Hardware
* [5] https://drive.google.com/file/d/1cQthFvgZRi9WwH3EkqLLRv0-jYJlCnEa/view?usp=sharing Files from [4]
