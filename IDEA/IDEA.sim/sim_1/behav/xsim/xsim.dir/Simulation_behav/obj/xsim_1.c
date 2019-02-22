/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern void execute_406(char*, char *);
extern void execute_38(char*, char *);
extern void execute_39(char*, char *);
extern void execute_40(char*, char *);
extern void execute_41(char*, char *);
extern void execute_42(char*, char *);
extern void execute_104(char*, char *);
extern void execute_105(char*, char *);
extern void execute_106(char*, char *);
extern void execute_107(char*, char *);
extern void execute_110(char*, char *);
extern void execute_111(char*, char *);
extern void execute_203(char*, char *);
extern void execute_44(char*, char *);
extern void execute_45(char*, char *);
extern void execute_46(char*, char *);
extern void execute_47(char*, char *);
extern void execute_48(char*, char *);
extern void execute_49(char*, char *);
extern void execute_50(char*, char *);
extern void execute_51(char*, char *);
extern void execute_52(char*, char *);
extern void execute_54(char*, char *);
extern void execute_55(char*, char *);
extern void execute_56(char*, char *);
extern void execute_57(char*, char *);
extern void execute_58(char*, char *);
extern void execute_59(char*, char *);
extern void execute_60(char*, char *);
extern void execute_61(char*, char *);
extern void execute_62(char*, char *);
extern void execute_64(char*, char *);
extern void execute_65(char*, char *);
extern void execute_66(char*, char *);
extern void execute_67(char*, char *);
extern void execute_68(char*, char *);
extern void execute_69(char*, char *);
extern void execute_70(char*, char *);
extern void execute_71(char*, char *);
extern void execute_72(char*, char *);
extern void execute_74(char*, char *);
extern void execute_75(char*, char *);
extern void execute_76(char*, char *);
extern void execute_77(char*, char *);
extern void execute_78(char*, char *);
extern void execute_79(char*, char *);
extern void execute_80(char*, char *);
extern void execute_81(char*, char *);
extern void execute_82(char*, char *);
extern void execute_84(char*, char *);
extern void execute_85(char*, char *);
extern void execute_86(char*, char *);
extern void execute_87(char*, char *);
extern void execute_88(char*, char *);
extern void execute_89(char*, char *);
extern void execute_90(char*, char *);
extern void execute_91(char*, char *);
extern void execute_92(char*, char *);
extern void execute_94(char*, char *);
extern void execute_95(char*, char *);
extern void execute_96(char*, char *);
extern void execute_97(char*, char *);
extern void execute_98(char*, char *);
extern void execute_99(char*, char *);
extern void execute_100(char*, char *);
extern void execute_101(char*, char *);
extern void execute_102(char*, char *);
extern void execute_115(char*, char *);
extern void execute_116(char*, char *);
extern void execute_121(char*, char *);
extern void execute_122(char*, char *);
extern void execute_126(char*, char *);
extern void execute_127(char*, char *);
extern void execute_132(char*, char *);
extern void execute_133(char*, char *);
extern void execute_137(char*, char *);
extern void execute_138(char*, char *);
extern void execute_143(char*, char *);
extern void execute_144(char*, char *);
extern void execute_148(char*, char *);
extern void execute_149(char*, char *);
extern void execute_154(char*, char *);
extern void execute_155(char*, char *);
extern void execute_159(char*, char *);
extern void execute_160(char*, char *);
extern void execute_165(char*, char *);
extern void execute_166(char*, char *);
extern void execute_170(char*, char *);
extern void execute_171(char*, char *);
extern void execute_176(char*, char *);
extern void execute_177(char*, char *);
extern void execute_181(char*, char *);
extern void execute_182(char*, char *);
extern void execute_187(char*, char *);
extern void execute_188(char*, char *);
extern void execute_192(char*, char *);
extern void execute_193(char*, char *);
extern void execute_197(char*, char *);
extern void execute_198(char*, char *);
extern void execute_109(char*, char *);
extern void execute_214(char*, char *);
extern void execute_215(char*, char *);
extern void execute_224(char*, char *);
extern void execute_225(char*, char *);
extern void execute_226(char*, char *);
extern void execute_227(char*, char *);
extern void execute_207(char*, char *);
extern void execute_209(char*, char *);
funcp funcTab[108] = {(funcp)execute_406, (funcp)execute_38, (funcp)execute_39, (funcp)execute_40, (funcp)execute_41, (funcp)execute_42, (funcp)execute_104, (funcp)execute_105, (funcp)execute_106, (funcp)execute_107, (funcp)execute_110, (funcp)execute_111, (funcp)execute_203, (funcp)execute_44, (funcp)execute_45, (funcp)execute_46, (funcp)execute_47, (funcp)execute_48, (funcp)execute_49, (funcp)execute_50, (funcp)execute_51, (funcp)execute_52, (funcp)execute_54, (funcp)execute_55, (funcp)execute_56, (funcp)execute_57, (funcp)execute_58, (funcp)execute_59, (funcp)execute_60, (funcp)execute_61, (funcp)execute_62, (funcp)execute_64, (funcp)execute_65, (funcp)execute_66, (funcp)execute_67, (funcp)execute_68, (funcp)execute_69, (funcp)execute_70, (funcp)execute_71, (funcp)execute_72, (funcp)execute_74, (funcp)execute_75, (funcp)execute_76, (funcp)execute_77, (funcp)execute_78, (funcp)execute_79, (funcp)execute_80, (funcp)execute_81, (funcp)execute_82, (funcp)execute_84, (funcp)execute_85, (funcp)execute_86, (funcp)execute_87, (funcp)execute_88, (funcp)execute_89, (funcp)execute_90, (funcp)execute_91, (funcp)execute_92, (funcp)execute_94, (funcp)execute_95, (funcp)execute_96, (funcp)execute_97, (funcp)execute_98, (funcp)execute_99, (funcp)execute_100, (funcp)execute_101, (funcp)execute_102, (funcp)execute_115, (funcp)execute_116, (funcp)execute_121, (funcp)execute_122, (funcp)execute_126, (funcp)execute_127, (funcp)execute_132, (funcp)execute_133, (funcp)execute_137, (funcp)execute_138, (funcp)execute_143, (funcp)execute_144, (funcp)execute_148, (funcp)execute_149, (funcp)execute_154, (funcp)execute_155, (funcp)execute_159, (funcp)execute_160, (funcp)execute_165, (funcp)execute_166, (funcp)execute_170, (funcp)execute_171, (funcp)execute_176, (funcp)execute_177, (funcp)execute_181, (funcp)execute_182, (funcp)execute_187, (funcp)execute_188, (funcp)execute_192, (funcp)execute_193, (funcp)execute_197, (funcp)execute_198, (funcp)execute_109, (funcp)execute_214, (funcp)execute_215, (funcp)execute_224, (funcp)execute_225, (funcp)execute_226, (funcp)execute_227, (funcp)execute_207, (funcp)execute_209};
const int NumRelocateId= 108;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/Simulation_behav/xsim.reloc",  (void **)funcTab, 108);
	iki_vhdl_file_variable_register(dp + 55952);
	iki_vhdl_file_variable_register(dp + 56008);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/Simulation_behav/xsim.reloc");
}

void simulate(char *dp)
{
	iki_schedule_processes_at_time_zero(dp, "xsim.dir/Simulation_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/Simulation_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/Simulation_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/Simulation_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
