/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Vladimir/Documents/GitHub/Calculator/ascii_2_bcd/ascii_2_bcd.vhd";



static void work_a_1176219433_1446275585_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned char t10;
    unsigned char t11;
    unsigned char t12;
    char *t13;

LAB0:    xsi_set_current_line(50, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 992U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 5248);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(51, ng0);
    t1 = (t0 + 5360);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(52, ng0);
    t1 = xsi_get_transient_memory(6U);
    memset(t1, 0, 6U);
    t2 = t1;
    memset(t2, (unsigned char)2, 6U);
    t5 = (t0 + 5424);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 6U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(53, ng0);
    t1 = xsi_get_transient_memory(4U);
    memset(t1, 0, 4U);
    t2 = t1;
    memset(t2, (unsigned char)2, 4U);
    t5 = (t0 + 5488);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 4U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(54, ng0);
    t1 = (t0 + 5552);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(56, ng0);
    t2 = (t0 + 2312U);
    t6 = *((char **)t2);
    t12 = *((unsigned char *)t6);
    t2 = (t0 + 5360);
    t7 = (t2 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t13 = *((char **)t9);
    *((unsigned char *)t13) = t12;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(57, ng0);
    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t1 = (t0 + 5424);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 6U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(58, ng0);
    t1 = (t0 + 2952U);
    t2 = *((char **)t1);
    t1 = (t0 + 5488);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 4U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(59, ng0);
    t1 = (t0 + 3272U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 5552);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = t3;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB7:    t2 = (t0 + 1032U);
    t5 = *((char **)t2);
    t10 = *((unsigned char *)t5);
    t11 = (t10 == (unsigned char)3);
    t3 = t11;
    goto LAB9;

}

static void work_a_1176219433_1446275585_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned char t6;
    char *t7;
    char *t8;
    unsigned char t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    static char *nl0[] = {&&LAB3, &&LAB4, &&LAB5};

