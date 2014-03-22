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

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/mnt/linux-data/opt/xilinx/projects/listing3.17/barrel_shifter.vhd";
extern char *IEEE_P_2592010699;



static void work_a_1384461182_3093473187_p_0(char *t0)
{
    char t22[16];
    char t24[16];
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned char t7;
    unsigned char t8;
    char *t9;
    char *t10;
    int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned char t15;
    char *t16;
    char *t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t23;
    char *t25;
    char *t26;
    int t27;
    unsigned int t28;
    unsigned char t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;

LAB0:    xsi_set_current_line(43, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = (0 - 2);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = (t7 == (unsigned char)3);
    if (t8 != 0)
        goto LAB3;

LAB4:
LAB7:    t34 = (t0 + 1192U);
    t35 = *((char **)t34);
    t34 = (t0 + 3912);
    t36 = (t34 + 56U);
    t37 = *((char **)t36);
    t38 = (t37 + 56U);
    t39 = *((char **)t38);
    memcpy(t39, t35, 8U);
    xsi_driver_first_trans_fast(t34);

LAB2:    t40 = (t0 + 3800);
    *((int *)t40) = 1;

LAB1:    return;
LAB3:    t9 = (t0 + 1192U);
    t10 = *((char **)t9);
    t11 = (0 - 7);
    t12 = (t11 * -1);
    t13 = (1U * t12);
    t14 = (0 + t13);
    t9 = (t10 + t14);
    t15 = *((unsigned char *)t9);
    t16 = (t0 + 1192U);
    t17 = *((char **)t16);
    t18 = (7 - 7);
    t19 = (t18 * 1U);
    t20 = (0 + t19);
    t16 = (t17 + t20);
    t23 = ((IEEE_P_2592010699) + 4000);
    t25 = (t24 + 0U);
    t26 = (t25 + 0U);
    *((int *)t26) = 7;
    t26 = (t25 + 4U);
    *((int *)t26) = 1;
    t26 = (t25 + 8U);
    *((int *)t26) = -1;
    t27 = (1 - 7);
    t28 = (t27 * -1);
    t28 = (t28 + 1);
    t26 = (t25 + 12U);
    *((unsigned int *)t26) = t28;
    t21 = xsi_base_array_concat(t21, t22, t23, (char)99, t15, (char)97, t16, t24, (char)101);
    t28 = (1U + 7U);
    t29 = (8U != t28);
    if (t29 == 1)
        goto LAB5;

LAB6:    t26 = (t0 + 3912);
    t30 = (t26 + 56U);
    t31 = *((char **)t30);
    t32 = (t31 + 56U);
    t33 = *((char **)t32);
    memcpy(t33, t21, 8U);
    xsi_driver_first_trans_fast(t26);
    goto LAB2;

LAB5:    xsi_size_not_matching(8U, t28, 0);
    goto LAB6;

LAB8:    goto LAB2;

}

static void work_a_1384461182_3093473187_p_1(char *t0)
{
    char t20[16];
    char t22[16];
    char t27[16];
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned char t7;
    unsigned char t8;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t21;
    char *t23;
    char *t24;
    int t25;
    unsigned int t26;
    char *t28;
    int t29;
    unsigned char t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;

LAB0:    xsi_set_current_line(46, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = (1 - 2);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = (t7 == (unsigned char)3);
    if (t8 != 0)
        goto LAB3;

LAB4:
LAB7:    t35 = (t0 + 1672U);
    t36 = *((char **)t35);
    t35 = (t0 + 3976);
    t37 = (t35 + 56U);
    t38 = *((char **)t37);
    t39 = (t38 + 56U);
    t40 = *((char **)t39);
    memcpy(t40, t36, 8U);
    xsi_driver_first_trans_fast(t35);

LAB2:    t41 = (t0 + 3816);
    *((int *)t41) = 1;

LAB1:    return;
LAB3:    t9 = (t0 + 1672U);
    t10 = *((char **)t9);
    t11 = (7 - 1);
    t12 = (t11 * 1U);
    t13 = (0 + t12);
    t9 = (t10 + t13);
    t14 = (t0 + 1672U);
    t15 = *((char **)t14);
    t16 = (7 - 7);
    t17 = (t16 * 1U);
    t18 = (0 + t17);
    t14 = (t15 + t18);
    t21 = ((IEEE_P_2592010699) + 4000);
    t23 = (t22 + 0U);
    t24 = (t23 + 0U);
    *((int *)t24) = 1;
    t24 = (t23 + 4U);
    *((int *)t24) = 0;
    t24 = (t23 + 8U);
    *((int *)t24) = -1;
    t25 = (0 - 1);
    t26 = (t25 * -1);
    t26 = (t26 + 1);
    t24 = (t23 + 12U);
    *((unsigned int *)t24) = t26;
    t24 = (t27 + 0U);
    t28 = (t24 + 0U);
    *((int *)t28) = 7;
    t28 = (t24 + 4U);
    *((int *)t28) = 2;
    t28 = (t24 + 8U);
    *((int *)t28) = -1;
    t29 = (2 - 7);
    t26 = (t29 * -1);
    t26 = (t26 + 1);
    t28 = (t24 + 12U);
    *((unsigned int *)t28) = t26;
    t19 = xsi_base_array_concat(t19, t20, t21, (char)97, t9, t22, (char)97, t14, t27, (char)101);
    t26 = (2U + 6U);
    t30 = (8U != t26);
    if (t30 == 1)
        goto LAB5;

LAB6:    t28 = (t0 + 3976);
    t31 = (t28 + 56U);
    t32 = *((char **)t31);
    t33 = (t32 + 56U);
    t34 = *((char **)t33);
    memcpy(t34, t19, 8U);
    xsi_driver_first_trans_fast(t28);
    goto LAB2;

LAB5:    xsi_size_not_matching(8U, t26, 0);
    goto LAB6;

LAB8:    goto LAB2;

}

static void work_a_1384461182_3093473187_p_2(char *t0)
{
    char t20[16];
    char t22[16];
    char t27[16];
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned char t7;
    unsigned char t8;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t21;
    char *t23;
    char *t24;
    int t25;
    unsigned int t26;
    char *t28;
    int t29;
    unsigned char t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;

LAB0:    xsi_set_current_line(49, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = (2 - 2);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = (t7 == (unsigned char)3);
    if (t8 != 0)
        goto LAB3;

LAB4:
LAB7:    t35 = (t0 + 1832U);
    t36 = *((char **)t35);
    t35 = (t0 + 4040);
    t37 = (t35 + 56U);
    t38 = *((char **)t37);
    t39 = (t38 + 56U);
    t40 = *((char **)t39);
    memcpy(t40, t36, 8U);
    xsi_driver_first_trans_fast_port(t35);

LAB2:    t41 = (t0 + 3832);
    *((int *)t41) = 1;

LAB1:    return;
LAB3:    t9 = (t0 + 1832U);
    t10 = *((char **)t9);
    t11 = (7 - 3);
    t12 = (t11 * 1U);
    t13 = (0 + t12);
    t9 = (t10 + t13);
    t14 = (t0 + 1672U);
    t15 = *((char **)t14);
    t16 = (7 - 7);
    t17 = (t16 * 1U);
    t18 = (0 + t17);
    t14 = (t15 + t18);
    t21 = ((IEEE_P_2592010699) + 4000);
    t23 = (t22 + 0U);
    t24 = (t23 + 0U);
    *((int *)t24) = 3;
    t24 = (t23 + 4U);
    *((int *)t24) = 0;
    t24 = (t23 + 8U);
    *((int *)t24) = -1;
    t25 = (0 - 3);
    t26 = (t25 * -1);
    t26 = (t26 + 1);
    t24 = (t23 + 12U);
    *((unsigned int *)t24) = t26;
    t24 = (t27 + 0U);
    t28 = (t24 + 0U);
    *((int *)t28) = 7;
    t28 = (t24 + 4U);
    *((int *)t28) = 4;
    t28 = (t24 + 8U);
    *((int *)t28) = -1;
    t29 = (4 - 7);
    t26 = (t29 * -1);
    t26 = (t26 + 1);
    t28 = (t24 + 12U);
    *((unsigned int *)t28) = t26;
    t19 = xsi_base_array_concat(t19, t20, t21, (char)97, t9, t22, (char)97, t14, t27, (char)101);
    t26 = (4U + 4U);
    t30 = (8U != t26);
    if (t30 == 1)
        goto LAB5;

LAB6:    t28 = (t0 + 4040);
    t31 = (t28 + 56U);
    t32 = *((char **)t31);
    t33 = (t32 + 56U);
    t34 = *((char **)t33);
    memcpy(t34, t19, 8U);
    xsi_driver_first_trans_fast_port(t28);
    goto LAB2;

LAB5:    xsi_size_not_matching(8U, t26, 0);
    goto LAB6;

LAB8:    goto LAB2;

}


extern void work_a_1384461182_3093473187_init()
{
	static char *pe[] = {(void *)work_a_1384461182_3093473187_p_0,(void *)work_a_1384461182_3093473187_p_1,(void *)work_a_1384461182_3093473187_p_2};
	xsi_register_didat("work_a_1384461182_3093473187", "isim/barrel_testbench_isim_beh.exe.sim/work/a_1384461182_3093473187.didat");
	xsi_register_executes(pe);
}
