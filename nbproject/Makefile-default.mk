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
SOURCEFILES_QUOTED_IF_SPACED=C:/Users/adria/MPLABXProjects/BMS_LV.X/libs/fsm/fsm.c C:/Users/adria/MPLABXProjects/BMS_LV.X/app/fsm/fsm_error_leds.c C:/Users/adria/MPLABXProjects/BMS_LV.X/app/fsm/fsm_serial_cli.c C:/Users/adria/MPLABXProjects/BMS_LV.X/app/fsm/fsm_bms_mode.c ../src/config/default/peripheral/adc/plib_adc.c ../src/config/default/peripheral/can/plib_can1.c ../src/config/default/peripheral/clk/plib_clk.c ../src/config/default/peripheral/evic/plib_evic.c ../src/config/default/peripheral/gpio/plib_gpio.c ../src/config/default/peripheral/power/plib_power.c ../src/config/default/peripheral/rcon/plib_rcon.c ../src/config/default/peripheral/spi/spi_master/plib_spi2_master.c ../src/config/default/peripheral/uart/plib_uart1.c ../src/config/default/peripheral/wdt/plib_wdt.c ../src/config/default/stdio/xc32_monitor.c ../src/config/default/initialization.c ../src/config/default/interrupts.c ../src/config/default/exceptions.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MemMang/heap_4.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MPLAB/PIC32MX/port.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MPLAB/PIC32MX/port_asm.S C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/timers.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/event_groups.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/list.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/queue.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/stream_buffer.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/tasks.c ../src/main.c C:/Users/adria/MPLABXProjects/BMS_LV.X/app/bms/src/bms_flags.c C:/Users/adria/MPLABXProjects/BMS_LV.X/app/bms/src/prueba_claude.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/410010953/fsm.o ${OBJECTDIR}/_ext/411002074/fsm_error_leds.o ${OBJECTDIR}/_ext/411002074/fsm_serial_cli.o ${OBJECTDIR}/_ext/411002074/fsm_bms_mode.o ${OBJECTDIR}/_ext/60163342/plib_adc.o ${OBJECTDIR}/_ext/60165182/plib_can1.o ${OBJECTDIR}/_ext/60165520/plib_clk.o ${OBJECTDIR}/_ext/1865200349/plib_evic.o ${OBJECTDIR}/_ext/1865254177/plib_gpio.o ${OBJECTDIR}/_ext/1996599795/plib_power.o ${OBJECTDIR}/_ext/1865569570/plib_rcon.o ${OBJECTDIR}/_ext/298189674/plib_spi2_master.o ${OBJECTDIR}/_ext/1865657120/plib_uart1.o ${OBJECTDIR}/_ext/60184501/plib_wdt.o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ${OBJECTDIR}/_ext/1171490990/initialization.o ${OBJECTDIR}/_ext/1171490990/interrupts.o ${OBJECTDIR}/_ext/1171490990/exceptions.o ${OBJECTDIR}/_ext/519438381/heap_4.o ${OBJECTDIR}/_ext/428457472/port.o ${OBJECTDIR}/_ext/428457472/port_asm.o ${OBJECTDIR}/_ext/1489609866/timers.o ${OBJECTDIR}/_ext/1489609866/event_groups.o ${OBJECTDIR}/_ext/1489609866/list.o ${OBJECTDIR}/_ext/1489609866/queue.o ${OBJECTDIR}/_ext/1489609866/stream_buffer.o ${OBJECTDIR}/_ext/1489609866/tasks.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1891831671/bms_flags.o ${OBJECTDIR}/_ext/1891831671/prueba_claude.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/410010953/fsm.o.d ${OBJECTDIR}/_ext/411002074/fsm_error_leds.o.d ${OBJECTDIR}/_ext/411002074/fsm_serial_cli.o.d ${OBJECTDIR}/_ext/411002074/fsm_bms_mode.o.d ${OBJECTDIR}/_ext/60163342/plib_adc.o.d ${OBJECTDIR}/_ext/60165182/plib_can1.o.d ${OBJECTDIR}/_ext/60165520/plib_clk.o.d ${OBJECTDIR}/_ext/1865200349/plib_evic.o.d ${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d ${OBJECTDIR}/_ext/1996599795/plib_power.o.d ${OBJECTDIR}/_ext/1865569570/plib_rcon.o.d ${OBJECTDIR}/_ext/298189674/plib_spi2_master.o.d ${OBJECTDIR}/_ext/1865657120/plib_uart1.o.d ${OBJECTDIR}/_ext/60184501/plib_wdt.o.d ${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d ${OBJECTDIR}/_ext/1171490990/initialization.o.d ${OBJECTDIR}/_ext/1171490990/interrupts.o.d ${OBJECTDIR}/_ext/1171490990/exceptions.o.d ${OBJECTDIR}/_ext/519438381/heap_4.o.d ${OBJECTDIR}/_ext/428457472/port.o.d ${OBJECTDIR}/_ext/428457472/port_asm.o.d ${OBJECTDIR}/_ext/1489609866/timers.o.d ${OBJECTDIR}/_ext/1489609866/event_groups.o.d ${OBJECTDIR}/_ext/1489609866/list.o.d ${OBJECTDIR}/_ext/1489609866/queue.o.d ${OBJECTDIR}/_ext/1489609866/stream_buffer.o.d ${OBJECTDIR}/_ext/1489609866/tasks.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d ${OBJECTDIR}/_ext/1891831671/bms_flags.o.d ${OBJECTDIR}/_ext/1891831671/prueba_claude.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/410010953/fsm.o ${OBJECTDIR}/_ext/411002074/fsm_error_leds.o ${OBJECTDIR}/_ext/411002074/fsm_serial_cli.o ${OBJECTDIR}/_ext/411002074/fsm_bms_mode.o ${OBJECTDIR}/_ext/60163342/plib_adc.o ${OBJECTDIR}/_ext/60165182/plib_can1.o ${OBJECTDIR}/_ext/60165520/plib_clk.o ${OBJECTDIR}/_ext/1865200349/plib_evic.o ${OBJECTDIR}/_ext/1865254177/plib_gpio.o ${OBJECTDIR}/_ext/1996599795/plib_power.o ${OBJECTDIR}/_ext/1865569570/plib_rcon.o ${OBJECTDIR}/_ext/298189674/plib_spi2_master.o ${OBJECTDIR}/_ext/1865657120/plib_uart1.o ${OBJECTDIR}/_ext/60184501/plib_wdt.o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ${OBJECTDIR}/_ext/1171490990/initialization.o ${OBJECTDIR}/_ext/1171490990/interrupts.o ${OBJECTDIR}/_ext/1171490990/exceptions.o ${OBJECTDIR}/_ext/519438381/heap_4.o ${OBJECTDIR}/_ext/428457472/port.o ${OBJECTDIR}/_ext/428457472/port_asm.o ${OBJECTDIR}/_ext/1489609866/timers.o ${OBJECTDIR}/_ext/1489609866/event_groups.o ${OBJECTDIR}/_ext/1489609866/list.o ${OBJECTDIR}/_ext/1489609866/queue.o ${OBJECTDIR}/_ext/1489609866/stream_buffer.o ${OBJECTDIR}/_ext/1489609866/tasks.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1891831671/bms_flags.o ${OBJECTDIR}/_ext/1891831671/prueba_claude.o

# Source Files
SOURCEFILES=C:/Users/adria/MPLABXProjects/BMS_LV.X/libs/fsm/fsm.c C:/Users/adria/MPLABXProjects/BMS_LV.X/app/fsm/fsm_error_leds.c C:/Users/adria/MPLABXProjects/BMS_LV.X/app/fsm/fsm_serial_cli.c C:/Users/adria/MPLABXProjects/BMS_LV.X/app/fsm/fsm_bms_mode.c ../src/config/default/peripheral/adc/plib_adc.c ../src/config/default/peripheral/can/plib_can1.c ../src/config/default/peripheral/clk/plib_clk.c ../src/config/default/peripheral/evic/plib_evic.c ../src/config/default/peripheral/gpio/plib_gpio.c ../src/config/default/peripheral/power/plib_power.c ../src/config/default/peripheral/rcon/plib_rcon.c ../src/config/default/peripheral/spi/spi_master/plib_spi2_master.c ../src/config/default/peripheral/uart/plib_uart1.c ../src/config/default/peripheral/wdt/plib_wdt.c ../src/config/default/stdio/xc32_monitor.c ../src/config/default/initialization.c ../src/config/default/interrupts.c ../src/config/default/exceptions.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MemMang/heap_4.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MPLAB/PIC32MX/port.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MPLAB/PIC32MX/port_asm.S C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/timers.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/event_groups.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/list.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/queue.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/stream_buffer.c C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/tasks.c ../src/main.c C:/Users/adria/MPLABXProjects/BMS_LV.X/app/bms/src/bms_flags.c C:/Users/adria/MPLABXProjects/BMS_LV.X/app/bms/src/prueba_claude.c



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
${OBJECTDIR}/_ext/428457472/port_asm.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MPLAB/PIC32MX/port_asm.S  .generated_files/flags/default/437a149335068faa485bf69dd21915982832b365 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/428457472" 
	@${RM} ${OBJECTDIR}/_ext/428457472/port_asm.o.d 
	@${RM} ${OBJECTDIR}/_ext/428457472/port_asm.o 
	@${RM} ${OBJECTDIR}/_ext/428457472/port_asm.o.ok ${OBJECTDIR}/_ext/428457472/port_asm.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1 -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/428457472/port_asm.o.d"  -o ${OBJECTDIR}/_ext/428457472/port_asm.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MPLAB/PIC32MX/port_asm.S  -DXPRJ_default=$(CND_CONF)    -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/428457472/port_asm.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK5=1,-I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/_ext/428457472/port_asm.o.d" "${OBJECTDIR}/_ext/428457472/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/_ext/428457472/port_asm.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MPLAB/PIC32MX/port_asm.S  .generated_files/flags/default/77f9629f62c55736584c5d5ed1cda5c3925be8b4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/428457472" 
	@${RM} ${OBJECTDIR}/_ext/428457472/port_asm.o.d 
	@${RM} ${OBJECTDIR}/_ext/428457472/port_asm.o 
	@${RM} ${OBJECTDIR}/_ext/428457472/port_asm.o.ok ${OBJECTDIR}/_ext/428457472/port_asm.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/428457472/port_asm.o.d"  -o ${OBJECTDIR}/_ext/428457472/port_asm.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MPLAB/PIC32MX/port_asm.S  -DXPRJ_default=$(CND_CONF)    -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/428457472/port_asm.o.asm.d",--gdwarf-2,-I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/_ext/428457472/port_asm.o.d" "${OBJECTDIR}/_ext/428457472/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/410010953/fsm.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/libs/fsm/fsm.c  .generated_files/flags/default/8d7302a55d7c93b97d096d8267aa5c6de3fcbee9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/410010953" 
	@${RM} ${OBJECTDIR}/_ext/410010953/fsm.o.d 
	@${RM} ${OBJECTDIR}/_ext/410010953/fsm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/410010953/fsm.o.d" -o ${OBJECTDIR}/_ext/410010953/fsm.o C:/Users/adria/MPLABXProjects/BMS_LV.X/libs/fsm/fsm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/411002074/fsm_error_leds.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/app/fsm/fsm_error_leds.c  .generated_files/flags/default/526c3ef548d3dc933c4bc98fecd6e853410e1fe7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/411002074" 
	@${RM} ${OBJECTDIR}/_ext/411002074/fsm_error_leds.o.d 
	@${RM} ${OBJECTDIR}/_ext/411002074/fsm_error_leds.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/411002074/fsm_error_leds.o.d" -o ${OBJECTDIR}/_ext/411002074/fsm_error_leds.o C:/Users/adria/MPLABXProjects/BMS_LV.X/app/fsm/fsm_error_leds.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/411002074/fsm_serial_cli.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/app/fsm/fsm_serial_cli.c  .generated_files/flags/default/6355fbe8a62d5dd5d51b8568e6a9b1eafe00e03f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/411002074" 
	@${RM} ${OBJECTDIR}/_ext/411002074/fsm_serial_cli.o.d 
	@${RM} ${OBJECTDIR}/_ext/411002074/fsm_serial_cli.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/411002074/fsm_serial_cli.o.d" -o ${OBJECTDIR}/_ext/411002074/fsm_serial_cli.o C:/Users/adria/MPLABXProjects/BMS_LV.X/app/fsm/fsm_serial_cli.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/411002074/fsm_bms_mode.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/app/fsm/fsm_bms_mode.c  .generated_files/flags/default/882704fcb879c1410526cb249db9dbcbe3af6a27 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/411002074" 
	@${RM} ${OBJECTDIR}/_ext/411002074/fsm_bms_mode.o.d 
	@${RM} ${OBJECTDIR}/_ext/411002074/fsm_bms_mode.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/411002074/fsm_bms_mode.o.d" -o ${OBJECTDIR}/_ext/411002074/fsm_bms_mode.o C:/Users/adria/MPLABXProjects/BMS_LV.X/app/fsm/fsm_bms_mode.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60163342/plib_adc.o: ../src/config/default/peripheral/adc/plib_adc.c  .generated_files/flags/default/b13f5b34ef0d4e0e826296bacf106b188ee0516f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60163342" 
	@${RM} ${OBJECTDIR}/_ext/60163342/plib_adc.o.d 
	@${RM} ${OBJECTDIR}/_ext/60163342/plib_adc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/60163342/plib_adc.o.d" -o ${OBJECTDIR}/_ext/60163342/plib_adc.o ../src/config/default/peripheral/adc/plib_adc.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60165182/plib_can1.o: ../src/config/default/peripheral/can/plib_can1.c  .generated_files/flags/default/a6c378dde1f3b7f85cf0374dea89ccef88f724f6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60165182" 
	@${RM} ${OBJECTDIR}/_ext/60165182/plib_can1.o.d 
	@${RM} ${OBJECTDIR}/_ext/60165182/plib_can1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/60165182/plib_can1.o.d" -o ${OBJECTDIR}/_ext/60165182/plib_can1.o ../src/config/default/peripheral/can/plib_can1.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60165520/plib_clk.o: ../src/config/default/peripheral/clk/plib_clk.c  .generated_files/flags/default/3c6b38500ed71db8548784da7cb4289fd3513b3a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60165520" 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/60165520/plib_clk.o.d" -o ${OBJECTDIR}/_ext/60165520/plib_clk.o ../src/config/default/peripheral/clk/plib_clk.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865200349/plib_evic.o: ../src/config/default/peripheral/evic/plib_evic.c  .generated_files/flags/default/dffcdc89fa2945d8b002da7637fe3cf74837b8e6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865200349" 
	@${RM} ${OBJECTDIR}/_ext/1865200349/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865200349/plib_evic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1865200349/plib_evic.o.d" -o ${OBJECTDIR}/_ext/1865200349/plib_evic.o ../src/config/default/peripheral/evic/plib_evic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865254177/plib_gpio.o: ../src/config/default/peripheral/gpio/plib_gpio.c  .generated_files/flags/default/a55d424bb8b4330793bd2bc03bb99e17f6069fa6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865254177" 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/1865254177/plib_gpio.o ../src/config/default/peripheral/gpio/plib_gpio.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1996599795/plib_power.o: ../src/config/default/peripheral/power/plib_power.c  .generated_files/flags/default/654bee2fc6d1264eb0411a912fb0b1e56ff4a404 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1996599795" 
	@${RM} ${OBJECTDIR}/_ext/1996599795/plib_power.o.d 
	@${RM} ${OBJECTDIR}/_ext/1996599795/plib_power.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1996599795/plib_power.o.d" -o ${OBJECTDIR}/_ext/1996599795/plib_power.o ../src/config/default/peripheral/power/plib_power.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865569570/plib_rcon.o: ../src/config/default/peripheral/rcon/plib_rcon.c  .generated_files/flags/default/3cb7a54d1c504ce8293c6b26ac4aa43a1b563a96 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865569570" 
	@${RM} ${OBJECTDIR}/_ext/1865569570/plib_rcon.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865569570/plib_rcon.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1865569570/plib_rcon.o.d" -o ${OBJECTDIR}/_ext/1865569570/plib_rcon.o ../src/config/default/peripheral/rcon/plib_rcon.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/298189674/plib_spi2_master.o: ../src/config/default/peripheral/spi/spi_master/plib_spi2_master.c  .generated_files/flags/default/5139079ee3f837b333c6990d91d77a6803e5bf5c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/298189674" 
	@${RM} ${OBJECTDIR}/_ext/298189674/plib_spi2_master.o.d 
	@${RM} ${OBJECTDIR}/_ext/298189674/plib_spi2_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/298189674/plib_spi2_master.o.d" -o ${OBJECTDIR}/_ext/298189674/plib_spi2_master.o ../src/config/default/peripheral/spi/spi_master/plib_spi2_master.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865657120/plib_uart1.o: ../src/config/default/peripheral/uart/plib_uart1.c  .generated_files/flags/default/b6b84340825a1af677951ece9bd187ca491b212d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865657120" 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1865657120/plib_uart1.o.d" -o ${OBJECTDIR}/_ext/1865657120/plib_uart1.o ../src/config/default/peripheral/uart/plib_uart1.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60184501/plib_wdt.o: ../src/config/default/peripheral/wdt/plib_wdt.c  .generated_files/flags/default/9fd2b5de6ebb575fa3585caf42635c679e1dcd33 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60184501" 
	@${RM} ${OBJECTDIR}/_ext/60184501/plib_wdt.o.d 
	@${RM} ${OBJECTDIR}/_ext/60184501/plib_wdt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/60184501/plib_wdt.o.d" -o ${OBJECTDIR}/_ext/60184501/plib_wdt.o ../src/config/default/peripheral/wdt/plib_wdt.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/163028504/xc32_monitor.o: ../src/config/default/stdio/xc32_monitor.c  .generated_files/flags/default/7fb29ab3b6fa0e635cf9a105ae7b39fb27c53f1b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/163028504" 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ../src/config/default/stdio/xc32_monitor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/initialization.o: ../src/config/default/initialization.c  .generated_files/flags/default/b921d187754dd7bfe80149397f8b265bf30cea2d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/initialization.o.d" -o ${OBJECTDIR}/_ext/1171490990/initialization.o ../src/config/default/initialization.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/interrupts.o: ../src/config/default/interrupts.c  .generated_files/flags/default/d5ec76a37d3b1c4a2c7bcf612acff4ac3abe8aa4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/interrupts.o.d" -o ${OBJECTDIR}/_ext/1171490990/interrupts.o ../src/config/default/interrupts.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/exceptions.o: ../src/config/default/exceptions.c  .generated_files/flags/default/4ae468aa031a4c4d1d65dfd48f4b8f18829361fc .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/exceptions.o.d" -o ${OBJECTDIR}/_ext/1171490990/exceptions.o ../src/config/default/exceptions.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/519438381/heap_4.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MemMang/heap_4.c  .generated_files/flags/default/74f4aad944b17a829511aa8d5123c6fff094624d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/519438381" 
	@${RM} ${OBJECTDIR}/_ext/519438381/heap_4.o.d 
	@${RM} ${OBJECTDIR}/_ext/519438381/heap_4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/519438381/heap_4.o.d" -o ${OBJECTDIR}/_ext/519438381/heap_4.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MemMang/heap_4.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/428457472/port.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MPLAB/PIC32MX/port.c  .generated_files/flags/default/e0a8137ee573417a8dd5ae238cce2b49fcedcd77 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/428457472" 
	@${RM} ${OBJECTDIR}/_ext/428457472/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/428457472/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/428457472/port.o.d" -o ${OBJECTDIR}/_ext/428457472/port.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MPLAB/PIC32MX/port.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/timers.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/timers.c  .generated_files/flags/default/12df9aa239c389a181b5d0b690b5898c161b5525 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/timers.o.d" -o ${OBJECTDIR}/_ext/1489609866/timers.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/event_groups.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/event_groups.c  .generated_files/flags/default/1e6b893c18bbda981129c5f3450ef5c569b8c91 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/event_groups.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/event_groups.o.d" -o ${OBJECTDIR}/_ext/1489609866/event_groups.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/event_groups.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/list.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/list.c  .generated_files/flags/default/ad4e7bc4cf4e9fd20ded6cca1c7a7182d63124be .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/list.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/list.o.d" -o ${OBJECTDIR}/_ext/1489609866/list.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/list.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/queue.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/queue.c  .generated_files/flags/default/1bb7adc5a0b1e007261f1afe4562589a9b94411b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/queue.o.d" -o ${OBJECTDIR}/_ext/1489609866/queue.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/queue.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/stream_buffer.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/stream_buffer.c  .generated_files/flags/default/dade76f8a64165114026fb2864ae38548017607a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/stream_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/stream_buffer.o.d" -o ${OBJECTDIR}/_ext/1489609866/stream_buffer.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/stream_buffer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/tasks.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/tasks.c  .generated_files/flags/default/716c18c92b1fb19f52ddab03eb222f20ca166bdd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/tasks.o.d" -o ${OBJECTDIR}/_ext/1489609866/tasks.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/tasks.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/default/20e27f75b402039bcaf5f93d76d68d6698570c33 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1891831671/bms_flags.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/app/bms/src/bms_flags.c  .generated_files/flags/default/f3d28d2994baf0ccc588d2a8e98d87f9bf788c34 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1891831671" 
	@${RM} ${OBJECTDIR}/_ext/1891831671/bms_flags.o.d 
	@${RM} ${OBJECTDIR}/_ext/1891831671/bms_flags.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1891831671/bms_flags.o.d" -o ${OBJECTDIR}/_ext/1891831671/bms_flags.o C:/Users/adria/MPLABXProjects/BMS_LV.X/app/bms/src/bms_flags.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1891831671/prueba_claude.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/app/bms/src/prueba_claude.c  .generated_files/flags/default/f5bff6ececb9598f714b38374bc45d3d9f2ba0f7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1891831671" 
	@${RM} ${OBJECTDIR}/_ext/1891831671/prueba_claude.o.d 
	@${RM} ${OBJECTDIR}/_ext/1891831671/prueba_claude.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1891831671/prueba_claude.o.d" -o ${OBJECTDIR}/_ext/1891831671/prueba_claude.o C:/Users/adria/MPLABXProjects/BMS_LV.X/app/bms/src/prueba_claude.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/410010953/fsm.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/libs/fsm/fsm.c  .generated_files/flags/default/ae35512ece44b28b30c64361852870e2b3228473 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/410010953" 
	@${RM} ${OBJECTDIR}/_ext/410010953/fsm.o.d 
	@${RM} ${OBJECTDIR}/_ext/410010953/fsm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/410010953/fsm.o.d" -o ${OBJECTDIR}/_ext/410010953/fsm.o C:/Users/adria/MPLABXProjects/BMS_LV.X/libs/fsm/fsm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/411002074/fsm_error_leds.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/app/fsm/fsm_error_leds.c  .generated_files/flags/default/7410a0cb0e8cade9b5de6933f91bab427afc0a93 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/411002074" 
	@${RM} ${OBJECTDIR}/_ext/411002074/fsm_error_leds.o.d 
	@${RM} ${OBJECTDIR}/_ext/411002074/fsm_error_leds.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/411002074/fsm_error_leds.o.d" -o ${OBJECTDIR}/_ext/411002074/fsm_error_leds.o C:/Users/adria/MPLABXProjects/BMS_LV.X/app/fsm/fsm_error_leds.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/411002074/fsm_serial_cli.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/app/fsm/fsm_serial_cli.c  .generated_files/flags/default/9c5818717109ee64232039b15de212b7653a48d0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/411002074" 
	@${RM} ${OBJECTDIR}/_ext/411002074/fsm_serial_cli.o.d 
	@${RM} ${OBJECTDIR}/_ext/411002074/fsm_serial_cli.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/411002074/fsm_serial_cli.o.d" -o ${OBJECTDIR}/_ext/411002074/fsm_serial_cli.o C:/Users/adria/MPLABXProjects/BMS_LV.X/app/fsm/fsm_serial_cli.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/411002074/fsm_bms_mode.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/app/fsm/fsm_bms_mode.c  .generated_files/flags/default/2ce1c4715cf4618f87ff5523e5092ff9d35bf6b2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/411002074" 
	@${RM} ${OBJECTDIR}/_ext/411002074/fsm_bms_mode.o.d 
	@${RM} ${OBJECTDIR}/_ext/411002074/fsm_bms_mode.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/411002074/fsm_bms_mode.o.d" -o ${OBJECTDIR}/_ext/411002074/fsm_bms_mode.o C:/Users/adria/MPLABXProjects/BMS_LV.X/app/fsm/fsm_bms_mode.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60163342/plib_adc.o: ../src/config/default/peripheral/adc/plib_adc.c  .generated_files/flags/default/438aa6a6cb0881e2861f21b1a48ac19313dd0412 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60163342" 
	@${RM} ${OBJECTDIR}/_ext/60163342/plib_adc.o.d 
	@${RM} ${OBJECTDIR}/_ext/60163342/plib_adc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/60163342/plib_adc.o.d" -o ${OBJECTDIR}/_ext/60163342/plib_adc.o ../src/config/default/peripheral/adc/plib_adc.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60165182/plib_can1.o: ../src/config/default/peripheral/can/plib_can1.c  .generated_files/flags/default/1469bd9988f12d2b5eb13d3b343e2fb33da68af1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60165182" 
	@${RM} ${OBJECTDIR}/_ext/60165182/plib_can1.o.d 
	@${RM} ${OBJECTDIR}/_ext/60165182/plib_can1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/60165182/plib_can1.o.d" -o ${OBJECTDIR}/_ext/60165182/plib_can1.o ../src/config/default/peripheral/can/plib_can1.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60165520/plib_clk.o: ../src/config/default/peripheral/clk/plib_clk.c  .generated_files/flags/default/7de20ca8012458cc3b5143652aa1f6dc37f6d7c9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60165520" 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/60165520/plib_clk.o.d" -o ${OBJECTDIR}/_ext/60165520/plib_clk.o ../src/config/default/peripheral/clk/plib_clk.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865200349/plib_evic.o: ../src/config/default/peripheral/evic/plib_evic.c  .generated_files/flags/default/58a575f97bd73f8f3c004dc4ab677cbd810d54f5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865200349" 
	@${RM} ${OBJECTDIR}/_ext/1865200349/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865200349/plib_evic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1865200349/plib_evic.o.d" -o ${OBJECTDIR}/_ext/1865200349/plib_evic.o ../src/config/default/peripheral/evic/plib_evic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865254177/plib_gpio.o: ../src/config/default/peripheral/gpio/plib_gpio.c  .generated_files/flags/default/ff9e99426600a3904634ec67c0627dab806972ef .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865254177" 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/1865254177/plib_gpio.o ../src/config/default/peripheral/gpio/plib_gpio.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1996599795/plib_power.o: ../src/config/default/peripheral/power/plib_power.c  .generated_files/flags/default/bab42590ac217613cbea9b62f6b00c02aa8086c9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1996599795" 
	@${RM} ${OBJECTDIR}/_ext/1996599795/plib_power.o.d 
	@${RM} ${OBJECTDIR}/_ext/1996599795/plib_power.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1996599795/plib_power.o.d" -o ${OBJECTDIR}/_ext/1996599795/plib_power.o ../src/config/default/peripheral/power/plib_power.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865569570/plib_rcon.o: ../src/config/default/peripheral/rcon/plib_rcon.c  .generated_files/flags/default/158027f7e597cdcd42bbc166c202d2f077bf67ec .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865569570" 
	@${RM} ${OBJECTDIR}/_ext/1865569570/plib_rcon.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865569570/plib_rcon.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1865569570/plib_rcon.o.d" -o ${OBJECTDIR}/_ext/1865569570/plib_rcon.o ../src/config/default/peripheral/rcon/plib_rcon.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/298189674/plib_spi2_master.o: ../src/config/default/peripheral/spi/spi_master/plib_spi2_master.c  .generated_files/flags/default/564635049ebeb844f95a3b4f901baf607e6b077 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/298189674" 
	@${RM} ${OBJECTDIR}/_ext/298189674/plib_spi2_master.o.d 
	@${RM} ${OBJECTDIR}/_ext/298189674/plib_spi2_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/298189674/plib_spi2_master.o.d" -o ${OBJECTDIR}/_ext/298189674/plib_spi2_master.o ../src/config/default/peripheral/spi/spi_master/plib_spi2_master.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865657120/plib_uart1.o: ../src/config/default/peripheral/uart/plib_uart1.c  .generated_files/flags/default/124bc2ea5d6e3fcb2933d0cdd5a81233a253e34b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865657120" 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1865657120/plib_uart1.o.d" -o ${OBJECTDIR}/_ext/1865657120/plib_uart1.o ../src/config/default/peripheral/uart/plib_uart1.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60184501/plib_wdt.o: ../src/config/default/peripheral/wdt/plib_wdt.c  .generated_files/flags/default/ab3d7961b4f449b0217521c8cea4b3a9f4fa8c2e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60184501" 
	@${RM} ${OBJECTDIR}/_ext/60184501/plib_wdt.o.d 
	@${RM} ${OBJECTDIR}/_ext/60184501/plib_wdt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/60184501/plib_wdt.o.d" -o ${OBJECTDIR}/_ext/60184501/plib_wdt.o ../src/config/default/peripheral/wdt/plib_wdt.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/163028504/xc32_monitor.o: ../src/config/default/stdio/xc32_monitor.c  .generated_files/flags/default/ea7f4bd8d07e4cdaf6c33f8e7f5f9675c5df435a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/163028504" 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ../src/config/default/stdio/xc32_monitor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/initialization.o: ../src/config/default/initialization.c  .generated_files/flags/default/f0b49dd77488abc2680a7e2dd4443d5af17b0bbd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/initialization.o.d" -o ${OBJECTDIR}/_ext/1171490990/initialization.o ../src/config/default/initialization.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/interrupts.o: ../src/config/default/interrupts.c  .generated_files/flags/default/fd9bf7bdedfe81739b7f6ef7aa732b2eeb96a3a1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/interrupts.o.d" -o ${OBJECTDIR}/_ext/1171490990/interrupts.o ../src/config/default/interrupts.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/exceptions.o: ../src/config/default/exceptions.c  .generated_files/flags/default/6e9decf39d1081e475f4455e404690dd6e1567f3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/exceptions.o.d" -o ${OBJECTDIR}/_ext/1171490990/exceptions.o ../src/config/default/exceptions.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/519438381/heap_4.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MemMang/heap_4.c  .generated_files/flags/default/2b73c26e01283c61aff4af60618762a56697c429 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/519438381" 
	@${RM} ${OBJECTDIR}/_ext/519438381/heap_4.o.d 
	@${RM} ${OBJECTDIR}/_ext/519438381/heap_4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/519438381/heap_4.o.d" -o ${OBJECTDIR}/_ext/519438381/heap_4.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MemMang/heap_4.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/428457472/port.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MPLAB/PIC32MX/port.c  .generated_files/flags/default/3214a26269c607093500d67d94ac8b49775fe8d3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/428457472" 
	@${RM} ${OBJECTDIR}/_ext/428457472/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/428457472/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/428457472/port.o.d" -o ${OBJECTDIR}/_ext/428457472/port.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/portable/MPLAB/PIC32MX/port.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/timers.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/timers.c  .generated_files/flags/default/933a68061d74c8fa0522de6bfe9f729906f2bc40 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/timers.o.d" -o ${OBJECTDIR}/_ext/1489609866/timers.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/event_groups.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/event_groups.c  .generated_files/flags/default/aa60fb06e6a68fe2904070ecc588b029f042afda .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/event_groups.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/event_groups.o.d" -o ${OBJECTDIR}/_ext/1489609866/event_groups.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/event_groups.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/list.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/list.c  .generated_files/flags/default/8a99fcadb0b3e585849122d7da820a1c4614237 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/list.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/list.o.d" -o ${OBJECTDIR}/_ext/1489609866/list.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/list.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/queue.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/queue.c  .generated_files/flags/default/11651321c7e285bd6fb89fd3985549a1fe7ce75c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/queue.o.d" -o ${OBJECTDIR}/_ext/1489609866/queue.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/queue.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/stream_buffer.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/stream_buffer.c  .generated_files/flags/default/92e2aa5e0934bd894c40b180ddecc453e47f64a1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/stream_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/stream_buffer.o.d" -o ${OBJECTDIR}/_ext/1489609866/stream_buffer.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/stream_buffer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1489609866/tasks.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/tasks.c  .generated_files/flags/default/fbbc3cb4b10b351fbfc8bb1c7fc94f5dd27b084c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1489609866" 
	@${RM} ${OBJECTDIR}/_ext/1489609866/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1489609866/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1489609866/tasks.o.d" -o ${OBJECTDIR}/_ext/1489609866/tasks.o C:/Users/adria/MPLABXProjects/BMS_LV.X/freeRTOS/tasks.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/default/a8317d005a2053960ba83683c27a60aa4c8a41ec .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1891831671/bms_flags.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/app/bms/src/bms_flags.c  .generated_files/flags/default/3a0ce083ab48f0b9b4b15696f63b2eda14dd40 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1891831671" 
	@${RM} ${OBJECTDIR}/_ext/1891831671/bms_flags.o.d 
	@${RM} ${OBJECTDIR}/_ext/1891831671/bms_flags.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1891831671/bms_flags.o.d" -o ${OBJECTDIR}/_ext/1891831671/bms_flags.o C:/Users/adria/MPLABXProjects/BMS_LV.X/app/bms/src/bms_flags.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1891831671/prueba_claude.o: C:/Users/adria/MPLABXProjects/BMS_LV.X/app/bms/src/prueba_claude.c  .generated_files/flags/default/a0a22e4dfdaa4b4072de29484ce22a1e60e851b1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1891831671" 
	@${RM} ${OBJECTDIR}/_ext/1891831671/prueba_claude.o.d 
	@${RM} ${OBJECTDIR}/_ext/1891831671/prueba_claude.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"freeRTOS" -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MX" -I"libs/fsm" -I"app/fsm" -I"app/bms/header" -I"app/bms/src" -I"app/bms" -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default" -MP -MMD -MF "${OBJECTDIR}/_ext/1891831671/prueba_claude.o.d" -o ${OBJECTDIR}/_ext/1891831671/prueba_claude.o C:/Users/adria/MPLABXProjects/BMS_LV.X/app/bms/src/prueba_claude.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
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