LAB0:    xsi_set_current_line(66, ng0);
    t1 = (t0 + 5616);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(67, ng0);
    t1 = (t0 + 5680);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(68, ng0);
    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t6 = *((unsigned char *)t2);
    t1 = (t0 + 5744);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    *((unsigned char *)t7) = t6;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(69, ng0);
    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t1 = (t0 + 5808);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    memcpy(t7, t2, 6U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(70, ng0);
    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    t1 = (t0 + 5872);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    memcpy(t7, t2, 4U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(71, ng0);
    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t6 = *((unsigned char *)t2);
    t1 = (char *)((nl0) + t6);
    goto **((char **)t1);

LAB2:    t1 = (t0 + 5264);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(73, ng0);
    t3 = (t0 + 5616);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t7 = (t5 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t3);
    xsi_set_current_line(74, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t6 = *((unsigned char *)t2);
    t9 = (t6 == (unsigned char)3);
    if (t9 != 0)
        goto LAB6;

LAB8:
LAB7:    goto LAB2;

LAB4:    xsi_set_current_line(80, ng0);
    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t1 = (t0 + 9289);
    t6 = 1;
    if (6U == 6U)
        goto LAB12;

LAB13:    t6 = 0;

LAB14:    if (t6 != 0)
        goto LAB9;

LAB11:    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t1 = (t0 + 9295);
    t6 = 1;
    if (6U == 6U)
        goto LAB20;

LAB21:    t6 = 0;

LAB22:    if (t6 != 0)
        goto LAB18;

LAB19:    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t1 = (t0 + 9305);
    t6 = 1;
    if (6U == 6U)
        goto LAB28;

LAB29:    t6 = 0;

LAB30:    if (t6 != 0)
        goto LAB26;

LAB27:    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t1 = (t0 + 9315);
    t6 = 1;
    if (6U == 6U)
        goto LAB36;

LAB37:    t6 = 0;

LAB38:    if (t6 != 0)
        goto LAB34;

LAB35:    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t1 = (t0 + 9325);
    t6 = 1;
    if (6U == 6U)
        goto LAB44;

LAB45:    t6 = 0;

LAB46:    if (t6 != 0)
        goto LAB42;

LAB43:    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t1 = (t0 + 9335);
    t6 = 1;
    if (6U == 6U)
        goto LAB52;

LAB53:    t6 = 0;

LAB54:    if (t6 != 0)
        goto LAB50;

LAB51:    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t1 = (t0 + 9345);
    t6 = 1;
    if (6U == 6U)
        goto LAB60;

LAB61:    t6 = 0;

LAB62:    if (t6 != 0)
        goto LAB58;

LAB59:    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t1 = (t0 + 9355);
    t6 = 1;
    if (6U == 6U)
        goto LAB68;

LAB69:    t6 = 0;

LAB70:    if (t6 != 0)
        goto LAB66;

LAB67:    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t1 = (t0 + 9365);
    t6 = 1;
    if (6U == 6U)
        goto LAB76;

LAB77:    t6 = 0;

LAB78:    if (t6 != 0)
        goto LAB74;

LAB75:    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t1 = (t0 + 9375);
    t6 = 1;
    if (6U == 6U)
        goto LAB84;

LAB85:    t6 = 0;

LAB86:    if (t6 != 0)
        goto LAB82;

LAB83:    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t1 = (t0 + 9385);
    t6 = 1;
    if (6U == 6U)
        goto LAB92;

LAB93:    t6 = 0;

LAB94:    if (t6 != 0)
        goto LAB90;

LAB91:
LAB10:    goto LAB2;

LAB5:    xsi_set_current_line(115, ng0);
    t1 = (t0 + 5680);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(116, ng0);
    t1 = (t0 + 5744);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);
    goto LAB2;

LAB6:    xsi_set_current_line(75, ng0);
    t1 = (t0 + 1512U);
    t3 = *((char **)t1);
    t1 = (t0 + 5808);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t7 = (t5 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t3, 6U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(76, ng0);
    t1 = xsi_get_transient_memory(4U);
    memset(t1, 0, 4U);
    t2 = t1;
    memset(t2, (unsigned char)2, 4U);
    t3 = (t0 + 5872);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t7 = (t5 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t1, 4U);
    xsi_driver_first_trans_fast(t3);
    xsi_set_current_line(77, ng0);
    t1 = (t0 + 5744);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);
    goto LAB7;

LAB9:    xsi_set_current_line(81, ng0);
    t7 = (t0 + 5936);
    t8 = (t7 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    *((unsigned char *)t13) = (unsigned char)3;
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(82, ng0);
    t1 = (t0 + 5744);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB10;

LAB12:    t10 = 0;

LAB15:    if (t10 < 6U)
        goto LAB16;
    else
        goto LAB14;

LAB16:    t4 = (t2 + t10);
    t5 = (t1 + t10);
    if (*((unsigned char *)t4) != *((unsigned char *)t5))
        goto LAB13;

LAB17:    t10 = (t10 + 1);
    goto LAB15;

LAB18:    xsi_set_current_line(84, ng0);
    t7 = (t0 + 9301);
    t11 = (t0 + 5872);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t7, 4U);
    xsi_driver_first_trans_fast(t11);
    xsi_set_current_line(85, ng0);
    t1 = (t0 + 5744);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB10;

LAB20:    t10 = 0;

LAB23:    if (t10 < 6U)
        goto LAB24;
    else
        goto LAB22;

LAB24:    t4 = (t2 + t10);
    t5 = (t1 + t10);
    if (*((unsigned char *)t4) != *((unsigned char *)t5))
        goto LAB21;

LAB25:    t10 = (t10 + 1);
    goto LAB23;

LAB26:    xsi_set_current_line(87, ng0);
    t7 = (t0 + 9311);
    t11 = (t0 + 5872);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t7, 4U);
    xsi_driver_first_trans_fast(t11);
    xsi_set_current_line(88, ng0);
    t1 = (t0 + 5744);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB10;

LAB28:    t10 = 0;

LAB31:    if (t10 < 6U)
        goto LAB32;
    else
        goto LAB30;

LAB32:    t4 = (t2 + t10);
    t5 = (t1 + t10);
    if (*((unsigned char *)t4) != *((unsigned char *)t5))
        goto LAB29;

LAB33:    t10 = (t10 + 1);
    goto LAB31;

LAB34:    xsi_set_current_line(90, ng0);
    t7 = (t0 + 9321);
    t11 = (t0 + 5872);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t7, 4U);
    xsi_driver_first_trans_fast(t11);
    xsi_set_current_line(91, ng0);
    t1 = (t0 + 5744);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB10;

LAB36:    t10 = 0;

LAB39:    if (t10 < 6U)
        goto LAB40;
    else
        goto LAB38;

LAB40:    t4 = (t2 + t10);
    t5 = (t1 + t10);
    if (*((unsigned char *)t4) != *((unsigned char *)t5))
        goto LAB37;

LAB41:    t10 = (t10 + 1);
    goto LAB39;

LAB42:    xsi_set_current_line(93, ng0);
    t7 = (t0 + 9331);
    t11 = (t0 + 5872);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t7, 4U);
    xsi_driver_first_trans_fast(t11);
    xsi_set_current_line(94, ng0);
    t1 = (t0 + 5744);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB10;

LAB44:    t10 = 0;

LAB47:    if (t10 < 6U)
        goto LAB48;
    else
        goto LAB46;

LAB48:    t4 = (t2 + t10);
    t5 = (t1 + t10);
    if (*((unsigned char *)t4) != *((unsigned char *)t5))
        goto LAB45;

