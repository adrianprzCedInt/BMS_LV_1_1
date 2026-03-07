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
SOURCEFILES_QUOTED_IF_SPACED=../src/config/default/peripheral/adc/plib_adc.c ../src/config/default/peripheral/can/plib_can1.c ../src/config/default/peripheral/clk/plib_clk.c ../src/config/default/peripheral/evic/plib_evic.c ../src/config/default/peripheral/gpio/plib_gpio.c ../src/config/default/peripheral/power/plib_power.c ../src/config/default/peripheral/rcon/plib_rcon.c ../src/config/default/peripheral/spi/spi_master/plib_spi2_master.c ../src/config/default/peripheral/uart/plib_uart1.c ../src/config/default/peripheral/wdt/plib_wdt.c ../src/config/default/stdio/xc32_monitor.c ../src/config/default/initialization.c ../src/config/default/interrupts.c ../src/config/default/exceptions.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MemMang/heap_4.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MPLAB/PIC32MX/port.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MPLAB/PIC32MX/port_asm.S C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/timers.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/event_groups.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/list.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/queue.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/stream_buffer.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/tasks.c ../src/main.c C:/Users/adria/MPLABXProjects/BMS_LV.X/libs/fsm/fsm.c C:/Users/adria/MPLABXProjects/BMS_LV.X/app/fsm/fsm_error_leds.c C:/Users/adria/MPLABXProjects/BMS_LV.X/app/bms/bms_flags.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/60163342/plib_adc.o ${OBJECTDIR}/_ext/60165182/plib_can1.o ${OBJECTDIR}/_ext/60165520/plib_clk.o ${OBJECTDIR}/_ext/1865200349/plib_evic.o ${OBJECTDIR}/_ext/1865254177/plib_gpio.o ${OBJECTDIR}/_ext/1996599795/plib_power.o ${OBJECTDIR}/_ext/1865569570/plib_rcon.o ${OBJECTDIR}/_ext/298189674/plib_spi2_master.o ${OBJECTDIR}/_ext/1865657120/plib_uart1.o ${OBJECTDIR}/_ext/60184501/plib_wdt.o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ${OBJECTDIR}/_ext/1171490990/initialization.o ${OBJECTDIR}/_ext/1171490990/interrupts.o ${OBJECTDIR}/_ext/1171490990/exceptions.o ${OBJECTDIR}/_ext/519438381/heap_4.o ${OBJECTDIR}/_ext/428457472/port.o ${OBJECTDIR}/_ext/428457472/port_asm.o ${OBJECTDIR}/_ext/1489609866/timers.o ${OBJECTDIR}/_ext/1489609866/event_groups.o ${OBJECTDIR}/_ext/1489609866/list.o ${OBJECTDIR}/_ext/1489609866/queue.o ${OBJECTDIR}/_ext/1489609866/stream_buffer.o ${OBJECTDIR}/_ext/1489609866/tasks.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/410010953/fsm.o ${OBJECTDIR}/_ext/411002074/fsm_error_leds.o ${OBJECTDIR}/_ext/410998050/bms_flags.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/60163342/plib_adc.o.d ${OBJECTDIR}/_ext/60165182/plib_can1.o.d ${OBJECTDIR}/_ext/60165520/plib_clk.o.d ${OBJECTDIR}/_ext/1865200349/plib_evic.o.d ${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d ${OBJECTDIR}/_ext/1996599795/plib_power.o.d ${OBJECTDIR}/_ext/1865569570/plib_rcon.o.d ${OBJECTDIR}/_ext/298189674/plib_spi2_master.o.d ${OBJECTDIR}/_ext/1865657120/plib_uart1.o.d ${OBJECTDIR}/_ext/60184501/plib_wdt.o.d ${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d ${OBJECTDIR}/_ext/1171490990/initialization.o.d ${OBJECTDIR}/_ext/1171490990/interrupts.o.d ${OBJECTDIR}/_ext/1171490990/exceptions.o.d ${OBJECTDIR}/_ext/519438381/heap_4.o.d ${OBJECTDIR}/_ext/428457472/port.o.d ${OBJECTDIR}/_ext/428457472/port_asm.o.d ${OBJECTDIR}/_ext/1489609866/timers.o.d ${OBJECTDIR}/_ext/1489609866/event_groups.o.d ${OBJECTDIR}/_ext/1489609866/list.o.d ${OBJECTDIR}/_ext/1489609866/queue.o.d ${OBJECTDIR}/_ext/1489609866/stream_buffer.o.d ${OBJECTDIR}/_ext/1489609866/tasks.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d ${OBJECTDIR}/_ext/410010953/fsm.o.d ${OBJECTDIR}/_ext/411002074/fsm_error_leds.o.d ${OBJECTDIR}/_ext/410998050/bms_flags.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/60163342/plib_adc.o ${OBJECTDIR}/_ext/60165182/plib_can1.o ${OBJECTDIR}/_ext/60165520/plib_clk.o ${OBJECTDIR}/_ext/1865200349/plib_evic.o ${OBJECTDIR}/_ext/1865254177/plib_gpio.o ${OBJECTDIR}/_ext/1996599795/plib_power.o ${OBJECTDIR}/_ext/1865569570/plib_rcon.o ${OBJECTDIR}/_ext/298189674/plib_spi2_master.o ${OBJECTDIR}/_ext/1865657120/plib_uart1.o ${OBJECTDIR}/_ext/60184501/plib_wdt.o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ${OBJECTDIR}/_ext/1171490990/initialization.o ${OBJECTDIR}/_ext/1171490990/interrupts.o ${OBJECTDIR}/_ext/1171490990/exceptions.o ${OBJECTDIR}/_ext/519438381/heap_4.o ${OBJECTDIR}/_ext/428457472/port.o ${OBJECTDIR}/_ext/428457472/port_asm.o ${OBJECTDIR}/_ext/1489609866/timers.o ${OBJECTDIR}/_ext/1489609866/event_groups.o ${OBJECTDIR}/_ext/1489609866/list.o ${OBJECTDIR}/_ext/1489609866/queue.o ${OBJECTDIR}/_ext/1489609866/stream_buffer.o ${OBJECTDIR}/_ext/1489609866/tasks.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/410010953/fsm.o ${OBJECTDIR}/_ext/411002074/fsm_error_leds.o ${OBJECTDIR}/_ext/410998050/bms_flags.o

# Source Files
SOURCEFILES=../src/config/default/peripheral/adc/plib_adc.c ../src/config/default/peripheral/can/plib_can1.c ../src/config/default/peripheral/clk/plib_clk.c ../src/config/default/peripheral/evic/plib_evic.c ../src/config/default/peripheral/gpio/plib_gpio.c ../src/config/default/peripheral/power/plib_power.c ../src/config/default/peripheral/rcon/plib_rcon.c ../src/config/default/peripheral/spi/spi_master/plib_spi2_master.c ../src/config/default/peripheral/uart/plib_uart1.c ../src/config/default/peripheral/wdt/plib_wdt.c ../src/config/default/stdio/xc32_monitor.c ../src/config/default/initialization.c ../src/config/default/interrupts.c ../src/config/default/exceptions.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MemMang/heap_4.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MPLAB/PIC32MX/port.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MPLAB/PIC32MX/port_asm.S C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/timers.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/event_groups.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/list.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/queue.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/stream_buffer.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/tasks.c ../src/main.c C:/Users/adria/MPLABXProjects/BMS_LV.X/libs/fsm/fsm.c C:/Users/adria/MPLABXProjects/BMS_LV.X/app/fsm/fsm_error_leds.c C:/Users/adria/MPLABXProjects/BMS_LV.X/app/bms/bms_flags.c



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
${OBJECTDIR}/_ext/428457472/port_asm.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MPLAB/PIC32MX/port_asm.S  .generated_files/flags/default/893f038fb9842313ec72dc8cd45a81626846895 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/428457472" 
	@${RM} ${OBJECTDIR}/_ext/428457472/port_asm.o.d 
	@${RM} ${OBJECTDIR}/_ext/428457472/port_asm.o 
	@${RM} ${OBJECTDIR}/_ext/428457472/port_asm.o.ok ${OBJECTDIR}/_ext/428457472/port_asm.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1 -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/428457472/port_asm.o.d"  -o ${OBJECTDIR}/_ext/428457472/port_asm.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MPLAB/PIC32MX/port_asm.S  -DXPRJ_default=$(CND_CONF)    -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/428457472/port_asm.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK5=1,-I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/_ext/428457472/port_asm.o.d" "${OBJECTDIR}/_ext/428457472/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/_ext/428457472/port_asm.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MPLAB/PIC32MX/port_asm.S  .generated_files/flags/default/1f68e29d29e820887252badb8c531042e2be65e1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/428457472" 
	@${RM} ${OBJECTDIR}/_ext/428457472/port_asm.o.d 
	@${RM} ${OBJECTDIR}/_ext/428457472/port_asm.o 
	@${RM} ${OBJECTDIR}/_ext/428457472/port_asm.o.ok ${OBJECTDIR}/_ext/428457472/port_asm.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/428457472/port_asm.o.d"  -o ${OBJECTDIR}/_ext/428457472/port_asm.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MPLAB/PIC32MX/port_asm.S  -DXPRJ_default=$(CND_CONF)    -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/428457472/port_asm.o.asm.d",--gdwarf-2,-I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/_ext/428457472/port_asm.o.d" "${OBJECTDIR}/_ext/428457472/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/60163342/plib_adc.o: ../src/config/default/peripheral/adc/plib_adc.c  .generated_files/flags/default/b1ce74e7320382d652278cc4a9028c75b725e21a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60163342" 
	@${RM} ${OBJECTDIR}/_ext/60163342/plib_adc.o.d 
	@${RM} ${OBJECTDIR}/_ext/60163342/plib_adc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/60163342/plib_adc.o.d" -o ${OBJECTDIR}/_ext/60163342/plib_adc.o ../src/config/default/peripheral/adc/plib_adc.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60165182/plib_can1.o: ../src/config/default/peripheral/can/plib_can1.c  .generated_files/flags/default/cbe47d01bb49c5fe31036c27d18602ef4102843f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60165182" 
	@${RM} ${OBJECTDIR}/_ext/60165182/plib_can1.o.d 
	@${RM} ${OBJECTDIR}/_ext/60165182/plib_can1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/60165182/plib_can1.o.d" -o ${OBJECTDIR}/_ext/60165182/plib_can1.o ../src/config/default/peripheral/can/plib_can1.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60165520/plib_clk.o: ../src/config/default/peripheral/clk/plib_clk.c  .generated_files/flags/default/23c1a423a2359d95ba697fa21b5ffc3bbc336162 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60165520" 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/60165520/plib_clk.o.d" -o ${OBJECTDIR}/_ext/60165520/plib_clk.o ../src/config/default/peripheral/clk/plib_clk.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865200349/plib_evic.o: ../src/config/default/peripheral/evic/plib_evic.c  .generated_files/flags/default/ca58bafd69998a93806767ea199cac4c2c6c6ee7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865200349" 
	@${RM} ${OBJECTDIR}/_ext/1865200349/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865200349/plib_evic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1865200349/plib_evic.o.d" -o ${OBJECTDIR}/_ext/1865200349/plib_evic.o ../src/config/default/peripheral/evic/plib_evic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865254177/plib_gpio.o: ../src/config/default/peripheral/gpio/plib_gpio.c  .generated_files/flags/default/d7835d48871310d9ab42a7908a16362e45e20a81 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865254177" 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/1865254177/plib_gpio.o ../src/config/default/peripheral/gpio/plib_gpio.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1996599795/plib_power.o: ../src/config/default/peripheral/power/plib_power.c  .generated_files/flags/default/5ff9ddbae80779a71784eb5a5e42bbccbe26f9f5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1996599795" 
	@${RM} ${OBJECTDIR}/_ext/1996599795/plib_power.o.d 
	@${RM} ${OBJECTDIR}/_ext/1996599795/plib_power.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1996599795/plib_power.o.d" -o ${OBJECTDIR}/_ext/1996599795/plib_power.o ../src/config/default/peripheral/power/plib_power.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865569570/plib_rcon.o: ../src/config/default/peripheral/rcon/plib_rcon.c  .generated_files/flags/default/ff7230013a8d35fb360fae5ac97de4dc50ca162b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865569570" 
	@${RM} ${OBJECTDIR}/_ext/1865569570/plib_rcon.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865569570/plib_rcon.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1865569570/plib_rcon.o.d" -o ${OBJECTDIR}/_ext/1865569570/plib_rcon.o ../src/config/default/peripheral/rcon/plib_rcon.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/298189674/plib_spi2_master.o: ../src/config/default/peripheral/spi/spi_master/plib_spi2_master.c  .generated_files/flags/default/6a84f50f96d830088394ee8affa996dd14309c66 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/298189674" 
	@${RM} ${OBJECTDIR}/_ext/298189674/plib_spi2_master.o.d 
	@${RM} ${OBJECTDIR}/_ext/298189674/plib_spi2_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/298189674/plib_spi2_master.o.d" -o ${OBJECTDIR}/_ext/298189674/plib_spi2_master.o ../src/config/default/peripheral/spi/spi_master/plib_spi2_master.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865657120/plib_uart1.o: ../src/config/default/peripheral/uart/plib_uart1.c  .generated_files/flags/default/a54d2bb638868b1c45f0d2eb70e8b314c3e134e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865657120" 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1865657120/plib_uart1.o.d" -o ${OBJECTDIR}/_ext/1865657120/plib_uart1.o ../src/config/default/peripheral/uart/plib_uart1.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60184501/plib_wdt.o: ../src/config/default/peripheral/wdt/plib_wdt.c  .generated_files/flags/default/9bf99ab2bd09a1a58e683a74592da735eab57de6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60184501" 
	@${RM} ${OBJECTDIR}/_ext/60184501/plib_wdt.o.d 
	@${RM} ${OBJECTDIR}/_ext/60184501/plib_wdt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/60184501/plib_wdt.o.d" -o ${OBJECTDIR}/_ext/60184501/plib_wdt.o ../src/config/default/peripheral/wdt/plib_wdt.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/163028504/xc32_monitor.o: ../src/config/default/stdio/xc32_monitor.c  .generated_files/flags/default/27c194a55f4851b72f1f5461b674688092abeaf1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/163028504" 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ../src/config/default/stdio/xc32_monitor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/initialization.o: ../src/config/default/initialization.c  .generated_files/flags/default/4f6739bac02a6370d751da1095363ec5143c73e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/initialization.o.d" -o ${OBJECTDIR}/_ext/1171490990/initialization.o ../src/config/default/initialization.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/interrupts.o: ../src/config/default/interrupts.c  .generated_files/flags/default/8eada14a01ca1b2f8b75847f7fb75979e94afba6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/interrupts.o.d" -o ${OBJECTDIR}/_ext/1171490990/interrupts.o ../src/config/default/interrupts.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/exceptions.o: ../src/config/default/exceptions.c  .generated_files/flags/default/a9dcc7a15088cc651050baf9f353c7377ee56de .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/exceptions.o.d" -o ${OBJECTDIR}/_ext/1171490990/exceptions.o ../src/config/default/exceptions.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/519438381/heap_4.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MemMang/heap_4.c  .generated_files/flags/default/ed2185854449ea50778596c1146f2b69af5f161b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/519438381" 
	@${RM} ${OBJECTDIR}/_ext/519438381/heap_4.o.d 
	@${RM} ${OBJECTDIR}/_ext/519438381/heap_4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/519438381/heap_4.o.d" -o ${OBJECTDIR}/_ext/519438381/heap_4.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MemMang/heap_4.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/428457472/port.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MPLAB/PIC32MX/port.c  .generated_files/flags/default/2432b8761b2312566a56ebbfe560ec3dfd1abfe7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/428457472" 
	@${RM} ${OBJECTDIR}/_ext/428457472/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/428457472/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/428457472/port.o.d" -o ${OBJECTDIR}/_ext/428457472/port.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MPLAB/PIC32MX/port.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/timers.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/timers.c  .generated_files/flags/default/a8651eb266d03aace3ad3779feedd559c9ff027a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/timers.o.d" -o ${OBJECTDIR}/_ext/1489609866/timers.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/event_groups.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/event_groups.c  .generated_files/flags/default/861def16285563b9fcd45e5416db1332af7a1dcf .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/event_groups.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/event_groups.o.d" -o ${OBJECTDIR}/_ext/1489609866/event_groups.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/event_groups.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/list.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/list.c  .generated_files/flags/default/2b80894471e330e8213e6dd289ffaceda2782aa8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/list.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/list.o.d" -o ${OBJECTDIR}/_ext/1489609866/list.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/list.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/queue.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/queue.c  .generated_files/flags/default/5f0dace56a833d45984ea10fb1d1749717b3fda3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/queue.o.d" -o ${OBJECTDIR}/_ext/1489609866/queue.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/queue.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/stream_buffer.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/stream_buffer.c  .generated_files/flags/default/50a23a593cf25d148e9aebc419ad6f32f34919c5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/stream_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/stream_buffer.o.d" -o ${OBJECTDIR}/_ext/1489609866/stream_buffer.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/stream_buffer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/tasks.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/tasks.c  .generated_files/flags/default/a6a075c3d20c61dbf3f896f7d7a93159a1ddde12 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/tasks.o.d" -o ${OBJECTDIR}/_ext/1489609866/tasks.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/tasks.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/default/466a4258152212a2739f11c8624d2059c77fe35d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/410010953/fsm.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/libs/fsm/fsm.c  .generated_files/flags/default/b1844dd7e45f6229726e327bd8e787ce12e41eca .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/410010953" 
	@${RM} ${OBJECTDIR}/_ext/410010953/fsm.o.d 
	@${RM} ${OBJECTDIR}/_ext/410010953/fsm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/410010953/fsm.o.d" -o ${OBJECTDIR}/_ext/410010953/fsm.o C:/Users/adria/MPLABXProjects/BMS_LV.X/libs/fsm/fsm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/411002074/fsm_error_leds.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/app/fsm/fsm_error_leds.c  .generated_files/flags/default/3737e7cc7db1ad158d8cfa194102c58a8e4f90cf .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/411002074" 
	@${RM} ${OBJECTDIR}/_ext/411002074/fsm_error_leds.o.d 
	@${RM} ${OBJECTDIR}/_ext/411002074/fsm_error_leds.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/411002074/fsm_error_leds.o.d" -o ${OBJECTDIR}/_ext/411002074/fsm_error_leds.o C:/Users/adria/MPLABXProjects/BMS_LV.X/app/fsm/fsm_error_leds.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/410998050/bms_flags.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/app/bms/bms_flags.c  .generated_files/flags/default/23085c219af7dda1188b7dca4034ee2900ed4357 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/410998050" 
	@${RM} ${OBJECTDIR}/_ext/410998050/bms_flags.o.d 
	@${RM} ${OBJECTDIR}/_ext/410998050/bms_flags.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/410998050/bms_flags.o.d" -o ${OBJECTDIR}/_ext/410998050/bms_flags.o C:/Users/adria/MPLABXProjects/BMS_LV.X/app/bms/bms_flags.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/60163342/plib_adc.o: ../src/config/default/peripheral/adc/plib_adc.c  .generated_files/flags/default/e98a1263527b39eff999dc53b9ac94ad0446217 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60163342" 
	@${RM} ${OBJECTDIR}/_ext/60163342/plib_adc.o.d 
	@${RM} ${OBJECTDIR}/_ext/60163342/plib_adc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/60163342/plib_adc.o.d" -o ${OBJECTDIR}/_ext/60163342/plib_adc.o ../src/config/default/peripheral/adc/plib_adc.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60165182/plib_can1.o: ../src/config/default/peripheral/can/plib_can1.c  .generated_files/flags/default/e4bf90466f7995cd75cf081eb0e05aad494c038d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60165182" 
	@${RM} ${OBJECTDIR}/_ext/60165182/plib_can1.o.d 
	@${RM} ${OBJECTDIR}/_ext/60165182/plib_can1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/60165182/plib_can1.o.d" -o ${OBJECTDIR}/_ext/60165182/plib_can1.o ../src/config/default/peripheral/can/plib_can1.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60165520/plib_clk.o: ../src/config/default/peripheral/clk/plib_clk.c  .generated_files/flags/default/f56709bd133ef5c69de1a88c6292714179276d85 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60165520" 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/60165520/plib_clk.o.d" -o ${OBJECTDIR}/_ext/60165520/plib_clk.o ../src/config/default/peripheral/clk/plib_clk.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865200349/plib_evic.o: ../src/config/default/peripheral/evic/plib_evic.c  .generated_files/flags/default/9d7103b2a8242eed4fc8ecb1400c852e03e5308 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865200349" 
	@${RM} ${OBJECTDIR}/_ext/1865200349/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865200349/plib_evic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1865200349/plib_evic.o.d" -o ${OBJECTDIR}/_ext/1865200349/plib_evic.o ../src/config/default/peripheral/evic/plib_evic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865254177/plib_gpio.o: ../src/config/default/peripheral/gpio/plib_gpio.c  .generated_files/flags/default/51afe306a8b89a3385ef805bf7e2d8161ce49362 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865254177" 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/1865254177/plib_gpio.o ../src/config/default/peripheral/gpio/plib_gpio.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1996599795/plib_power.o: ../src/config/default/peripheral/power/plib_power.c  .generated_files/flags/default/9798b65ad9b3554862f763a0bfcbf224399d984b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1996599795" 
	@${RM} ${OBJECTDIR}/_ext/1996599795/plib_power.o.d 
	@${RM} ${OBJECTDIR}/_ext/1996599795/plib_power.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1996599795/plib_power.o.d" -o ${OBJECTDIR}/_ext/1996599795/plib_power.o ../src/config/default/peripheral/power/plib_power.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865569570/plib_rcon.o: ../src/config/default/peripheral/rcon/plib_rcon.c  .generated_files/flags/default/86c08b498800b241860661b946f2bec274597ee8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865569570" 
	@${RM} ${OBJECTDIR}/_ext/1865569570/plib_rcon.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865569570/plib_rcon.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1865569570/plib_rcon.o.d" -o ${OBJECTDIR}/_ext/1865569570/plib_rcon.o ../src/config/default/peripheral/rcon/plib_rcon.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/298189674/plib_spi2_master.o: ../src/config/default/peripheral/spi/spi_master/plib_spi2_master.c  .generated_files/flags/default/e48a8297f155a4c37c80499d86ddaf94c4ded778 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/298189674" 
	@${RM} ${OBJECTDIR}/_ext/298189674/plib_spi2_master.o.d 
	@${RM} ${OBJECTDIR}/_ext/298189674/plib_spi2_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/298189674/plib_spi2_master.o.d" -o ${OBJECTDIR}/_ext/298189674/plib_spi2_master.o ../src/config/default/peripheral/spi/spi_master/plib_spi2_master.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865657120/plib_uart1.o: ../src/config/default/peripheral/uart/plib_uart1.c  .generated_files/flags/default/91cc06417413a1f8bdd7525bb62ccf412456d9fe .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865657120" 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1865657120/plib_uart1.o.d" -o ${OBJECTDIR}/_ext/1865657120/plib_uart1.o ../src/config/default/peripheral/uart/plib_uart1.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60184501/plib_wdt.o: ../src/config/default/peripheral/wdt/plib_wdt.c  .generated_files/flags/default/ccd6d00d4441720b14fa834e7162feae65708ffc .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60184501" 
	@${RM} ${OBJECTDIR}/_ext/60184501/plib_wdt.o.d 
	@${RM} ${OBJECTDIR}/_ext/60184501/plib_wdt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/60184501/plib_wdt.o.d" -o ${OBJECTDIR}/_ext/60184501/plib_wdt.o ../src/config/default/peripheral/wdt/plib_wdt.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/163028504/xc32_monitor.o: ../src/config/default/stdio/xc32_monitor.c  .generated_files/flags/default/c43d052696b0d53d7fcaf5147113dcd2b2f99e16 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/163028504" 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ../src/config/default/stdio/xc32_monitor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/initialization.o: ../src/config/default/initialization.c  .generated_files/flags/default/7620987e800bb97c9de731822981a73dc5850a93 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/initialization.o.d" -o ${OBJECTDIR}/_ext/1171490990/initialization.o ../src/config/default/initialization.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/interrupts.o: ../src/config/default/interrupts.c  .generated_files/flags/default/2ab199d6ad5e8497dd5cc5a63a8a12117aeb658a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/interrupts.o.d" -o ${OBJECTDIR}/_ext/1171490990/interrupts.o ../src/config/default/interrupts.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/exceptions.o: ../src/config/default/exceptions.c  .generated_files/flags/default/da4048200df6a0f5105bdf75e67adf1fa0f16705 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/exceptions.o.d" -o ${OBJECTDIR}/_ext/1171490990/exceptions.o ../src/config/default/exceptions.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/519438381/heap_4.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MemMang/heap_4.c  .generated_files/flags/default/8e73df6e31251d69c097dd7e9bed381c26c3a7ae .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/519438381" 
	@${RM} ${OBJECTDIR}/_ext/519438381/heap_4.o.d 
	@${RM} ${OBJECTDIR}/_ext/519438381/heap_4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/519438381/heap_4.o.d" -o ${OBJECTDIR}/_ext/519438381/heap_4.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MemMang/heap_4.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/428457472/port.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MPLAB/PIC32MX/port.c  .generated_files/flags/default/1c56814a593303c82699da4278377d8bebed69d1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/428457472" 
	@${RM} ${OBJECTDIR}/_ext/428457472/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/428457472/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/428457472/port.o.d" -o ${OBJECTDIR}/_ext/428457472/port.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MPLAB/PIC32MX/port.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/timers.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/timers.c  .generated_files/flags/default/225a5dab0b7da7a7fe8f280c31409f76588c902d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/timers.o.d" -o ${OBJECTDIR}/_ext/1489609866/timers.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/event_groups.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/event_groups.c  .generated_files/flags/default/b60488676a8ee645a721b3cff91c42981c0a509f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/event_groups.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/event_groups.o.d" -o ${OBJECTDIR}/_ext/1489609866/event_groups.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/event_groups.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/list.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/list.c  .generated_files/flags/default/16a27b33e5115d372f6480055d7d54086a8eb862 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/list.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/list.o.d" -o ${OBJECTDIR}/_ext/1489609866/list.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/list.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/queue.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/queue.c  .generated_files/flags/default/c201684c17175114c6a906727f13fec4b27d8d6d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/queue.o.d" -o ${OBJECTDIR}/_ext/1489609866/queue.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/queue.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/stream_buffer.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/stream_buffer.c  .generated_files/flags/default/5cd3a4d2ccf3cfd9ea3a915565766c6dbd91cc9e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/stream_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/stream_buffer.o.d" -o ${OBJECTDIR}/_ext/1489609866/stream_buffer.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/stream_buffer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/tasks.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/tasks.c  .generated_files/flags/default/5d317e43c8cdfdf3bd758a46b441db8320a80a81 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/tasks.o.d" -o ${OBJECTDIR}/_ext/1489609866/tasks.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/tasks.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/default/f50f5565625fc02363be7c7829faf77b073c04b9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/410010953/fsm.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/libs/fsm/fsm.c  .generated_files/flags/default/2107014c03c7928eb1e1a5e18960619da2cdf77d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/410010953" 
	@${RM} ${OBJECTDIR}/_ext/410010953/fsm.o.d 
	@${RM} ${OBJECTDIR}/_ext/410010953/fsm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/410010953/fsm.o.d" -o ${OBJECTDIR}/_ext/410010953/fsm.o C:/Users/adria/MPLABXProjects/BMS_LV.X/libs/fsm/fsm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/411002074/fsm_error_leds.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/app/fsm/fsm_error_leds.c  .generated_files/flags/default/4afc4c1631196c2c46ac404984799d8236fae2db .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/411002074" 
	@${RM} ${OBJECTDIR}/_ext/411002074/fsm_error_leds.o.d 
	@${RM} ${OBJECTDIR}/_ext/411002074/fsm_error_leds.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/411002074/fsm_error_leds.o.d" -o ${OBJECTDIR}/_ext/411002074/fsm_error_leds.o C:/Users/adria/MPLABXProjects/BMS_LV.X/app/fsm/fsm_error_leds.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/410998050/bms_flags.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/app/bms/bms_flags.c  .generated_files/flags/default/9bcdbd4a2d95acda84a944af11c692dce0d79e8d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/410998050" 
	@${RM} ${OBJECTDIR}/_ext/410998050/bms_flags.o.d 
	@${RM} ${OBJECTDIR}/_ext/410998050/bms_flags.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/410998050/bms_flags.o.d" -o ${OBJECTDIR}/_ext/410998050/bms_flags.o C:/Users/adria/MPLABXProjects/BMS_LV.X/app/bms/bms_flags.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
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
	${MP_CC} $(MP_EXTRA_LD_PRE) -g -mdebugger -D__MPLAB_DEBUGGER_PK5=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/BMS_LV.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC02000:0x1FC02FEF -mreserve=boot@0x1FC02000:0x1FC024FF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_PK5=1,--defsym=_min_heap_size=512,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
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
