# Define: dns::server::options
#
# BIND server template-based configuration definition.
#
# Parameters:
#  $forwarders:
#   Array of forwarders IP addresses. Default: empty
#  $allow_querys:
#   Array of access lists or IP addresses which is allowed to query DNS. Default: empty
#  $allow_querys_cache:
#   Array of access lists or IP addresses which is allowed to use query-cache. Default: empty
# $group:
#	Group of the file. Default: bind
# $owner:
#   Owner of the file. Default: bind
#
# Sample Usage :
#  dns::server::options { '/etc/bind/named.conf.options':
#    'forwarders' => [ '8.8.8.8', '8.8.4.4' ],
#   }
#
define dns::server::options (
  $forwarders = [],
  $allow_querys       = [],
  $allow_querys_cache = [],
) {

  include dns::server::params
  file { $title:
    ensure  => present,
    owner   => $owner,
    group   => $group,
    mode    => '0644',
    require => [File[$dns::server::params::cfg_dir], Class['dns::server::install']],
	content => template("${dns::server::params::module_name}/named.conf.options.erb"),
    notify  => Class['dns::server::service'],
  }

}
