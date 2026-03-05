#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/BMS_LV.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/BMS_LV.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../src/config/default/peripheral/adc/plib_adc.c ../src/config/default/peripheral/can/plib_can1.c ../src/config/default/peripheral/clk/plib_clk.c ../src/config/default/peripheral/evic/plib_evic.c ../src/config/default/peripheral/gpio/plib_gpio.c ../src/config/default/peripheral/power/plib_power.c ../src/config/default/peripheral/rcon/plib_rcon.c ../src/config/default/peripheral/spi/spi_master/plib_spi2_master.c ../src/config/default/peripheral/uart/plib_uart1.c ../src/config/default/peripheral/wdt/plib_wdt.c ../src/config/default/stdio/xc32_monitor.c ../src/config/default/initialization.c ../src/config/default/interrupts.c ../src/config/default/exceptions.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MemMang/heap_4.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MPLAB/PIC32MX/port.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MPLAB/PIC32MX/port_asm.S C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/timers.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/event_groups.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/list.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/queue.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/stream_buffer.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/tasks.c ../src/main.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/include/error_leds.c C:/Users/adria/MPLABXProjects/BMS_LV.X/fsm/fsm.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/include/fsm_error_leds.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/60163342/plib_adc.o ${OBJECTDIR}/_ext/60165182/plib_can1.o ${OBJECTDIR}/_ext/60165520/plib_clk.o ${OBJECTDIR}/_ext/1865200349/plib_evic.o ${OBJECTDIR}/_ext/1865254177/plib_gpio.o ${OBJECTDIR}/_ext/1996599795/plib_power.o ${OBJECTDIR}/_ext/1865569570/plib_rcon.o ${OBJECTDIR}/_ext/298189674/plib_spi2_master.o ${OBJECTDIR}/_ext/1865657120/plib_uart1.o ${OBJECTDIR}/_ext/60184501/plib_wdt.o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ${OBJECTDIR}/_ext/1171490990/initialization.o ${OBJECTDIR}/_ext/1171490990/interrupts.o ${OBJECTDIR}/_ext/1171490990/exceptions.o ${OBJECTDIR}/_ext/519438381/heap_4.o ${OBJECTDIR}/_ext/428457472/port.o ${OBJECTDIR}/_ext/428457472/port_asm.o ${OBJECTDIR}/_ext/1489609866/timers.o ${OBJECTDIR}/_ext/1489609866/event_groups.o ${OBJECTDIR}/_ext/1489609866/list.o ${OBJECTDIR}/_ext/1489609866/queue.o ${OBJECTDIR}/_ext/1489609866/stream_buffer.o ${OBJECTDIR}/_ext/1489609866/tasks.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/907408349/error_leds.o ${OBJECTDIR}/_ext/1895429688/fsm.o ${OBJECTDIR}/_ext/907408349/fsm_error_leds.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/60163342/plib_adc.o.d ${OBJECTDIR}/_ext/60165182/plib_can1.o.d ${OBJECTDIR}/_ext/60165520/plib_clk.o.d ${OBJECTDIR}/_ext/1865200349/plib_evic.o.d ${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d ${OBJECTDIR}/_ext/1996599795/plib_power.o.d ${OBJECTDIR}/_ext/1865569570/plib_rcon.o.d ${OBJECTDIR}/_ext/298189674/plib_spi2_master.o.d ${OBJECTDIR}/_ext/1865657120/plib_uart1.o.d ${OBJECTDIR}/_ext/60184501/plib_wdt.o.d ${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d ${OBJECTDIR}/_ext/1171490990/initialization.o.d ${OBJECTDIR}/_ext/1171490990/interrupts.o.d ${OBJECTDIR}/_ext/1171490990/exceptions.o.d ${OBJECTDIR}/_ext/519438381/heap_4.o.d ${OBJECTDIR}/_ext/428457472/port.o.d ${OBJECTDIR}/_ext/428457472/port_asm.o.d ${OBJECTDIR}/_ext/1489609866/timers.o.d ${OBJECTDIR}/_ext/1489609866/event_groups.o.d ${OBJECTDIR}/_ext/1489609866/list.o.d ${OBJECTDIR}/_ext/1489609866/queue.o.d ${OBJECTDIR}/_ext/1489609866/stream_buffer.o.d ${OBJECTDIR}/_ext/1489609866/tasks.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d ${OBJECTDIR}/_ext/907408349/error_leds.o.d ${OBJECTDIR}/_ext/1895429688/fsm.o.d ${OBJECTDIR}/_ext/907408349/fsm_error_leds.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/60163342/plib_adc.o ${OBJECTDIR}/_ext/60165182/plib_can1.o ${OBJECTDIR}/_ext/60165520/plib_clk.o ${OBJECTDIR}/_ext/1865200349/plib_evic.o ${OBJECTDIR}/_ext/1865254177/plib_gpio.o ${OBJECTDIR}/_ext/1996599795/plib_power.o ${OBJECTDIR}/_ext/1865569570/plib_rcon.o ${OBJECTDIR}/_ext/298189674/plib_spi2_master.o ${OBJECTDIR}/_ext/1865657120/plib_uart1.o ${OBJECTDIR}/_ext/60184501/plib_wdt.o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ${OBJECTDIR}/_ext/1171490990/initialization.o ${OBJECTDIR}/_ext/1171490990/interrupts.o ${OBJECTDIR}/_ext/1171490990/exceptions.o ${OBJECTDIR}/_ext/519438381/heap_4.o ${OBJECTDIR}/_ext/428457472/port.o ${OBJECTDIR}/_ext/428457472/port_asm.o ${OBJECTDIR}/_ext/1489609866/timers.o ${OBJECTDIR}/_ext/1489609866/event_groups.o ${OBJECTDIR}/_ext/1489609866/list.o ${OBJECTDIR}/_ext/1489609866/queue.o ${OBJECTDIR}/_ext/1489609866/stream_buffer.o ${OBJECTDIR}/_ext/1489609866/tasks.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/907408349/error_leds.o ${OBJECTDIR}/_ext/1895429688/fsm.o ${OBJECTDIR}/_ext/907408349/fsm_error_leds.o

