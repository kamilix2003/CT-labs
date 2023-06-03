1. Goal of the exercise:
  In this exercise, the primary goal is to validate the accuracy and effectiveness of the transient analysis approach using Laplace transformation. This method allows for the examination and understanding of the behavior of electrical circuits during the transient state. By measuring the voltages in both RC and RLC circuits that are subjected to a unit step input, we can observe and analyze the transient response of the circuits. This experimental verification provides valuable insights into the practical application and usefulness of the Laplace transformation technique in electrical circuit analysis.
  
  
  
  
  
  
  <-------
3. Couse of measurments:
  First we tested two circuits: low-pass and high-pass configuration of RC circuit and RLC circuts. After connecting
  osciloscope to the wave generator and prototype board, we generated square wave with Vp2p = 1V, offset = .5V, frequency
  of 100Hz and duty cycle of 50%. Then we read from the osciloscope Voltage value at times 1t, 5t and 10t (where 10t is just
  as failsafe) and time when voltage reaches 10% and 90% of the highest value.
  
  For RLC circuits we tested ho different resistances before RC circuit influence output charactristic. We measured response for
  2 cases: Generator out resistance (50 Ohm) + resistance selected by jumper wire. In our case we tested jumper on 1.1k Ohm resistance
  path and 3.3k Ohm. After that we checked response of the circuit:
     if response was sinusoid with decreasing amplitude - resustance was smaller then RC
     if response was exp. decay if R was higher
     if response was aperiodic critical waveform if resistance was equal RC
