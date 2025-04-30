  { config, pkgs, ... }:
 { environment.gnome.excludePackages = with pkgs; [
  epiphany     
  gedit        
  totem        
  yelp         
  geary        
  gnome-calendar     
  gnome-contacts     
  gnome-maps      
  gnome-music     
  gnome-photos     
  gnome-tour     
  evince        
  cheese                
  gnome-clocks           
  gnome-weather        
  gnome-calculator       
  simple-scan             
  gnome-system-monitor
  atomix
  gnome-characters
  hitori
  iagno
  tali
  
];
 }