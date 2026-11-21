startZ <- null;
targetHeight <- 200.0;
isFinished <- false;

function Launch() {
    if (isFinished)
        return;

    local pos = self.GetOrigin();

    if (startZ == null) {
        startZ = pos.z;
        //ClientPrint(null, 3, "[Launch] Init | startZ = " + startZ + " | targetZ = " + (startZ + targetHeight));
    }

    local climbed = pos.z - startZ;

    if (climbed >= targetHeight) {
        isFinished = true;
        self.SetVelocity(Vector(-50, 0, 150));
        return;
    }

    self.SetOrigin(pos + Vector(0, 0, 12));
    self.SetVelocity(Vector(0, 0, 780));
    return 0.01;
}