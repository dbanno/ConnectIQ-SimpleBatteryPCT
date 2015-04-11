using Toybox.WatchUi as Ui;
using Toybox.System as Sys;
using Toybox.Graphics as Gfx;

class BatteryPCTView extends Ui.View {

    //! Load your resources here
    function onLayout(dc) {
        //setLayout(Rez.Layouts.MainLayout(dc));
    }

    //! Restore the state of the app and prepare the view to be shown
    function onShow() {
    }

    //! Update the view
    function onUpdate(dc) {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
        var width = dc.getWidth();
        var height = dc.getHeight();
        dc.clear();
        dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_TRANSPARENT);
        dc.fillRectangle(0, 0, width, height);
        dc.setColor(Gfx.COLOR_BLUE, Gfx.COLOR_BLACK);
        var stats = Sys.getSystemStats();
      	var battery = stats.battery * 100;
      	//.toFloat();
      	dc.drawText(10, height/4, Gfx.FONT_LARGE, "Battery Level:", Gfx.TEXT_JUSTIFY_LEFT);
      	
      	if (battery >= .50){
      		dc.setColor(Gfx.COLOR_GREEN, Gfx.COLOR_BLACK);
  		}
      	else if ( (battery >= .25) && (battery < .50)){
      		dc.setColor(Gfx.COLOR_YELLOW, Gfx.COLOR_BLACK);
      	}else{
      		dc.setColor(Gfx.COLOR_RED, Gfx.COLOR_BLACK);
  		}
  		
        dc.drawText(width/2, height/2, Gfx.FONT_NUMBER_HOT, battery.format("%4.2f") + "%", Gfx.TEXT_JUSTIFY_CENTER);
      
    }

    //! Called when this View is removed from the screen. Save the
    //! state of your app here.
    function onHide() {
    }

}