ActiveAdmin.register Invite do

  menu :priority => 2

  permit_params :host, :guest, :visitor, :party, :email



  
  

end