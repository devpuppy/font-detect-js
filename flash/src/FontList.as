package {
  
  import flash.display.Sprite; 
  import flash.display.LoaderInfo;
  import flash.text.Font;
  import flash.external.ExternalInterface;  
  
  public class FontList extends Sprite {
    
    public function FontList() {   
      var params:Object = loadParams();
      loadExternalInterface(params);
    }    
    
    private function loadParams():Object {
      return LoaderInfo(this.root.loaderInfo).parameters;
    }
    
    private function loadExternalInterface(params:Object):void {
      ExternalInterface.marshallExceptions = true;
      ExternalInterface.addCallback("fonts", fonts);
      var wrapperFunction:String = "fontListReady";
      ExternalInterface.call(wrapperFunction, params.swfObjectId);
    }
    
    public function fonts():Array {
      return Font.enumerateFonts(true);
    }
        
  }
  
}
