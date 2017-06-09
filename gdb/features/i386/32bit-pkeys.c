/* THIS FILE IS GENERATED.  -*- buffer-read-only: t -*- vi:set ro:
  Original: 32bit-pkeys.xml.tmp */

#ifdef GDBSERVER
#include "tdesc.h"
#else
#include "defs.h"
#include "osabi.h"
#include "target-descriptions.h"
#endif

static int
create_feature_i386_32bit_pkeys (struct target_desc *result, long regnum)
{
  struct tdesc_feature *feature;

  feature = tdesc_create_feature (result, "org.gnu.gdb.i386.pkeys", "32bit-pkeys.xml");
  tdesc_create_reg (feature, "pkru", regnum++, 1, NULL, 32, "uint32");
  return regnum;
}