LAB49:    t10 = (t10 + 1);
    goto LAB47;

LAB50:    xsi_set_current_line(96, ng0);
    t7 = (t0 + 9341);
    t11 = (t0 + 5872);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t7, 4U);
    xsi_driver_first_trans_fast(t11);
    xsi_set_current_line(97, ng0);
    t1 = (t0 + 5744);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB10;

LAB52:    t10 = 0;

LAB55:    if (t10 < 6U)
        goto LAB56;
    else
        goto LAB54;

LAB56:    t4 = (t2 + t10);
    t5 = (t1 + t10);
    if (*((unsigned char *)t4) != *((unsigned char *)t5))
        goto LAB53;

LAB57:    t10 = (t10 + 1);
    goto LAB55;

LAB58:    xsi_set_current_line(99, ng0);
    t7 = (t0 + 9351);
    t11 = (t0 + 5872);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t7, 4U);
    xsi_driver_first_trans_fast(t11);
    xsi_set_current_line(100, ng0);
    t1 = (t0 + 5744);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB10;

LAB60:    t10 = 0;

LAB63:    if (t10 < 6U)
        goto LAB64;
    else
        goto LAB62;

LAB64:    t4 = (t2 + t10);
    t5 = (t1 + t10);
    if (*((unsigned char *)t4) != *((unsigned char *)t5))
        goto LAB61;

LAB65:    t10 = (t10 + 1);
    goto LAB63;

LAB66:    xsi_set_current_line(102, ng0);
    t7 = (t0 + 9361);
    t11 = (t0 + 5872);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t7, 4U);
    xsi_driver_first_trans_fast(t11);
    xsi_set_current_line(103, ng0);
    t1 = (t0 + 5744);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB10;

LAB68:    t10 = 0;

LAB71:    if (t10 < 6U)
        goto LAB72;
    else
        goto LAB70;

LAB72:    t4 = (t2 + t10);
    t5 = (t1 + t10);
    if (*((unsigned char *)t4) != *((unsigned char *)t5))
        goto LAB69;

LAB73:    t10 = (t10 + 1);
    goto LAB71;

LAB74:    xsi_set_current_line(105, ng0);
    t7 = (t0 + 9371);
    t11 = (t0 + 5872);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t7, 4U);
    xsi_driver_first_trans_fast(t11);
    xsi_set_current_line(106, ng0);
    t1 = (t0 + 5744);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB10;

LAB76:    t10 = 0;

LAB79:    if (t10 < 6U)
        goto LAB80;
    else
        goto LAB78;

LAB80:    t4 = (t2 + t10);
    t5 = (t1 + t10);
    if (*((unsigned char *)t4) != *((unsigned char *)t5))
        goto LAB77;

LAB81:    t10 = (t10 + 1);
    goto LAB79;

LAB82:    xsi_set_current_line(108, ng0);
    t7 = (t0 + 9381);
    t11 = (t0 + 5872);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t7, 4U);
    xsi_driver_first_trans_fast(t11);
    xsi_set_current_line(109, ng0);
    t1 = (t0 + 5744);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB10;

LAB84:    t10 = 0;

LAB87:    if (t10 < 6U)
        goto LAB88;
    else
        goto LAB86;

LAB88:    t4 = (t2 + t10);
    t5 = (t1 + t10);
    if (*((unsigned char *)t4) != *((unsigned char *)t5))
        goto LAB85;

LAB89:    t10 = (t10 + 1);
    goto LAB87;

LAB90:    xsi_set_current_line(111, ng0);
    t7 = (t0 + 9391);
    t11 = (t0 + 5872);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t7, 4U);
    xsi_driver_first_trans_fast(t11);
    xsi_set_current_line(112, ng0);
    t1 = (t0 + 5744);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB10;

LAB92:    t10 = 0;

LAB95:    if (t10 < 6U)
        goto LAB96;
    else
        goto LAB94;

LAB96:    t4 = (t2 + t10);
    t5 = (t1 + t10);
    if (*((unsigned char *)t4) != *((unsigned char *)t5))
        goto LAB93;

LAB97:    t10 = (t10 + 1);
    goto LAB95;

}

static void work_a_1176219433_1446275585_p_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(120, ng0);

LAB3:    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    t1 = (t0 + 6000);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 4U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 5280);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_1176219433_1446275585_init()
{
	static char *pe[] = {(void *)work_a_1176219433_1446275585_p_0,(void *)work_a_1176219433_1446275585_p_1,(void *)work_a_1176219433_1446275585_p_2};
	xsi_register_didat("work_a_1176219433_1446275585", "isim/ascii_conv_testbench_isim_beh.exe.sim/work/a_1176219433_1446275585.didat");
	xsi_register_executes(pe);
}
