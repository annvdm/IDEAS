within IDEAS.Occupants.Stochastic.BaseClasses;
model ActivityProb

  Real[6] actProb "activity probability";

  Modelica.Blocks.Interfaces.IntegerInput occ;

protected
  IDEAS.Occupants.Stochastic.Data.Residential.Activities.WatchingTV actTV;
  IDEAS.Occupants.Stochastic.Data.Residential.Activities.Cooking actCooking;
  IDEAS.Occupants.Stochastic.Data.Residential.Activities.DoingLaundry actLaundry;
  IDEAS.Occupants.Stochastic.Data.Residential.Activities.WashAndDress actWashDress;
  IDEAS.Occupants.Stochastic.Data.Residential.Activities.Ironning actIron;
  IDEAS.Occupants.Stochastic.Data.Residential.Activities.HouseCleaning actHouseClean;

  parameter IDEAS.Occupants.Stochastic.Data.BaseClasses.Activity[:] actData={actTV,
      actCooking,actLaundry,actWashDress,actIron,actHouseClean};
  parameter Integer interval = 600;
  parameter Real[3] seed={7,12,3} "random initialisation";

  discrete Integer t(start=1) "#interval in the period";

  parameter Integer yr = 2010;
  parameter Real DSTstart = 86400*(31+28+31-rem(5*yr/4+4,7))+2*3600;
  parameter Real DSTend = 86400*(31+28+31+30+31+30+31+31+30+31-rem(5*yr/4+1,7))+2*3600;

public
  outer IDEAS.Climate.SimInfoManager   sim
    annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
initial equation

  for i in 1:6 loop
    actProb[i]=0;
  end for;

equation

  when sample(0,interval) then
    if integer(time) == integer(DSTstart) then
      t = if pre(t)+1 <= actData[1].s then pre(t) -5 else 1;
    elseif integer(time) == integer(DSTend) then
       t = if pre(t)+1 <= actData[1].s then pre(t) + 7 else 1;
    else
      t = if pre(t)+1 <= actData[1].s then pre(t) + 1 else 1;
    end if;
  end when;

  when sample(0,interval) then
    for i in 1:6 loop
      if sim.workday >= 0.5 then
        actProb[i]= actData[i].Pwd[t,occ+1];
      else
        actProb[i]= actData[i].Pwe[t,occ+1];
      end if;
    end for;
  end when;

end ActivityProb;