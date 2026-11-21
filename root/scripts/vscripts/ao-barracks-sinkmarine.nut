function SinkMarine()
{
    if (!("activator" in this) || activator == null || !activator.IsValid()) return;

    local v = activator.GetVelocity();
    local topZ = self.GetOrigin().z + self.GetBoundingMaxs().z;
    local depth = topZ - activator.GetOrigin().z;
    local spd = sqrt(v.x * v.x + v.y * v.y);
    local drag = (spd > 320) ? 0.96 : 0.72;
    local vz = (v.z > 50) ? v.z * 0.85 : 0;

    activator.SetVelocity(Vector(v.x * drag, v.y * drag, vz));

    if (depth < 80)
    {
        activator.SetOrigin(activator.GetOrigin() + Vector(0, 0, -0.25));
    }
}