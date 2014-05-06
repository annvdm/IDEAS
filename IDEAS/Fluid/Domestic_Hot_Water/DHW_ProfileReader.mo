within IDEAS.Fluid.Domestic_Hot_Water;
model DHW_ProfileReader
  "DHW consumption with profile reader.  RealInput mDHW60C is not used."
  import IDEAS;

  extends IDEAS.Fluid.Domestic_Hot_Water.partial_DHW;

  parameter Modelica.SIunits.Volume VDayAvg "Average daily water consumption";
  parameter Integer profileType=1 "Type of the DHW tap profile";
  Real onoff;
  Real m_minimum(start=0);

  Modelica.Blocks.Tables.CombiTable1Ds table(
    tableOnFile=true,
    tableName="data",
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
    columns=2:4,
    fileName="..\\Inputs\\" + "DHWProfile.txt") annotation (Placement(visible=
          true, transformation(
        origin={69.5,89.75},
        extent={{10.5,10.25},{-10.5,-10.25}},
        rotation=0)));

  Modelica.Blocks.Math.Product product1
    annotation (Placement(transformation(extent={{0,80},{-20,100}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=time)
    annotation (Placement(transformation(extent={{120,80},{100,100}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=VDayAvg*
        Medium.density(Medium.setState_phX(
        port_hot.p,
        inStream(port_hot.h_outflow),
        inStream(port_hot.Xi_outflow))))
    annotation (Placement(transformation(extent={{134,46},{62,66}})));
equation
  connect(product1.y, product.u1) annotation (Line(
      points={{-21,90},{-30,90},{-30,56},{-22,56}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(realExpression1.y, table.u) annotation (Line(
      points={{99,90},{103.5,90},{103.5,89.75},{82.1,89.75}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(realExpression2.y, product1.u2) annotation (Line(
      points={{58.4,56},{30,56},{30,84},{2,84}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(table.y[profileType], product1.u1) annotation (Line(
      points={{57.95,89.75},{30,89.75},{30,90},{30,90},{30,96},{2,96}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{140,
            100}}),
            graphics),
    Icon(graphics),
    Documentation(info="<html>
<p><b>Description</b> </p>
<p>Model of a domestic hot water (DHW) system composed mainly of a thermostatic mixing valve and a table for reading the DHW flow rate. </p>
<p>This model is an extension of the <a href=\"modelica://IDEAS.Thermal.Components.Domestic_Hot_Water.partial_DHW\">Partial_DHW</a> model, see there for the documentation.</p>
<p><h4>Examples</h4></p>
<p>An example of this model is given in <a href=\"modelica://IDEAS.Thermal.Components.Examples.StorageTank_DHW_HP\">IDEAS.Thermal.Components.Examples.StorageTank_DHW_HP</a>.</p>
</html>"));
end DHW_ProfileReader;
