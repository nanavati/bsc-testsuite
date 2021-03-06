import Connectable::*;
import SenderReceiver::*;

(*synthesize*)
module sysSimpleConnect1(Empty);
   SingletonInout send <- mkSender(`value);
   SingletonInout recv <- mkReceiver();
   mkConnection(recv.iioo, send.iioo);  //flip me
   Reg#(int) count <- mkReg(0);
   rule increment;
      count <= count + 1;
   endrule
   
   rule stop (count==1);
      $finish(0);
   endrule
      
endmodule
