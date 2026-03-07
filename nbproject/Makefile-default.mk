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
${OBJECTDIR}/_ext/428457472/port_asm.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MPLAB/PIC32MX/port_asm.S  .generated_files/flags/default/b920ea122e749f2426e9e2a134eddc4984411bad .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/428457472" 
	@${RM} ${OBJECTDIR}/_ext/428457472/port_asm.o.d 
	@${RM} ${OBJECTDIR}/_ext/428457472/port_asm.o 
	@${RM} ${OBJECTDIR}/_ext/428457472/port_asm.o.ok ${OBJECTDIR}/_ext/428457472/port_asm.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1 -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/428457472/port_asm.o.d"  -o ${OBJECTDIR}/_ext/428457472/port_asm.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MPLAB/PIC32MX/port_asm.S  -DXPRJ_default=$(CND_CONF)    -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/428457472/port_asm.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK5=1,-I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/_ext/428457472/port_asm.o.d" "${OBJECTDIR}/_ext/428457472/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/_ext/428457472/port_asm.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MPLAB/PIC32MX/port_asm.S  .generated_files/flags/default/6675333244db46d59a945754e8ade9acaa5c511f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/428457472" 
	@${RM} ${OBJECTDIR}/_ext/428457472/port_asm.o.d 
	@${RM} ${OBJECTDIR}/_ext/428457472/port_asm.o 
	@${RM} ${OBJECTDIR}/_ext/428457472/port_asm.o.ok ${OBJECTDIR}/_ext/428457472/port_asm.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/428457472/port_asm.o.d"  -o ${OBJECTDIR}/_ext/428457472/port_asm.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MPLAB/PIC32MX/port_asm.S  -DXPRJ_default=$(CND_CONF)    -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/428457472/port_asm.o.asm.d",--gdwarf-2,-I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/_ext/428457472/port_asm.o.d" "${OBJECTDIR}/_ext/428457472/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/60163342/plib_adc.o: ../src/config/default/peripheral/adc/plib_adc.c  .generated_files/flags/default/2afb2ad0110f9957453c0677499fb7ed2d66947b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60163342" 
	@${RM} ${OBJECTDIR}/_ext/60163342/plib_adc.o.d 
	@${RM} ${OBJECTDIR}/_ext/60163342/plib_adc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/60163342/plib_adc.o.d" -o ${OBJECTDIR}/_ext/60163342/plib_adc.o ../src/config/default/peripheral/adc/plib_adc.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60165182/plib_can1.o: ../src/config/default/peripheral/can/plib_can1.c  .generated_files/flags/default/c182deece070fcb390f9e13e1ee3433d80034350 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60165182" 
	@${RM} ${OBJECTDIR}/_ext/60165182/plib_can1.o.d 
	@${RM} ${OBJECTDIR}/_ext/60165182/plib_can1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/60165182/plib_can1.o.d" -o ${OBJECTDIR}/_ext/60165182/plib_can1.o ../src/config/default/peripheral/can/plib_can1.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60165520/plib_clk.o: ../src/config/default/peripheral/clk/plib_clk.c  .generated_files/flags/default/c1b8e4fda61125d47642d5029cd6d5ea0688c8b9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60165520" 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/60165520/plib_clk.o.d" -o ${OBJECTDIR}/_ext/60165520/plib_clk.o ../src/config/default/peripheral/clk/plib_clk.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865200349/plib_evic.o: ../src/config/default/peripheral/evic/plib_evic.c  .generated_files/flags/default/35d45119c8ad8c5974be009f2d6c720006ad02a0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865200349" 
	@${RM} ${OBJECTDIR}/_ext/1865200349/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865200349/plib_evic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1865200349/plib_evic.o.d" -o ${OBJECTDIR}/_ext/1865200349/plib_evic.o ../src/config/default/peripheral/evic/plib_evic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865254177/plib_gpio.o: ../src/config/default/peripheral/gpio/plib_gpio.c  .generated_files/flags/default/49da5769d05ebf901a5d66bdcd2980fddee36739 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865254177" 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/1865254177/plib_gpio.o ../src/config/default/peripheral/gpio/plib_gpio.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1996599795/plib_power.o: ../src/config/default/peripheral/power/plib_power.c  .generated_files/flags/default/961576e8b48186574a941bae36fd1d6db2e85734 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1996599795" 
	@${RM} ${OBJECTDIR}/_ext/1996599795/plib_power.o.d 
	@${RM} ${OBJECTDIR}/_ext/1996599795/plib_power.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1996599795/plib_power.o.d" -o ${OBJECTDIR}/_ext/1996599795/plib_power.o ../src/config/default/peripheral/power/plib_power.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865569570/plib_rcon.o: ../src/config/default/peripheral/rcon/plib_rcon.c  .generated_files/flags/default/5ed8d172b3dac0c8aca49264129d6c5f2a497f3d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865569570" 
	@${RM} ${OBJECTDIR}/_ext/1865569570/plib_rcon.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865569570/plib_rcon.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1865569570/plib_rcon.o.d" -o ${OBJECTDIR}/_ext/1865569570/plib_rcon.o ../src/config/default/peripheral/rcon/plib_rcon.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/298189674/plib_spi2_master.o: ../src/config/default/peripheral/spi/spi_master/plib_spi2_master.c  .generated_files/flags/default/5d1a0afb60bf9016a9f7c52b69af239530bdfe4d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/298189674" 
	@${RM} ${OBJECTDIR}/_ext/298189674/plib_spi2_master.o.d 
	@${RM} ${OBJECTDIR}/_ext/298189674/plib_spi2_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/298189674/plib_spi2_master.o.d" -o ${OBJECTDIR}/_ext/298189674/plib_spi2_master.o ../src/config/default/peripheral/spi/spi_master/plib_spi2_master.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865657120/plib_uart1.o: ../src/config/default/peripheral/uart/plib_uart1.c  .generated_files/flags/default/4b7237b72dfcafc4dabf8f39ed2d50751010c445 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865657120" 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1865657120/plib_uart1.o.d" -o ${OBJECTDIR}/_ext/1865657120/plib_uart1.o ../src/config/default/peripheral/uart/plib_uart1.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60184501/plib_wdt.o: ../src/config/default/peripheral/wdt/plib_wdt.c  .generated_files/flags/default/b03f929e19196892df62152df30ffd0d70b0e195 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60184501" 
	@${RM} ${OBJECTDIR}/_ext/60184501/plib_wdt.o.d 
	@${RM} ${OBJECTDIR}/_ext/60184501/plib_wdt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/60184501/plib_wdt.o.d" -o ${OBJECTDIR}/_ext/60184501/plib_wdt.o ../src/config/default/peripheral/wdt/plib_wdt.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/163028504/xc32_monitor.o: ../src/config/default/stdio/xc32_monitor.c  .generated_files/flags/default/4cd56bc6a4e66b6b6d6acbcf57ba0cc46effdd87 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/163028504" 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ../src/config/default/stdio/xc32_monitor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/initialization.o: ../src/config/default/initialization.c  .generated_files/flags/default/da7f8e799fe22908740b1bfc1b9a7b722900586d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/initialization.o.d" -o ${OBJECTDIR}/_ext/1171490990/initialization.o ../src/config/default/initialization.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/interrupts.o: ../src/config/default/interrupts.c  .generated_files/flags/default/3935051e50bd1b024ba8ccedcc94c362899a2fb7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/interrupts.o.d" -o ${OBJECTDIR}/_ext/1171490990/interrupts.o ../src/config/default/interrupts.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/exceptions.o: ../src/config/default/exceptions.c  .generated_files/flags/default/1649eafa0b2d84bb69c8223c918104db037011e1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/exceptions.o.d" -o ${OBJECTDIR}/_ext/1171490990/exceptions.o ../src/config/default/exceptions.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/519438381/heap_4.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MemMang/heap_4.c  .generated_files/flags/default/a6153e1c04e79ffb8a5b94acbbd0da9d962ad3e6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/519438381" 
	@${RM} ${OBJECTDIR}/_ext/519438381/heap_4.o.d 
	@${RM} ${OBJECTDIR}/_ext/519438381/heap_4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/519438381/heap_4.o.d" -o ${OBJECTDIR}/_ext/519438381/heap_4.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MemMang/heap_4.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/428457472/port.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MPLAB/PIC32MX/port.c  .generated_files/flags/default/9fe9a2fba5c36e94dbf392da85a46313999825d0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/428457472" 
	@${RM} ${OBJECTDIR}/_ext/428457472/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/428457472/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/428457472/port.o.d" -o ${OBJECTDIR}/_ext/428457472/port.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MPLAB/PIC32MX/port.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/timers.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/timers.c  .generated_files/flags/default/5b63718c84a719df80f276af137db6eb7e6d83fe .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/timers.o.d" -o ${OBJECTDIR}/_ext/1489609866/timers.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/event_groups.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/event_groups.c  .generated_files/flags/default/87a5207dff1483c1d8001e16faf9403f9306ea48 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/event_groups.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/event_groups.o.d" -o ${OBJECTDIR}/_ext/1489609866/event_groups.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/event_groups.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/list.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/list.c  .generated_files/flags/default/dc004f84acb6a87e6481520db950b4bd8d9ff880 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/list.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/list.o.d" -o ${OBJECTDIR}/_ext/1489609866/list.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/list.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/queue.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/queue.c  .generated_files/flags/default/ed49a5b8cd59e454bea3e0780f99d68da21027c4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/queue.o.d" -o ${OBJECTDIR}/_ext/1489609866/queue.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/queue.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/stream_buffer.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/stream_buffer.c  .generated_files/flags/default/bddd24231e842649a3b8c499d3de71e6b056059e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/stream_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/stream_buffer.o.d" -o ${OBJECTDIR}/_ext/1489609866/stream_buffer.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/stream_buffer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/tasks.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/tasks.c  .generated_files/flags/default/ee1ac4377c20a88fcebc731b3bed6c3088d36e8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/tasks.o.d" -o ${OBJECTDIR}/_ext/1489609866/tasks.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/tasks.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/default/94b4d404f281b022940986d89c1da4bd02cbd58a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/410010953/fsm.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/libs/fsm/fsm.c  .generated_files/flags/default/b6c500cd3c52921f2c6410eef5035fd1970677a2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/410010953" 
	@${RM} ${OBJECTDIR}/_ext/410010953/fsm.o.d 
	@${RM} ${OBJECTDIR}/_ext/410010953/fsm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/410010953/fsm.o.d" -o ${OBJECTDIR}/_ext/410010953/fsm.o C:/Users/adria/MPLABXProjects/BMS_LV.X/libs/fsm/fsm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/411002074/fsm_error_leds.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/app/fsm/fsm_error_leds.c  .generated_files/flags/default/9947c6cf4024564de73ad5865c8d15d69b87afd5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/411002074" 
	@${RM} ${OBJECTDIR}/_ext/411002074/fsm_error_leds.o.d 
	@${RM} ${OBJECTDIR}/_ext/411002074/fsm_error_leds.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/411002074/fsm_error_leds.o.d" -o ${OBJECTDIR}/_ext/411002074/fsm_error_leds.o C:/Users/adria/MPLABXProjects/BMS_LV.X/app/fsm/fsm_error_leds.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/410998050/bms_flags.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/app/bms/bms_flags.c  .generated_files/flags/default/f0df6abd4a4f37c3e7b9ef301a56a8c38414190c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/410998050" 
	@${RM} ${OBJECTDIR}/_ext/410998050/bms_flags.o.d 
	@${RM} ${OBJECTDIR}/_ext/410998050/bms_flags.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/410998050/bms_flags.o.d" -o ${OBJECTDIR}/_ext/410998050/bms_flags.o C:/Users/adria/MPLABXProjects/BMS_LV.X/app/bms/bms_flags.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/60163342/plib_adc.o: ../src/config/default/peripheral/adc/plib_adc.c  .generated_files/flags/default/66e6503defed4fb493832241c1a1e1990102c572 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60163342" 
	@${RM} ${OBJECTDIR}/_ext/60163342/plib_adc.o.d 
	@${RM} ${OBJECTDIR}/_ext/60163342/plib_adc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/60163342/plib_adc.o.d" -o ${OBJECTDIR}/_ext/60163342/plib_adc.o ../src/config/default/peripheral/adc/plib_adc.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60165182/plib_can1.o: ../src/config/default/peripheral/can/plib_can1.c  .generated_files/flags/default/409ae0f730ba2b8b88d312068b68d2aa2b86fff7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60165182" 
	@${RM} ${OBJECTDIR}/_ext/60165182/plib_can1.o.d 
	@${RM} ${OBJECTDIR}/_ext/60165182/plib_can1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/60165182/plib_can1.o.d" -o ${OBJECTDIR}/_ext/60165182/plib_can1.o ../src/config/default/peripheral/can/plib_can1.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60165520/plib_clk.o: ../src/config/default/peripheral/clk/plib_clk.c  .generated_files/flags/default/7f95597e810f1ded71f58babb3e6305661d3f59 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60165520" 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/60165520/plib_clk.o.d" -o ${OBJECTDIR}/_ext/60165520/plib_clk.o ../src/config/default/peripheral/clk/plib_clk.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865200349/plib_evic.o: ../src/config/default/peripheral/evic/plib_evic.c  .generated_files/flags/default/4db5af7923db095fd9e362a7e6136cdd242d22ec .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865200349" 
	@${RM} ${OBJECTDIR}/_ext/1865200349/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865200349/plib_evic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1865200349/plib_evic.o.d" -o ${OBJECTDIR}/_ext/1865200349/plib_evic.o ../src/config/default/peripheral/evic/plib_evic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865254177/plib_gpio.o: ../src/config/default/peripheral/gpio/plib_gpio.c  .generated_files/flags/default/9675fb1a06291cd91b65388f1acaf4e292a17332 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865254177" 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/1865254177/plib_gpio.o ../src/config/default/peripheral/gpio/plib_gpio.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1996599795/plib_power.o: ../src/config/default/peripheral/power/plib_power.c  .generated_files/flags/default/3bd6e184a369c464ef3c5ca2da13f879038852dd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1996599795" 
	@${RM} ${OBJECTDIR}/_ext/1996599795/plib_power.o.d 
	@${RM} ${OBJECTDIR}/_ext/1996599795/plib_power.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1996599795/plib_power.o.d" -o ${OBJECTDIR}/_ext/1996599795/plib_power.o ../src/config/default/peripheral/power/plib_power.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865569570/plib_rcon.o: ../src/config/default/peripheral/rcon/plib_rcon.c  .generated_files/flags/default/948634ee7b2f87fbb2e6b3635bfe66f28d59d8ec .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865569570" 
	@${RM} ${OBJECTDIR}/_ext/1865569570/plib_rcon.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865569570/plib_rcon.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1865569570/plib_rcon.o.d" -o ${OBJECTDIR}/_ext/1865569570/plib_rcon.o ../src/config/default/peripheral/rcon/plib_rcon.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/298189674/plib_spi2_master.o: ../src/config/default/peripheral/spi/spi_master/plib_spi2_master.c  .generated_files/flags/default/d073d25d8283878ff58e87800c0621eaae73923f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/298189674" 
	@${RM} ${OBJECTDIR}/_ext/298189674/plib_spi2_master.o.d 
	@${RM} ${OBJECTDIR}/_ext/298189674/plib_spi2_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/298189674/plib_spi2_master.o.d" -o ${OBJECTDIR}/_ext/298189674/plib_spi2_master.o ../src/config/default/peripheral/spi/spi_master/plib_spi2_master.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865657120/plib_uart1.o: ../src/config/default/peripheral/uart/plib_uart1.c  .generated_files/flags/default/ee8c4480022ffa7209a927f2724a4426737f6fc9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865657120" 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1865657120/plib_uart1.o.d" -o ${OBJECTDIR}/_ext/1865657120/plib_uart1.o ../src/config/default/peripheral/uart/plib_uart1.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60184501/plib_wdt.o: ../src/config/default/peripheral/wdt/plib_wdt.c  .generated_files/flags/default/24d83d29bc9bf88b6e8f287cc536f90dde4e5524 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60184501" 
	@${RM} ${OBJECTDIR}/_ext/60184501/plib_wdt.o.d 
	@${RM} ${OBJECTDIR}/_ext/60184501/plib_wdt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/60184501/plib_wdt.o.d" -o ${OBJECTDIR}/_ext/60184501/plib_wdt.o ../src/config/default/peripheral/wdt/plib_wdt.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/163028504/xc32_monitor.o: ../src/config/default/stdio/xc32_monitor.c  .generated_files/flags/default/3361c52e9ce6dc3e1881798203ebd417968e848c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/163028504" 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ../src/config/default/stdio/xc32_monitor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/initialization.o: ../src/config/default/initialization.c  .generated_files/flags/default/c3abe535b8ee5f265d1bc23bd8e7fb2649c2b8d6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/initialization.o.d" -o ${OBJECTDIR}/_ext/1171490990/initialization.o ../src/config/default/initialization.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/interrupts.o: ../src/config/default/interrupts.c  .generated_files/flags/default/346a407e8a1b7f271348514fe9eee524f3293396 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/interrupts.o.d" -o ${OBJECTDIR}/_ext/1171490990/interrupts.o ../src/config/default/interrupts.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/exceptions.o: ../src/config/default/exceptions.c  .generated_files/flags/default/dd0602a2d4552939cef4bd4d3b3c9ef6df9c7e32 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/exceptions.o.d" -o ${OBJECTDIR}/_ext/1171490990/exceptions.o ../src/config/default/exceptions.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/519438381/heap_4.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MemMang/heap_4.c  .generated_files/flags/default/3450d785ce02f08294296d75b92786f8a9d9a232 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/519438381" 
	@${RM} ${OBJECTDIR}/_ext/519438381/heap_4.o.d 
	@${RM} ${OBJECTDIR}/_ext/519438381/heap_4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/519438381/heap_4.o.d" -o ${OBJECTDIR}/_ext/519438381/heap_4.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MemMang/heap_4.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/428457472/port.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MPLAB/PIC32MX/port.c  .generated_files/flags/default/dc087ff124aede59273e934a5a5fb9a6c2895e8d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/428457472" 
	@${RM} ${OBJECTDIR}/_ext/428457472/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/428457472/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/428457472/port.o.d" -o ${OBJECTDIR}/_ext/428457472/port.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MPLAB/PIC32MX/port.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/timers.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/timers.c  .generated_files/flags/default/fa6b108e3a222686501890b56227f0a1bfb42deb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/timers.o.d" -o ${OBJECTDIR}/_ext/1489609866/timers.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/event_groups.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/event_groups.c  .generated_files/flags/default/66333dc91861812b4eaa01992ccf5b31bbbcd264 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/event_groups.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/event_groups.o.d" -o ${OBJECTDIR}/_ext/1489609866/event_groups.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/event_groups.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/list.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/list.c  .generated_files/flags/default/56b91c29caf27023559b07b19d58078f0a0f820c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/list.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/list.o.d" -o ${OBJECTDIR}/_ext/1489609866/list.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/list.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/queue.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/queue.c  .generated_files/flags/default/172aad808677fd41c167f6c8a0fc031f69bf2751 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/queue.o.d" -o ${OBJECTDIR}/_ext/1489609866/queue.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/queue.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/stream_buffer.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/stream_buffer.c  .generated_files/flags/default/a1380bb7cdc849a9650b62e29a48134b423891fe .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/stream_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/stream_buffer.o.d" -o ${OBJECTDIR}/_ext/1489609866/stream_buffer.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/stream_buffer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/tasks.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/tasks.c  .generated_files/flags/default/5917d607af2628fa8b1e73c780ca15bd26880d2e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/tasks.o.d" -o ${OBJECTDIR}/_ext/1489609866/tasks.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/tasks.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/default/cac5ba7ae73ec131ed2ae23d45cdbdc488721d4c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/410010953/fsm.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/libs/fsm/fsm.c  .generated_files/flags/default/410a33a5905e66fc79e6596d6ccd1d175c0507bb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/410010953" 
	@${RM} ${OBJECTDIR}/_ext/410010953/fsm.o.d 
	@${RM} ${OBJECTDIR}/_ext/410010953/fsm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/410010953/fsm.o.d" -o ${OBJECTDIR}/_ext/410010953/fsm.o C:/Users/adria/MPLABXProjects/BMS_LV.X/libs/fsm/fsm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/411002074/fsm_error_leds.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/app/fsm/fsm_error_leds.c  .generated_files/flags/default/fb80f595fac2137f1446016114d3460a3981cd0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/411002074" 
	@${RM} ${OBJECTDIR}/_ext/411002074/fsm_error_leds.o.d 
	@${RM} ${OBJECTDIR}/_ext/411002074/fsm_error_leds.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/411002074/fsm_error_leds.o.d" -o ${OBJECTDIR}/_ext/411002074/fsm_error_leds.o C:/Users/adria/MPLABXProjects/BMS_LV.X/app/fsm/fsm_error_leds.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/410998050/bms_flags.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/app/bms/bms_flags.c  .generated_files/flags/default/84a4425d79d8f2b1ce96fee35b489270a74b957f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/410998050" 
	@${RM} ${OBJECTDIR}/_ext/410998050/bms_flags.o.d 
	@${RM} ${OBJECTDIR}/_ext/410998050/bms_flags.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/config" -I"app/fsm" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/410998050/bms_flags.o.d" -o ${OBJECTDIR}/_ext/410998050/bms_flags.o C:/Users/adria/MPLABXProjects/BMS_LV.X/app/bms/bms_flags.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
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
