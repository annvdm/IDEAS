within IDEAS.Thermal.Components.Production;
model Boiler
  "Modulating boiler with losses to environment, based on performance tables"
  extends
    IDEAS.Thermal.Components.Production.Interfaces.PartialDynamicHeaterWithLosses(
      final heaterType=IDEAS.Thermal.Components.Production.BaseClasses.HeaterType.Boiler);

  Real eta "Instanteanous efficiency";

  IDEAS.Thermal.Components.Production.BaseClasses.Burner
                                                   heatSource(
    medium=medium,
    QDesign=QNom,
    TBoilerSet=TSet,
    TEnvironment=heatPort.T,
    UALoss=UALoss,
    THxIn=heatedFluid.T_a,
    m_flowHx=heatedFluid.flowPort_a.m_flow)
    annotation (Placement(transformation(extent={{-68,20},{-48,40}})));
equation
  // Electricity consumption for electronics and fan only.  Pump is covered by pumpHeater;
  // This data is taken from Viessmann VitoDens 300W, smallest model.  So only valid for
  // very small household condensing gas boilers.
  PEl = 7 + heatSource.modulation/100 * (33-7);
  PFuel = heatSource.PFuel;
  eta = heatSource.eta;
  connect(heatSource.heatPort, heatedFluid.heatPort) annotation (Line(
      points={{-48,30},{-20,30},{-20,6.12323e-016}},
      color={191,0,0},
      smooth=Smooth.None));
  annotation (Diagram(graphics), Icon(graphics={
        Ellipse(
          extent={{-58,60},{60,-60}},
          lineColor={127,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={255,255,255}),
        Ellipse(extent={{-46,46},{48,-46}}, lineColor={95,95,95}),
        Line(
          points={{-30,34},{32,-34}},
          color={95,95,95},
          smooth=Smooth.None),
        Line(
          points={{100,20},{44,20}},
          color={0,0,127},
          smooth=Smooth.None),
        Line(
          points={{102,-40},{70,-40},{70,-80},{0,-80},{0,-46}},
          color={0,0,127},
          smooth=Smooth.None)}),
    Documentation(info="<html>
<p><b>Description</b> </p>
<p>Dynamic boiler model, based on interpolation in performance tables. The boiler has thermal losses to the environment which are often not mentioned in the performance tables. Therefore, the additional environmental heat losses are added to the heat production in order to ensure the same performance as in the manufacturers data, while still obtaining a dynamic model with heat losses (also when boiler is off). The IdealHeatSource will compute the required power and the environmental heat losses, and try to reach the set point. </p>
<p>See<a href=\"modelica://IDEAS.Thermal.Components.Production.Interfaces.PartialDynamicHeaterWithLosses\"> IDEAS.Thermal.Components.Production.Interfaces.PartialDynamicHeaterWithLosses</a> for more details about the heat losses and dynamics. </p>
<p><h4>Assumptions and limitations </h4></p>
<p><ol>
<li>Dynamic model based on water content and lumped dry capacity</li>
<li>Limited power (based on QNom and interpolation tables in heatSource) </li>
<li>Heat losses to environment which are compensated &apos;artifically&apos; to meet the manufacturers data in steady state conditions</li>
</ol></p>
<p><h4>Model use</h4></p>
<p>This model is based on performance tables of a specific boiler, as specified by <a href=\"modelica://IDEAS.Thermal.Components.Production.BaseClasses.Burner\">IDEAS.Thermal.Components.Production.BaseClasses.Burne</a>r.  If a different gas boiler is to be simulated, create a different Burner model with adapted interpolation tables.</p>
<p><ol>
<li>Specify medium and initial temperature (of the water + dry mass)</li>
<li>Specify the nominal power</li>
<li>Connect TSet, the flowPorts and the heatPort to environment. </li>
</ol></p>
<p>See also<a href=\"modelica://IDEAS.Thermal.Components.Production.Interfaces.PartialDynamicHeaterWithLosses\"> IDEAS.Thermal.Components.Production.Interfaces.PartialDynamicHeaterWithLosses</a> for more details about the heat losses and dynamics. </p>
<p><h4>Validation </h4></p>
<p>The model has been verified in order to check if the &apos;arrtificial&apos; heat loss compensation still leads to correct steady state efficiencies according to the manufacturer data.  This verification is integrated in the example model <a href=\"modelica://IDEAS.Thermal.Components.Examples.Boiler_validation\">IDEAS.Thermal.Components.Examples.Boiler_validation</a>.</p>
<p><h4>Example</h4></p>
<p>See validation.</p>
</html>", revisions="<html>
<p><ul>
<li>2013 May, Roel De Coninck: documentation</li>
<li>2011 August, Roel De Coninck: first version</li>
</ul></p>
</html>"));
end Boiler;
