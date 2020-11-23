function LandD = LandDfromV(Velocity,Weight,CD0,DragConstant,Area,Rho)
%determines Lift and Drag as function of Velocity

Lift = Weight / (.5 * Rho * Velocity^2 * Area);
Drag = CD0 + DragConstant * Lift^2;

LandD = [Lift Drag];
