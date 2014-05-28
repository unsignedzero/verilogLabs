// Lab 9 Sequential Circuit Lab
// Edited by David Tran
// Version 0.2.0.0

`include "fig5p16.v"

module fig5p16_tb (t_y_out);

  output t_y_out ;
  wire t_y_out ;

  reg t_x_in ;
  reg t_clock ;
  reg t_reset ;

  fig5p16 M0 (t_y_out,t_x_in,t_clock,t_reset);

  initial #200 $finish;

  initial
    begin
      t_clock=0;
      forever #5 t_clock=~t_clock;
    end

  initial fork
    t_reset=0;
    #2 t_reset=1;
    #87 t_reset=0;
    #89 t_reset=1;
    #10 t_x_in=1;
    #30 t_x_in=0;
    #40 t_x_in=1;
    #50 t_x_in = 0;
    #52 t_x_in = 1;
    #54 t_x_in = 0;
    #80 t_x_in = 1;
    #100 t_x_in = 0;
    #120 t_x_in = 1;
    #160 t_x_in = 0;
    #170 t_x_in = 1;
  join

  initial
    begin
      $monitor("time=%0d",$time,,"X=%b Y=%b", t_x_in, t_y_out);
      #200
      $finish;
    end

endmodule
