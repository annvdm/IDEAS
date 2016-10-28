within IDEAS.Buildings.Components;
model SlabOnGround "opaque floor on ground slab"
   extends IDEAS.Buildings.Components.Interfaces.PartialOpaqueSurface(
     QTra_design=UEqui*AWall*(273.15 + 21 - sim.Tdes),
        dT_nominal_a=-3,
    redeclare replaceable Data.Constructions.FloorOnGround constructionType,
    layMul(monLay(energyDynamics=energyDynamicsLayMul)));

  parameter Modelica.SIunits.Length PWall = 4*sqrt(AWall)
    "Total floor slab perimeter";
  parameter Modelica.SIunits.Temperature TeAvg = 273.15+10.8
    "Annual average outdoor temperature";
  parameter Modelica.SIunits.Temperature TiAvg = 273.15+22
    "Annual average indoor temperature";
  parameter Modelica.SIunits.TemperatureDifference dTeAvg = 4
    "Amplitude of variation of monthly average outdoor temperature";
  parameter Modelica.SIunits.TemperatureDifference dTiAvg = 2
    "Amplitude of variation of monthly average indoor temperature";
  parameter Boolean linearise=true
    "= true, if convective heat transfer should be linearised"
    annotation(Dialog(tab="Convection"));
  parameter Modelica.Fluid.Types.Dynamics energyDynamicsLayMul[constructionType.nLay]=
    cat(1, {if energyDynamics == Modelica.Fluid.Types.Dynamics.FixedInitial then Modelica.Fluid.Types.Dynamics.DynamicFreeInitial else energyDynamics}, fill(energyDynamics, constructionType.nLay - 1))
    "Energy dynamics for construction layer";
  Modelica.SIunits.HeatFlowRate Qm = UEqui*AWall*(TiAvg - TeAvg) - Lpi*dTiAvg*cos(2*3.1415/12*(m- 1 + alfa)) + Lpe*dTeAvg*cos(2*3.1415/12*(m - 1 - beta))
    "Two-dimensional correction for edge flow";

//Calculation of heat loss based on ISO 13370
protected
  final parameter IDEAS.Buildings.Data.Materials.Ground ground1(final d=0.50);
  final parameter IDEAS.Buildings.Data.Materials.Ground ground2(final d=0.33);
  final parameter IDEAS.Buildings.Data.Materials.Ground ground3(final d=0.17);
  final parameter Real U_value=1/(1/6 + sum(constructionType.mats.R) + 0)
    "Floor theoretical U-value";

  final parameter Modelica.SIunits.Length B=AWall/(0.5*PWall + 1E-10)
    "Characteristic dimension of the slab on ground";
  final parameter Modelica.SIunits.Length dt=sum(constructionType.mats.d) + ground1.k*1/U_value
    "Equivalent thickness";//Thickness of basement walls assumed to be as the thickness of the slab
  final parameter Real UEqui=if (dt<B) then (2*ground1.k/(Modelica.Constants.pi*B+dt)*Modelica.Math.log(Modelica.Constants.pi*B/dt+1)) else (ground1.k/(0.457*B + dt))
    "Equivalent thermal transmittance coefficient";
  final parameter Real alfa=1.5 - 12/(2*3.14)*atan(dt/(dt + delta));
  final parameter Real beta=1.5 - 0.42*log(delta/(dt + 1));
  final parameter Real delta=sqrt(3.15*10^7*ground1.k/3.14/ground1.rho/ground1.c);
  final parameter Real Lpi=AWall*ground1.k/dt*sqrt(1/((1 + delta/dt)^2 + 1));
  final parameter Real Lpe=0.37*PWall*ground1.k*log(delta/dt + 1);
  Real m = sim.timCal/3.1536e7*12 "time in months";

  BaseClasses.ConductiveHeatTransfer.MultiLayer layGro(
    final A=AWall,
    final inc=inc,
    final nLay=3,
    final mats={ground1,ground2,ground3},
    final T_start={TeAvg,TeAvg,TeAvg})
    "Declaration of array of resistances and capacitances for ground simulation"
    annotation (Placement(transformation(extent={{-20,-10},{-40,10}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow periodicFlow(T_ref=284.15)
                annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-30,22})));
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow adiabaticBoundary(Q_flow=0,
      T_ref=285.15)
    annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
