within IDEAS.Fluid.FixedResistances.Validation.PlugFlowPipes.Data;
record PipeDataULg151204_1
  "Experimental data from ULg's pipe test bench from December 4, 2015 (1);
  increase followed by a decrease in temperature"
  extends IDEAS.Fluid.FixedResistances.Validation.PlugFlowPipes.Data.BaseClasses.PipeDataULg(
    final n=5,
    T_start_out=14.0,
    T_start_in=14.0,
    m_flowIni=1.618,
    data=[0,1.618,14.4,14,14.2,14; 2.9,1.618,14.4,14,14.3,16.8; 5.8,1.618,14.4,
        14,15.5,20.5; 8.7,1.618,14.4,14.1,17.3,22.9; 11.6,1.618,14.4,14.1,19,
        24.6; 14.5,1.618,14.4,14.1,20.5,25.8; 17.3,1.618,14.4,14.1,21.8,26.7;
        20.2,1.618,14.4,14.1,22.9,27.4; 23.2,1.618,14.4,14.2,23.8,27.9; 26.2,
        1.618,14.4,14.2,24.6,28.3; 29.2,1.618,14.5,14.3,25.3,28.6; 32.3,1.618,
        14.5,14.3,25.8,28.9; 35.2,1.618,14.5,14.3,26.3,29.1; 38.1,1.618,14.5,
        14.2,26.7,29.3; 41,1.618,14.5,14.2,27,29.4; 43.9,1.618,14.4,14.2,27.3,
        29.5; 47,1.618,14.4,14.2,27.6,29.6; 50.5,1.618,14.4,14.2,27.9,29.7;
        53.5,1.618,14.4,14.3,28,29.8; 56.4,1.618,14.5,14.8,28.2,29.9; 59.2,
        1.618,14.8,15.7,28.3,29.9; 63.6,1.618,15.8,17.2,28.5,29.9; 66.6,1.618,
        16.6,18.2,28.6,29.9; 69.5,1.618,17.5,19.3,28.7,29.9; 72.4,1.618,18.5,
        20.4,28.8,29.9; 76.4,1.618,19.8,21.8,28.9,30; 79.3,1.618,20.7,22.7,28.9,
        30; 82.2,1.618,21.6,23.6,29,30; 85.1,1.618,22.4,24.4,29,30; 88,1.618,
        23.2,25.1,29.1,30; 92.7,1.618,24.2,26.1,29.2,30.1; 95.7,1.618,24.8,26.7,
        29.2,30.1; 98.6,1.618,25.3,27.1,29.3,30.1; 101.5,1.618,25.8,27.5,29.3,
        30.2; 105.5,1.618,26.3,28,29.4,30.2; 108.5,1.618,26.6,28.4,29.4,30.2;
        111.4,1.618,26.9,28.6,29.4,30.2; 114.3,1.618,27.2,28.8,29.5,30.2; 117.3,
        1.618,27.4,29,29.5,30.2; 120.2,1.618,27.6,29.2,29.5,30.1; 123.1,1.618,
        27.7,29.3,29.5,30.1; 126,1.618,27.9,29.4,29.5,30.1; 129,1.618,28,29.5,
        29.5,30.1; 131.9,1.618,28.1,29.6,29.5,30.1; 134.9,1.618,28.2,29.7,29.5,
        30.1; 137.8,1.618,28.3,29.7,29.5,30.1; 141,1.618,28.4,29.8,29.6,30.2;
        143.8,1.618,28.5,29.9,29.6,30.2; 146.8,1.618,28.5,29.9,29.6,30.2; 149.8,
        1.618,28.6,30,29.6,30.2; 152.7,1.618,28.6,30,29.6,30.3; 155.7,1.618,
        28.7,30,29.7,30.3; 158.6,1.618,28.7,30,29.7,30.3; 161.5,1.618,28.8,30.1,
        29.7,30.3; 164.6,1.618,28.8,30.1,29.7,30.3; 167.5,1.618,28.8,30.1,29.7,
        30.3; 170.5,1.618,28.9,30.1,29.8,30.3; 173.4,1.618,28.9,30.1,29.8,30.3;
        176.3,1.618,28.9,30.2,29.8,30.3; 179.3,1.618,29,30.2,29.8,30.3; 182.2,
        1.618,29,30.2,29.8,30.3; 185.1,1.618,29,30.2,29.8,30.3; 188.1,1.618,29,
        30.2,29.8,30.3; 191,1.618,29,30.2,29.8,30.3; 194,1.618,29,30.2,29.8,
        30.3; 196.9,1.618,29,30.2,29.8,30.3; 199.8,1.618,29.1,30.2,29.8,30.3;
        202.8,1.618,29.1,30.2,29.8,30.3; 205.7,1.618,29.1,30.2,29.8,30.3; 208.7,
        1.618,29.1,30.2,29.8,30.3; 211.6,1.618,29.1,30.2,29.8,30.3; 214.6,1.618,
        29.1,30.2,29.8,30.3; 218.7,1.618,29.2,30.3,29.8,30.3; 221.7,1.618,29.2,
        30.3,29.9,30.3; 225.6,1.618,29.2,30.3,29.9,30.3; 228.6,1.618,29.2,30.3,
        29.8,30.3; 233.6,1.618,29.3,30.3,29.9,30.3; 236.5,1.618,29.3,30.3,29.9,
        30.3; 239.4,1.618,29.3,30.3,29.9,30.3; 242.4,1.618,29.3,30.3,29.9,30.3;
        245.7,1.618,29.3,30.3,29.9,30.3; 248.7,1.618,29.3,30.3,29.9,30.3; 251.6,
        1.618,29.3,30.3,29.9,30.4; 254.5,1.618,29.3,30.3,30,30.4; 257.4,1.618,
        29.3,30.3,30,30.4; 260.4,1.618,29.3,30.3,30,30.4; 265.5,1.618,29.4,30.3,
        30,30.3; 268.4,1.618,29.4,30.3,30,30.3; 271.6,1.618,29.4,30.3,30,30.3;
        274.6,1.618,29.4,30.3,30,30.3; 277.7,1.618,29.4,30.3,30,30.4; 281.4,
        1.618,29.4,30.3,30,30.4; 284.4,1.618,29.4,30.3,30,30.4; 289.3,1.618,
        29.4,30.3,30,30.4; 292.3,1.618,29.4,30.3,30,30.4; 295.2,1.618,29.4,30.3,
        30,30.3; 298.1,1.618,29.4,30.3,30,30.4; 301.1,1.618,29.4,30.3,30,30.3;
        304,1.618,29.4,30.3,30,30.3; 307,1.618,29.5,30.3,30,30.3; 310.1,1.618,
        29.5,30.3,30,30.3; 313,1.618,29.5,30.4,30,30.3; 317.1,1.618,29.5,30.4,
        30,30.3; 320.1,1.618,29.5,30.4,30,30.3; 323,1.618,29.5,30.3,30,30.3;
        325.9,1.618,29.5,30.4,30,30.4; 330.1,1.618,29.5,30.4,30,30.3; 333.1,
        1.618,29.5,30.4,30,30.3; 336,1.618,29.5,30.4,30,30.4]);
  annotation (Documentation(revisions="<html>
<ul>
<li>
October 14, 2015 by Kevin Sartor:<br/>
Add some information about the test.
</li>
<li>
October 12, 2015 by Marcus Fuchs:<br/>
Add rudimentary documentation and integrate into experimental pipe package
</li>
<li>
October 7, 2015 by Kevin Sartor:<br/>
First implementation.
</li>
</ul>
</html>", info="<html>
<p>
This data record contains the experimental data from the
long test bench carried out at the University of Liège.
See <a href=\"IDEAS.Fluid.FixedResistances.Validation.PlugFlowPipes.Data.BaseClasses.PipeDataULg\">
IDEAS.Fluid.FixedResistances.Validation.PlugFlowPipes.Data.BaseClasses.PipeDataULg</a>
for more information.
</p>
</html>"));
end PipeDataULg151204_1;