# Source Files
SOURCEFILES=../src/config/default/peripheral/adc/plib_adc.c ../src/config/default/peripheral/can/plib_can1.c ../src/config/default/peripheral/clk/plib_clk.c ../src/config/default/peripheral/evic/plib_evic.c ../src/config/default/peripheral/gpio/plib_gpio.c ../src/config/default/peripheral/power/plib_power.c ../src/config/default/peripheral/rcon/plib_rcon.c ../src/config/default/peripheral/spi/spi_master/plib_spi2_master.c ../src/config/default/peripheral/uart/plib_uart1.c ../src/config/default/peripheral/wdt/plib_wdt.c ../src/config/default/stdio/xc32_monitor.c ../src/config/default/initialization.c ../src/config/default/interrupts.c ../src/config/default/exceptions.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MemMang/heap_4.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MPLAB/PIC32MX/port.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MPLAB/PIC32MX/port_asm.S C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/timers.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/event_groups.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/list.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/queue.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/stream_buffer.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/tasks.c ../src/main.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/include/error_leds.c C:/Users/adria/MPLABXProjects/BMS_LV.X/fsm/fsm.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/include/fsm_error_leds.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/BMS_LV.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX795F512L
MP_LINKER_FILE_OPTION=,--script="..\src\config\default\p32MX795F512L.ld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/428457472/port_asm.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MPLAB/PIC32MX/port_asm.S  .generated_files/flags/default/628941cc2b6f49a0e9ae511ac6a14428ae755857 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/428457472" 
	@${RM} ${OBJECTDIR}/_ext/428457472/port_asm.o.d 
	@${RM} ${OBJECTDIR}/_ext/428457472/port_asm.o 
	@${RM} ${OBJECTDIR}/_ext/428457472/port_asm.o.ok ${OBJECTDIR}/_ext/428457472/port_asm.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/428457472/port_asm.o.d"  -o ${OBJECTDIR}/_ext/428457472/port_asm.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MPLAB/PIC32MX/port_asm.S  -DXPRJ_default=$(CND_CONF)    -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/428457472/port_asm.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,-I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/_ext/428457472/port_asm.o.d" "${OBJECTDIR}/_ext/428457472/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/_ext/428457472/port_asm.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MPLAB/PIC32MX/port_asm.S  .generated_files/flags/default/95cd7610a591ff97eaec702d700e9f4fa26f4261 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/428457472" 
	@${RM} ${OBJECTDIR}/_ext/428457472/port_asm.o.d 
	@${RM} ${OBJECTDIR}/_ext/428457472/port_asm.o 
	@${RM} ${OBJECTDIR}/_ext/428457472/port_asm.o.ok ${OBJECTDIR}/_ext/428457472/port_asm.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/428457472/port_asm.o.d"  -o ${OBJECTDIR}/_ext/428457472/port_asm.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MPLAB/PIC32MX/port_asm.S  -DXPRJ_default=$(CND_CONF)    -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/428457472/port_asm.o.asm.d",--gdwarf-2,-I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/_ext/428457472/port_asm.o.d" "${OBJECTDIR}/_ext/428457472/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/60163342/plib_adc.o: ../src/config/default/peripheral/adc/plib_adc.c  .generated_files/flags/default/a58561f0d4775835975da7be3e2ae0b7b051e2a2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60163342" 
	@${RM} ${OBJECTDIR}/_ext/60163342/plib_adc.o.d 
	@${RM} ${OBJECTDIR}/_ext/60163342/plib_adc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/60163342/plib_adc.o.d" -o ${OBJECTDIR}/_ext/60163342/plib_adc.o ../src/config/default/peripheral/adc/plib_adc.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60165182/plib_can1.o: ../src/config/default/peripheral/can/plib_can1.c  .generated_files/flags/default/553d612a09f6ce2823e35d208f203d72cdf0c995 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60165182" 
	@${RM} ${OBJECTDIR}/_ext/60165182/plib_can1.o.d 
	@${RM} ${OBJECTDIR}/_ext/60165182/plib_can1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/60165182/plib_can1.o.d" -o ${OBJECTDIR}/_ext/60165182/plib_can1.o ../src/config/default/peripheral/can/plib_can1.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60165520/plib_clk.o: ../src/config/default/peripheral/clk/plib_clk.c  .generated_files/flags/default/650e4ab7f092f425a217d37979ef99e5ae001cb0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60165520" 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/60165520/plib_clk.o.d" -o ${OBJECTDIR}/_ext/60165520/plib_clk.o ../src/config/default/peripheral/clk/plib_clk.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865200349/plib_evic.o: ../src/config/default/peripheral/evic/plib_evic.c  .generated_files/flags/default/4edb4e3f8c9f732bb00b3694db8928ec1daeb282 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865200349" 
	@${RM} ${OBJECTDIR}/_ext/1865200349/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865200349/plib_evic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1865200349/plib_evic.o.d" -o ${OBJECTDIR}/_ext/1865200349/plib_evic.o ../src/config/default/peripheral/evic/plib_evic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865254177/plib_gpio.o: ../src/config/default/peripheral/gpio/plib_gpio.c  .generated_files/flags/default/38ffc3669d855429dc1445a341b18cb6180f286a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865254177" 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/1865254177/plib_gpio.o ../src/config/default/peripheral/gpio/plib_gpio.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1996599795/plib_power.o: ../src/config/default/peripheral/power/plib_power.c  .generated_files/flags/default/649682d665654a0f0d9634cf0cfeed31180da21d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1996599795" 
	@${RM} ${OBJECTDIR}/_ext/1996599795/plib_power.o.d 
	@${RM} ${OBJECTDIR}/_ext/1996599795/plib_power.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1996599795/plib_power.o.d" -o ${OBJECTDIR}/_ext/1996599795/plib_power.o ../src/config/default/peripheral/power/plib_power.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865569570/plib_rcon.o: ../src/config/default/peripheral/rcon/plib_rcon.c  .generated_files/flags/default/51b448d6b59a4d2403a3b50a43b486f0adf75cc3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865569570" 
	@${RM} ${OBJECTDIR}/_ext/1865569570/plib_rcon.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865569570/plib_rcon.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1865569570/plib_rcon.o.d" -o ${OBJECTDIR}/_ext/1865569570/plib_rcon.o ../src/config/default/peripheral/rcon/plib_rcon.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/298189674/plib_spi2_master.o: ../src/config/default/peripheral/spi/spi_master/plib_spi2_master.c  .generated_files/flags/default/ec01eb8f49491c3ff0bec05b75dbadb109ed8dfe .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/298189674" 
	@${RM} ${OBJECTDIR}/_ext/298189674/plib_spi2_master.o.d 
	@${RM} ${OBJECTDIR}/_ext/298189674/plib_spi2_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/298189674/plib_spi2_master.o.d" -o ${OBJECTDIR}/_ext/298189674/plib_spi2_master.o ../src/config/default/peripheral/spi/spi_master/plib_spi2_master.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865657120/plib_uart1.o: ../src/config/default/peripheral/uart/plib_uart1.c  .generated_files/flags/default/e8ab74ee1d780d64748dd97f3a05ca989698616c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865657120" 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1865657120/plib_uart1.o.d" -o ${OBJECTDIR}/_ext/1865657120/plib_uart1.o ../src/config/default/peripheral/uart/plib_uart1.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60184501/plib_wdt.o: ../src/config/default/peripheral/wdt/plib_wdt.c  .generated_files/flags/default/66f36ec3552171c4a1db73fcfb67567503411ce4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60184501" 
	@${RM} ${OBJECTDIR}/_ext/60184501/plib_wdt.o.d 
	@${RM} ${OBJECTDIR}/_ext/60184501/plib_wdt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/60184501/plib_wdt.o.d" -o ${OBJECTDIR}/_ext/60184501/plib_wdt.o ../src/config/default/peripheral/wdt/plib_wdt.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/163028504/xc32_monitor.o: ../src/config/default/stdio/xc32_monitor.c  .generated_files/flags/default/72d4d5d7a17cdae84d8131a834f990e1211746fa .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/163028504" 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ../src/config/default/stdio/xc32_monitor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/initialization.o: ../src/config/default/initialization.c  .generated_files/flags/default/f5f19dc4e799caaba46b9b15d0ebaa0e26c57387 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/initialization.o.d" -o ${OBJECTDIR}/_ext/1171490990/initialization.o ../src/config/default/initialization.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/interrupts.o: ../src/config/default/interrupts.c  .generated_files/flags/default/84100fc931565106e4b58c8d6d6b69c136d107f5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/interrupts.o.d" -o ${OBJECTDIR}/_ext/1171490990/interrupts.o ../src/config/default/interrupts.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/exceptions.o: ../src/config/default/exceptions.c  .generated_files/flags/default/3f551d17f0a32aa3136e033e95e534f1f30db203 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/exceptions.o.d" -o ${OBJECTDIR}/_ext/1171490990/exceptions.o ../src/config/default/exceptions.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/519438381/heap_4.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MemMang/heap_4.c  .generated_files/flags/default/84aacc760f1678de0abd23a405d10982952d9e43 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/519438381" 
	@${RM} ${OBJECTDIR}/_ext/519438381/heap_4.o.d 
	@${RM} ${OBJECTDIR}/_ext/519438381/heap_4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/519438381/heap_4.o.d" -o ${OBJECTDIR}/_ext/519438381/heap_4.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MemMang/heap_4.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/428457472/port.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MPLAB/PIC32MX/port.c  .generated_files/flags/default/fe11b0f5a1bd3ff8d5d807cd1e564da7787b3e2f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/428457472" 
	@${RM} ${OBJECTDIR}/_ext/428457472/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/428457472/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/428457472/port.o.d" -o ${OBJECTDIR}/_ext/428457472/port.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MPLAB/PIC32MX/port.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/timers.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/timers.c  .generated_files/flags/default/3fd10fc746f172a9862ec7d8a297bd1c5815bf94 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/timers.o.d" -o ${OBJECTDIR}/_ext/1489609866/timers.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/event_groups.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/event_groups.c  .generated_files/flags/default/6b9f060edaf947677aeded522d368cafc37f60cd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/event_groups.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/event_groups.o.d" -o ${OBJECTDIR}/_ext/1489609866/event_groups.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/event_groups.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/list.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/list.c  .generated_files/flags/default/e00c6c900d856c8d3b4401961792091e0d532334 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/list.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/list.o.d" -o ${OBJECTDIR}/_ext/1489609866/list.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/list.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/queue.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/queue.c  .generated_files/flags/default/784642974e6653b66d16e8ad04208a6bd0a59169 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/queue.o.d" -o ${OBJECTDIR}/_ext/1489609866/queue.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/queue.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/stream_buffer.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/stream_buffer.c  .generated_files/flags/default/d5f924d36986f3ea9b3bf5c6c3ce2da7da6b7230 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/stream_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/stream_buffer.o.d" -o ${OBJECTDIR}/_ext/1489609866/stream_buffer.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/stream_buffer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/tasks.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/tasks.c  .generated_files/flags/default/efdf68797315e3d82c21c3c961164ef57333478c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/tasks.o.d" -o ${OBJECTDIR}/_ext/1489609866/tasks.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/tasks.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/default/81f0de38adbf8299ea8c04ccdc242f4077b77bb7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/907408349/error_leds.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/include/error_leds.c  .generated_files/flags/default/2a4296d87e8ebad2b2d2334080c9d444e20667ec .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/907408349" 
	@${RM} ${OBJECTDIR}/_ext/907408349/error_leds.o.d 
	@${RM} ${OBJECTDIR}/_ext/907408349/error_leds.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/907408349/error_leds.o.d" -o ${OBJECTDIR}/_ext/907408349/error_leds.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/include/error_leds.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1895429688/fsm.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/fsm/fsm.c  .generated_files/flags/default/cb57a9f522c194e68958712bc6774201453493e1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1895429688" 
	@${RM} ${OBJECTDIR}/_ext/1895429688/fsm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1895429688/fsm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1895429688/fsm.o.d" -o ${OBJECTDIR}/_ext/1895429688/fsm.o C:/Users/adria/MPLABXProjects/BMS_LV.X/fsm/fsm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/907408349/fsm_error_leds.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/include/fsm_error_leds.c  .generated_files/flags/default/b77cf20cead79d1939db4c5b83bda699b227528c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/907408349" 
	@${RM} ${OBJECTDIR}/_ext/907408349/fsm_error_leds.o.d 
	@${RM} ${OBJECTDIR}/_ext/907408349/fsm_error_leds.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/907408349/fsm_error_leds.o.d" -o ${OBJECTDIR}/_ext/907408349/fsm_error_leds.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/include/fsm_error_leds.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/60163342/plib_adc.o: ../src/config/default/peripheral/adc/plib_adc.c  .generated_files/flags/default/8313c5bd3db100596e1d04d8a8bf21f4f974f335 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60163342" 
	@${RM} ${OBJECTDIR}/_ext/60163342/plib_adc.o.d 
	@${RM} ${OBJECTDIR}/_ext/60163342/plib_adc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/60163342/plib_adc.o.d" -o ${OBJECTDIR}/_ext/60163342/plib_adc.o ../src/config/default/peripheral/adc/plib_adc.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60165182/plib_can1.o: ../src/config/default/peripheral/can/plib_can1.c  .generated_files/flags/default/d28a22a18e95ec239ff687261aab1d2e4206556e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60165182" 
	@${RM} ${OBJECTDIR}/_ext/60165182/plib_can1.o.d 
	@${RM} ${OBJECTDIR}/_ext/60165182/plib_can1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/60165182/plib_can1.o.d" -o ${OBJECTDIR}/_ext/60165182/plib_can1.o ../src/config/default/peripheral/can/plib_can1.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60165520/plib_clk.o: ../src/config/default/peripheral/clk/plib_clk.c  .generated_files/flags/default/f46502822dd7304790fafd332d57e9cecae84be3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60165520" 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/60165520/plib_clk.o.d" -o ${OBJECTDIR}/_ext/60165520/plib_clk.o ../src/config/default/peripheral/clk/plib_clk.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865200349/plib_evic.o: ../src/config/default/peripheral/evic/plib_evic.c  .generated_files/flags/default/9dcd3d69d01d4a097f00acbd5a62bb1f8648bd74 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865200349" 
	@${RM} ${OBJECTDIR}/_ext/1865200349/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865200349/plib_evic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1865200349/plib_evic.o.d" -o ${OBJECTDIR}/_ext/1865200349/plib_evic.o ../src/config/default/peripheral/evic/plib_evic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865254177/plib_gpio.o: ../src/config/default/peripheral/gpio/plib_gpio.c  .generated_files/flags/default/c1593f5253aaf33dc4802afe3b611ec2a0dc34d4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865254177" 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/1865254177/plib_gpio.o ../src/config/default/peripheral/gpio/plib_gpio.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1996599795/plib_power.o: ../src/config/default/peripheral/power/plib_power.c  .generated_files/flags/default/fa43b609a8dd1b0f25e8b2234686dcedf0c9ed12 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1996599795" 
	@${RM} ${OBJECTDIR}/_ext/1996599795/plib_power.o.d 
	@${RM} ${OBJECTDIR}/_ext/1996599795/plib_power.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1996599795/plib_power.o.d" -o ${OBJECTDIR}/_ext/1996599795/plib_power.o ../src/config/default/peripheral/power/plib_power.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865569570/plib_rcon.o: ../src/config/default/peripheral/rcon/plib_rcon.c  .generated_files/flags/default/767540d2c1c25b7b24914d6ead8e190f980284eb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865569570" 
	@${RM} ${OBJECTDIR}/_ext/1865569570/plib_rcon.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865569570/plib_rcon.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1865569570/plib_rcon.o.d" -o ${OBJECTDIR}/_ext/1865569570/plib_rcon.o ../src/config/default/peripheral/rcon/plib_rcon.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/298189674/plib_spi2_master.o: ../src/config/default/peripheral/spi/spi_master/plib_spi2_master.c  .generated_files/flags/default/bab217716ba8ddb965e2e986e37fa7af552a9ca5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/298189674" 
	@${RM} ${OBJECTDIR}/_ext/298189674/plib_spi2_master.o.d 
	@${RM} ${OBJECTDIR}/_ext/298189674/plib_spi2_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/298189674/plib_spi2_master.o.d" -o ${OBJECTDIR}/_ext/298189674/plib_spi2_master.o ../src/config/default/peripheral/spi/spi_master/plib_spi2_master.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865657120/plib_uart1.o: ../src/config/default/peripheral/uart/plib_uart1.c  .generated_files/flags/default/955e8b30dbc4e9a6b807b5b2d168a70c5542821b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865657120" 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1865657120/plib_uart1.o.d" -o ${OBJECTDIR}/_ext/1865657120/plib_uart1.o ../src/config/default/peripheral/uart/plib_uart1.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60184501/plib_wdt.o: ../src/config/default/peripheral/wdt/plib_wdt.c  .generated_files/flags/default/f9ccfc14834aa8c119b016861e348d533a07606d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60184501" 
	@${RM} ${OBJECTDIR}/_ext/60184501/plib_wdt.o.d 
	@${RM} ${OBJECTDIR}/_ext/60184501/plib_wdt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/60184501/plib_wdt.o.d" -o ${OBJECTDIR}/_ext/60184501/plib_wdt.o ../src/config/default/peripheral/wdt/plib_wdt.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/163028504/xc32_monitor.o: ../src/config/default/stdio/xc32_monitor.c  .generated_files/flags/default/f812482302c6ae9181599ab3656aceb1e72b0368 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/163028504" 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ../src/config/default/stdio/xc32_monitor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/initialization.o: ../src/config/default/initialization.c  .generated_files/flags/default/15d07217f2759dd5ecc83154c6c3776cecf8f8a1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/initialization.o.d" -o ${OBJECTDIR}/_ext/1171490990/initialization.o ../src/config/default/initialization.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/interrupts.o: ../src/config/default/interrupts.c  .generated_files/flags/default/33cae72d7630398bdb005b5a3597fd38f327d5a6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/interrupts.o.d" -o ${OBJECTDIR}/_ext/1171490990/interrupts.o ../src/config/default/interrupts.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/exceptions.o: ../src/config/default/exceptions.c  .generated_files/flags/default/3ba6e9f07ae4b96ffc280f59b529f0e82dcc23d1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/exceptions.o.d" -o ${OBJECTDIR}/_ext/1171490990/exceptions.o ../src/config/default/exceptions.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/519438381/heap_4.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MemMang/heap_4.c  .generated_files/flags/default/e04ca12a73e9bd43a3339bbb4df4058b420677af .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/519438381" 
	@${RM} ${OBJECTDIR}/_ext/519438381/heap_4.o.d 
	@${RM} ${OBJECTDIR}/_ext/519438381/heap_4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/519438381/heap_4.o.d" -o ${OBJECTDIR}/_ext/519438381/heap_4.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MemMang/heap_4.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/428457472/port.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MPLAB/PIC32MX/port.c  .generated_files/flags/default/70e1f6328851f635e13dab743a400074b1886890 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/428457472" 
	@${RM} ${OBJECTDIR}/_ext/428457472/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/428457472/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/428457472/port.o.d" -o ${OBJECTDIR}/_ext/428457472/port.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MPLAB/PIC32MX/port.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/timers.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/timers.c  .generated_files/flags/default/928a52cf5f48921b808fbcbbfd219484486e37f3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/timers.o.d" -o ${OBJECTDIR}/_ext/1489609866/timers.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/event_groups.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/event_groups.c  .generated_files/flags/default/16f73fa289b4f699dbae7da47d29a5550d9c27de .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/event_groups.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/event_groups.o.d" -o ${OBJECTDIR}/_ext/1489609866/event_groups.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/event_groups.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/list.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/list.c  .generated_files/flags/default/88a549bb9aabf36e574620b51af0395dbf1a20bc .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/list.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/list.o.d" -o ${OBJECTDIR}/_ext/1489609866/list.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/list.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/queue.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/queue.c  .generated_files/flags/default/b671b2530634fb9c3e5c8fb4c2d979d05282155 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/queue.o.d" -o ${OBJECTDIR}/_ext/1489609866/queue.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/queue.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/stream_buffer.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/stream_buffer.c  .generated_files/flags/default/51962e6e11563c18b88a3fe46d5efa2be7cbdd1e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/stream_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/stream_buffer.o.d" -o ${OBJECTDIR}/_ext/1489609866/stream_buffer.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/stream_buffer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/tasks.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/tasks.c  .generated_files/flags/default/c86f5a28e71f6787dc2d4ea8c60f9728e1d803dd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/tasks.o.d" -o ${OBJECTDIR}/_ext/1489609866/tasks.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/tasks.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/default/f96b45a9bcfefcb86ece1bd1718ee55c675ae66c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/907408349/error_leds.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/include/error_leds.c  .generated_files/flags/default/79985afa1aed99d72878c420c888efbba23ec022 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/907408349" 
	@${RM} ${OBJECTDIR}/_ext/907408349/error_leds.o.d 
	@${RM} ${OBJECTDIR}/_ext/907408349/error_leds.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/907408349/error_leds.o.d" -o ${OBJECTDIR}/_ext/907408349/error_leds.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/include/error_leds.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1895429688/fsm.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/fsm/fsm.c  .generated_files/flags/default/1cd12212ff2715b64edc00e8285225ac57f3015f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1895429688" 
	@${RM} ${OBJECTDIR}/_ext/1895429688/fsm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1895429688/fsm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1895429688/fsm.o.d" -o ${OBJECTDIR}/_ext/1895429688/fsm.o C:/Users/adria/MPLABXProjects/BMS_LV.X/fsm/fsm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/907408349/fsm_error_leds.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/include/fsm_error_leds.c  .generated_files/flags/default/4a75a5776958bf4275ecba20478aea203e97b230 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/907408349" 
	@${RM} ${OBJECTDIR}/_ext/907408349/fsm_error_leds.o.d 
	@${RM} ${OBJECTDIR}/_ext/907408349/fsm_error_leds.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"fsm" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/907408349/fsm_error_leds.o.d" -o ${OBJECTDIR}/_ext/907408349/fsm_error_leds.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/include/fsm_error_leds.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/BMS_LV.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    ../src/config/default/p32MX795F512L.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/BMS_LV.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)      -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=512,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/BMS_LV.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   ../src/config/default/p32MX795F512L.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/BMS_LV.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=512,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/BMS_LV.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