public
  Modelica.Blocks.Math.Product product
    annotation (Placement(transformation(extent={{-30,36},{-38,44}})));
  Modelica.Blocks.Sources.RealExpression Qm_val(y=-Qm)
    annotation (Placement(transformation(extent={{0,50},{-20,70}})));
equation

  connect(periodicFlow.port, layMul.port_b) annotation (Line(points={{-20,22},{
          -14,22},{-14,0},{-10,0}}, color={191,0,0}));
  connect(layGro.port_a, layMul.port_b)
    annotation (Line(points={{-20,0},{-15,0},{-10,0}}, color={191,0,0}));
  connect(layGro.port_b, adiabaticBoundary.port)
    annotation (Line(points={{-40,0},{-45,0},{-50,0}}, color={191,0,0}));
  connect(Qm_val.y, product.u1) annotation (Line(points={{-21,60},{-26,60},{-26,
          42.4},{-29.2,42.4}}, color={0,0,127}));
  connect(product.u2, propsBus_a.weaBus.dummy) annotation (Line(points={{-29.2,37.6},
          {100.1,37.6},{100.1,19.9}}, color={0,0,127}));
  connect(product.y, periodicFlow.Q_flow) annotation (Line(points={{-38.4,40},{-50,
          40},{-50,22},{-40,22}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-50,-100},{50,100}}),
        graphics={
        Rectangle(
          extent={{-50,-90},{50,-70}},
          fillColor={175,175,175},
          fillPattern=FillPattern.Backward,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Line(
          points={{-50,-20},{-30,-20},{-30,-70},{-30,-70},{-30,-70}},
          color={175,175,175},
          smooth=Smooth.None),
        Line(
          points={{-50,-20},{-50,-90},{-50,-90}},
          color={175,175,175},
          smooth=Smooth.None),
        Line(
          points={{-50,60},{-30,60},{-30,80},{50,80}},
          color={175,175,175},
          smooth=Smooth.None),
        Line(
          points={{-50,60},{-50,66},{-50,100},{50,100}},
          color={175,175,175},
          smooth=Smooth.None),
        Line(
          points={{-44,60},{-44,-20}},
          color={175,175,175},
          smooth=Smooth.None),
        Line(
          points={{-50,-70},{50,-70}},
          color={0,0,0},
          thickness=0.5,
          smooth=Smooth.None)}),
    Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-60,-100},{60,100}})),
    Documentation(info="<html>
<p>
This is a floor model that should be used to
simulate floors on solid ground.
See <a href=modelica://IDEAS.Buildings.Components.Interfaces.PartialOpaqueSurface>IDEAS.Buildings.Components.Interfaces.PartialOpaqueSurface</a> 
for equations, options, parameters, validation and dynamics that are common for all surfaces.
</p>
<h4>Typical use and important parameters</h4>
<p>
The model contains several parameters that are used
to set up a simplified model of the influence of the 
environment on the ground themperature.
The model assumes that the floor plate is connected to a (heated)
zone that is surrounded by air at the ambient temperature.
</p>
</html>", revisions="<html>
<ul>
<li>
October 22, 2016, by Filip Jorissen:<br/>
Revised documentation for IDEAS 1.0.
</li>
<li>
September 27, 2016 by Filip Jorissen:<br/>
Different initialisation for state between layMul 
and layGround for avoiding conflicting initial equations.
</li>
<li>
February 10, 2016, by Filip Jorissen and Damien Picard:<br/>
Revised implementation: cleaned up connections and partials.
</li>
<li>
June 14, 2015, Filip Jorissen:<br/>
Adjusted implementation for computing conservation of energy.
</li>
</ul>
</html>"));
end SlabOnGround;
