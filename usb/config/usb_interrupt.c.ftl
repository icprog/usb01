<#--
/*******************************************************************************
  USB Framework Interrupt Handler Template File

  File Name:
    usb_interrupt.c

  Summary:
    This file contains source code necessary to place the USB ISR.

  Description:
    
 *******************************************************************************/

/*******************************************************************************
Copyright (c) 2013-2014 released Microchip Technology Inc.  All rights reserved.

Microchip licenses to you the right to use, modify, copy and distribute
Software only when embedded on a Microchip microcontroller or digital signal
controller that is integrated into your product or third party product
(pursuant to the sublicense terms in the accompanying license agreement).

You should refer to the license agreement accompanying this Software for
additional information regarding your rights and obligations.

SOFTWARE AND DOCUMENTATION ARE PROVIDED AS IS WITHOUT WARRANTY OF ANY KIND,
EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION, ANY WARRANTY OF
MERCHANTABILITY, TITLE, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR PURPOSE.
IN NO EVENT SHALL MICROCHIP OR ITS LICENSORS BE LIABLE OR OBLIGATED UNDER
CONTRACT, NEGLIGENCE, STRICT LIABILITY, CONTRIBUTION, BREACH OF WARRANTY, OR
OTHER LEGAL EQUITABLE THEORY ANY DIRECT OR INDIRECT DAMAGES OR EXPENSES
INCLUDING BUT NOT LIMITED TO ANY INCIDENTAL, SPECIAL, INDIRECT, PUNITIVE OR
CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST DATA, COST OF PROCUREMENT OF
SUBSTITUTE GOODS, TECHNOLOGY, SERVICES, OR ANY CLAIMS BY THIRD PARTIES
(INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF), OR OTHER SIMILAR COSTS.
 *******************************************************************************/
 -->
<#if CONFIG_DRV_USB_INTERRUPT_MODE == true>
    <#if CONFIG_USB_DEVICE_INSTANCE_0 == true >
        <#if CONFIG_PIC32MZ == true>
void __ISR(_USB_VECTOR, ipl${CONFIG_DRV_USB_INT_PRIO_NUM_IDX0}) _IntHandlerUSBInstance0(void)
{
            <#if CONFIG_DRV_USB_DEVICE_SUPPORT == true>
    USB_DEVICE_Tasks_ISR(sysObj.usbDevObject0);
            </#if>
}
        <#else>
void __ISR(${CONFIG_DRV_USB_ISR_VECTOR_IDX0}, ipl${CONFIG_DRV_USB_INT_PRIO_NUM_IDX0}) _IntHandlerUSBInstance0(void)
{
            <#if CONFIG_DRV_USB_DEVICE_SUPPORT == true>
    USB_DEVICE_Tasks_ISR(sysObj.usbDevObject0);
            </#if>
}
       </#if>
    </#if>
    <#if CONFIG_USB_HOST_INSTANCE_0 == true >
void __ISR( ${CONFIG_DRV_USB_HOST_ISR_VECTOR_IDX0} , ipl${CONFIG_DRV_USB_HOST_INT_PRIO_NUM_IDX0})_InterruptHandler_USB_stub ( void )
{
    USB_HOST_Tasks_ISR(sysObj.usbHostObject0);
}
    </#if>

    <#if CONFIG_PIC32MZ == true>
        <#if CONFIG_USB_DEVICE_INSTANCE_0 == true >
void __ISR ( _USB_DMA_VECTOR,ipl4 ) _InterruptHandler_USBDMA ( void )
{
    USB_DEVICE_Tasks_ISR_USBDMA(sysObj.usbDevObject0);
}
        </#if>
    </#if>
</#if>

<#--
/*******************************************************************************
 End of File
*/
-->
