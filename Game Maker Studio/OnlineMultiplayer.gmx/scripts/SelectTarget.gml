/// SelectTarget();

// Check to see if there are viable targets
if (targetsNumber >= 1) {
   var tempTarget = instance_nearest(x, y, oPlayer);
   // Make sure the target is alive
   if (tempTarget.isAlive) {
      target = tempTarget
   } else {
      // Search for another target
      for (var i = 0; i < targetsNumber; i++) {
          tempTarget = instance_find(oPlayer, i);
          var dist = distance_to_object(tempTarget);
          
          // Target was found within chase distance
          if (tempTarget.isAlive && dist <= chaseDist) {
             target = tempTarget;
             break;
          }
      }
   }
   
}
