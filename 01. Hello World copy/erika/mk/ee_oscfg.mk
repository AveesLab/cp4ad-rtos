# ###*B*###
#
# ERIKA Enterprise - a tiny RTOS for small microcontrollers
# 
# Copyright (C) 2002-2018 Evidence Srl
# 
# This file is part of ERIKA Enterprise.
# 
# See LICENSE file.
#
# ###*E*###

############################################################################
#
# This file is generated by RT-Druid.
# Please do not modify it.
#
############################################################################

############################################################################
#
# User options
#
############################################################################
OS_EE_OPT += DEBUG


############################################################################
#
# Automatic options
#
############################################################################
OS_EE_OPT += OSEE_CPU_CLOCK (invalidU)
OS_EE_OPT += OSEE_HAS_AUTOSTART_TASK
OS_EE_OPT += OSEE_HAS_EVENTS
OS_EE_OPT += OSEE_HAS_RESOURCES
OS_EE_OPT += OSEE_MONO_STACK
OS_EE_OPT += OSEE_OC_ECC2
OS_EE_OPT += OS_EE_ARCH_AVR8
OS_EE_OPT += OS_EE_ARCH_AVR8_ATMEGA
OS_EE_OPT += OS_EE_GCC
OS_EE_OPT += OS_EE_KERNEL_OSEK
OS_EE_OPT += OS_EE_RTD_BUILD_ENV_CYGWIN
OS_EE_OPT += OS_EE_RTD_DISABLE_OS_EE_OPT_DEFINES

OS_EE_LIB_OPT += OS_EE_LIB_ARDUINO_SDK
OS_EE_LIB_OPT += OS_EE_LIB_ARDUINO_SDK_CC
OS_EE_LIB_OPT += OS_EE_LIB_ARDUINO_SDK_CC_1_8_16
OS_EE_LIB_OPT += OS_EE_LIB_ARDUINO_SDK_SA
OS_EE_LIB_OPT += OS_EE_LIB_ARDUINO_UNO_328

export OS_EE_LIB_OPT




############################################################################
#
# Path check and conversion
#
############################################################################
-include $(OS_EE_BASE_DIR)/mk/ee_path_helper.mk
-include $(ERIKA_FILES)/mk/ee_path_helper.mk


############################################################################
#
# Arduino SDK path
#
############################################################################
$(eval $(call check_and_set_cygwin_compiler_path,ARDUINO_SDK_FILES,preference_avr8__path_for_arduino_sdk not defined))


############################################################################
#
# Compiler path
#
############################################################################
$(eval $(call check_and_set_cygwin_compiler_path,AVR_TOOLS,${ARDUINO_SDK_FILES}/hardware/tools/avr))


############################################################################
#
# Init MCU for AVR8 (MEGA)
#
############################################################################
OS_EE_AVR8_MCU := atmega328p
export OS_EE_AVR8_MCU


############################################################################
#
# Flags
#
############################################################################
CFLAGS  +=
export CFLAGS

ASFLAGS +=
export ASFLAGS

LDFLAGS +=
export LDFLAGS

LDDEPS  +=
export LDDEPS

LIBS    +=
export LIBS


############################################################################
#
# Sources
#
############################################################################
OS_EE_CFG_SRCS +=
OS_EE_CFG_SRCS += ee_oscfg.c
export OS_EE_CFG_SRCS


############################################################################
#
# End
#
############################################################################

