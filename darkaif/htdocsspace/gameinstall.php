<?php
echo 'INSTLALLER';
include('config.php');

include('system/member_install.php');
include('system/galaxy_installer.php');
include('system/solarsystem_installer.php');
include('system/planet_installer.php');
include('system/debris_installer.php');

include('system/building_installer.php');
include('system/querybuilding_installer.php');
include('system/technologytree_installer.php');

//install_solarsystem();
//install_planet();
//install_debris();
//install_galaxy();
//install_member();

install_technologytree();
install_building();
install_querybuilding();
?>