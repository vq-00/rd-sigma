startZ <- null;
targetHeight <- 1260.0;
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
    self.SetVelocity(Vector(-400, 0, 780));
    return 0.01;
}



startX <- null;
targetDistance <- 500.0; // How many units to push the parasite to the right
isFinished <- false;

function LaunchParasite() {
    if (isFinished)
        return;

    local pos = self.GetOrigin();

    if (startX == null) {
        startX = pos.x;
    }

    local traveled = pos.x - startX;

    // Stop pushing once it reaches the target distance to the right
    if (traveled >= targetDistance) {
        isFinished = true;
        self.SetVelocity(Vector(150, 0, 0));
        return;
    }

    // Push strictly right (+X) with zero upward Z velocity (+2 Z origin avoids floor snagging)
    self.SetOrigin(pos + Vector(12, 0, 2));
    self.SetVelocity(Vector(600, 0, 0));
    return 0.01;
}

startXDrone <- null;
targetDistanceDrone <- 500.0; // How many units to push the parasite to the right
isFinishedDrone <- false;

function LaunchDroneGlass() {
    if (isFinishedDrone)
        return;

    local pos = self.GetOrigin();

    if (startXDrone == null) {
        startXDrone = pos.x;
    }

    local traveled = pos.x - startXDrone;

    // Stop pushing once it reaches the target distance to the right
    if (traveled >= targetDistanceDrone) {
        isFinishedDrone = true;
        self.SetVelocity(Vector(150, 0, 0));
        return;
    }

    // Push strictly right (+X) with zero upward Z velocity (+2 Z origin avoids floor snagging)
    self.SetOrigin(pos + Vector(12, 0, 2));
    self.SetVelocity(Vector(600, 0, 0));
    return 0.01;
}