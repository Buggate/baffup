ActiveAdmin.register Notification do

  menu :priority => 2

  permit_params :title, :venue, :date, :host, :picture


end