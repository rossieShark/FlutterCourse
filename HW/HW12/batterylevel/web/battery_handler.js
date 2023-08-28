window.addEventListener('load', function() {
  if ('getBattery' in navigator) {
    navigator.getBattery().then(function(battery) {
      var simulatedBatteryLevel = 0.5; // Initial simulated battery level (50%)

      function updateAllBatteryInfo() {
        updateChargeInfo();
        updateLevelInfo();
      }

      function updateChargeInfo() {
        console.log('Battery charging?', battery.charging ? 'Yes' : 'No');
      }

      function updateLevelInfo() {
        console.log('Battery level:', simulatedBatteryLevel * 100 + '%');
        // Here you could update your Flutter app's battery level as well
        // For example: FlutterBatteryPlugin.updateBatteryLevel(simulatedBatteryLevel * 100);
      }

      updateAllBatteryInfo();

      battery.addEventListener('chargingchange', function() {
        updateChargeInfo();
      });

      battery.addEventListener('levelchange', function() {
        simulatedBatteryLevel = Math.random(); // Generate a random value for simulation
        updateLevelInfo();
      });
    });
  } else {
    console.log('Battery Status API is not supported in this browser.');
  }
});