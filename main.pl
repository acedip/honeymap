#!/usr/bin/perl
use strict;
use warnings;
use Gtk2 '-init';		# auto-initializes Gtk2
use Gtk2::GladeXML;

###Application Versions necessary to use as stated below or above 
##Glade V-3.6.3
##Gtk+ V-2.16
##UI Parser - GtkBuilder

#### Widget Hierarchy ####
# Window
#	main_vbox
#		statusbar
#		menubar
#		hpaned1
#			vbuttonbox1
#			hpaned2
#				vpaned1

# Load the UI from the Glade-3 file
my $glade = Gtk2::Builder->new;
$glade->add_from_file('main.glade');
#$glade->add_from_file('feed.glade');

# Connect the signal handlers
$glade->connect_signals('main');

# Start it up
Gtk2->main;

#----------------------------------------------------------------------
# Signal handlers, connected to signals we defined using glade-3

# Window [X]-button close
sub on_window_delete_event {Gtk2->main_quit;}
sub on_window_destroy_event {Gtk2->main_quit;}
# Window menu_quit-button close
sub on_menu_quit_activate {on_window_delete_event;}    

#sub on_drawingarea_button_press_event {

#about menu show widget
my $about = $glade->get_object('menu_about');
sub on_menu_about_activate {$glade->get_object('menu_about')->show_all;}

sub on_dialog_action_area1_delete_event {$glade->get_object('menu_about')->hide;}
