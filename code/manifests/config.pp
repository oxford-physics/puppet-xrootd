class xrootd::config (

  $xrootd_user = $xrootd::params::xrootd_user,
  $xrootd_group = $xrootd::params::xrootd_group,

  $xrootd_instances_options = $xrootd::params::xrootd_instances_options,
  $cmsd_instances_options = $xrootd::params::cmsd_instances_options,
  $purd_instances_options = $xrootd::params::purd_instances_options,
  $xfrd_instances_options = $xrootd::params::xfrd_instances_options,

  $exports = $xrootd::params::exports,

  $daemon_corefile_limit = $xrootd::params::daemon_corefile_limit,

  $sysconfigfile = $xrootd::params::sysconfigfile,
  $configfile = $xrootd::params::configfile,
  $configfile_template = $xrootd::params::configfile_template,
  $configdir = $xrootd::params::configdir,
  $logdir = $xrootd::params::logdir,

  # sets 'daemon.trace all' for ofs,xrd,cms,oss
  $xrd_debug = $xrootd::params::xrd_debug,

  $all_adminpath = $xrootd::params::all_adminpath,
  $all_pidpath = $xrootd::params::all_pidpath,
  # all.role for exec xrootd/cmsd
  $xrd_allrole = $xrootd::params::xrd_allrole,
  $cmsd_allrole = $xrootd::params::cmsd_allrole,
  $all_export = $xrootd::params::all_export,
  $all_manager = $xrootd::params::all_manager,
  $all_sitename = $xrootd::params::all_sitename,

  $xrootd_redirect = $xrootd::params::xrootd_redirect,
  $xrootd_export = $xrootd::params::xrootd_export,
  $xrootd_seclib = $xrootd::params::xrootd_seclib,
  $xrootd_async = $xrootd::params::xrootd_async,

  $xrd_port = $xrootd::params::xrd_port,
  $xrd_network = $xrootd::params::xrd_network,
  $xrd_report = $xrootd::config::xrd_report,
  $xrootd_monitor = $xrootd::config::xrootd_monitor,

  $acc_authdb = $xrootd::params::acc_authdb,
  $authfile = $xrootd::params::authfile,
  $authfile_template = $xrootd::params::authfile_template,
  $authfile_content = $xrootd::params::authfile_content,

  $ofs_authlib = $xrootd::params::ofs_authlib,
  $ofs_authorize = $xrootd::params::ofs_authorize,
  $ofs_persist = $xrootd::params::ofs_persist,
  # ofs.osslib for exec xrootd/cmsd
  $xrd_ofsosslib = $xrootd::params::xrd_ofsosslib,
  $cmsd_ofsosslib = $xrootd::params::cmsd_ofsosslib,
  $ofs_cmslib = $xrootd::params::ofs_cmslib,
  $ofs_forward = $xrootd::params::ofs_forward,
  $ofs_tpc = $xrootd::params::ofs_tpc,

  $oss_localroot = $xrootd::params::oss_localroot,

  $sec_protocol = $xrootd::params::sec_protocol,

  $pss_origin = $xrootd::params::pss_origin,
  $pss_setopt = $xrootd::params::pss_setopt

) inherits xrootd::params {

  include fetchcrl

  if $::architecture == "x86_64" {
    $xrdlibdir = "lib64"
  } else {
    $xrdlibdir = "lib"
  }

  file {$configdir:
    ensure	=> directory,
    owner  => $xrootd_user,
    group  => $xrootd_group
  }

  file {$logdir:
    ensure => directory,
    owner  => $xrootd_user,
    group  => $xrootd_group
  }
  #  file {"$configfile":
  #    ensure 	=> file,
  #    content	=> template("xrootd/xrootd.cfg.erb")
  #  }
  #  xrootd::create_config{"$configfile":
  #    content => "xrootd/xrootd.cfg.erb"
  #  }
  #  xrootd::create_config{"/etc/xrootd/test.cfg":
  #    content => "xrootd/xrootd.cfg.erb"
  #  }
  #
}
