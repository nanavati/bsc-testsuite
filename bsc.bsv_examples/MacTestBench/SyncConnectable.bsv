package SyncConnectable;

////////////////////////////////////////////////////////////////////////////////
///
////////////////////////////////////////////////////////////////////////////////

import Clocks::*;

////////////////////////////////////////////////////////////////////////////////
///
////////////////////////////////////////////////////////////////////////////////

typeclass SyncConnectable#(type ta, type tb);
   module mkSyncConnection#(ta left, tb right)
      (Clock clk_left, Reset reset_left, Clock clk_right, Reset reset_right, Empty ignore);
endtypeclass


endpackage
